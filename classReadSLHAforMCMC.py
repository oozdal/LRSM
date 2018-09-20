import pyslha
import pandas as pd

class ReadSLHA():
    def __init__(self,SLHApath):
        self.SLHA = pyslha.read(SLHApath, ignoreblocks=['SPINFO'])

    def ReadSLHA_Block(self, BlockName, id1=None, id2=None, id3=None):
        self.BlockName       = BlockName
        self.id1             = id1
        self.id2             = id2
        self.id3             = id3

        self.list_all_blocks = self.SLHA.blocks
        self.pyslha_Block    = self.SLHA.blocks[self.BlockName]

        if self.id1 != None and self.id2 == None and self.id3 == None:
            self.VarValue1   = self.pyslha_Block[self.id1]
            return self.VarValue1

        elif self.id1 != None and self.id2 != None and self.id3 == None:
            self.VarValue2   = self.pyslha_Block[self.id1,self.id2]
            return self.VarValue2

        else:
            self.VarValue3   = self.pyslha_Block[self.id1,self.id2,self.id3]
            return self.VarValue3

    def CheckCKMR(self):
        self.CKMR11 = self.ReadSLHA_Block("CKMR", 1, 1)
        self.CKMR12 = self.ReadSLHA_Block("CKMR", 1, 2)
        self.CKMR13 = self.ReadSLHA_Block("CKMR", 1, 3)

        self.CKMR21 = self.ReadSLHA_Block("CKMR", 2, 1)
        self.CKMR22 = self.ReadSLHA_Block("CKMR", 2, 2)
        self.CKMR23 = self.ReadSLHA_Block("CKMR", 2, 3)

        self.CKMR31 = self.ReadSLHA_Block("CKMR", 3, 1)
        self.CKMR32 = self.ReadSLHA_Block("CKMR", 3, 2)
        self.CKMR33 = self.ReadSLHA_Block("CKMR", 3, 3)

        self.firstrow   = abs(self.CKMR11)**2 + abs(self.CKMR12)**2 + abs(self.CKMR13)**2
        self.secondrow  = abs(self.CKMR21)**2 + abs(self.CKMR22)**2 + abs(self.CKMR23)**2
        self.thirdrow   = abs(self.CKMR31)**2 + abs(self.CKMR32)**2 + abs(self.CKMR33)**2

        self.firstcol   = abs(self.CKMR11)**2 + abs(self.CKMR21)**2 + abs(self.CKMR31)**2
        self.secondcol  = abs(self.CKMR12)**2 + abs(self.CKMR22)**2 + abs(self.CKMR32)**2
        self.thirdcol   = abs(self.CKMR13)**2 + abs(self.CKMR23)**2 + abs(self.CKMR33)**2

        self.CKMR_Unitarity = None

        self.Check1stRow = self.firstrow >= 0.99 and self.firstrow <= 1.01
        self.Check2ndRow = self.secondrow >= 0.99 and self.secondrow <= 1.01
        self.Check3rdRow = self.thirdrow >= 0.99 and self.thirdrow <= 1.01

        self.Check1stCol = self.firstcol >= 0.99 and self.firstcol <= 1.01
        self.Check2ndCol = self.secondcol >= 0.99 and self.secondcol <= 1.01
        self.Check3rdCol = self.thirdcol >= 0.99 and self.thirdcol <= 1.01

        self.CheckCKMRrows = self.Check1stRow and self.Check2ndRow and self.Check3rdRow
        self.CheckCKMRcols = self.Check1stCol and self.Check2ndCol and self.Check3rdCol

        self.CKMR_Unitarity = self.CheckCKMRrows and self.CheckCKMRcols

        return self.CKMR_Unitarity


    def CheckSMlikeHiggsMass(self):
        self.SMlikeHiggsMass = self.ReadSLHA_Block("MASS", 25 )

        if self.SMlikeHiggsMass >= 122. and self.SMlikeHiggsMass <= 128.:
            self.LogicSMlikeHiggsMass = True
        else:
            self.LogicSMlikeHiggsMass = False

        return self.LogicSMlikeHiggsMass    

    def CheckBphysics(self):
        self.Bsmumu    = self.ReadSLHA_Block("FLAVORKITQFV", 4006)
        self.BXsgamma  = self.ReadSLHA_Block("FLAVORKITQFV", 200)
        self.RBtaunu   = self.ReadSLHA_Block("FLAVORKITQFV", 503)
        self.DeltaM_Bs = self.ReadSLHA_Block("FLAVORKITQFV", 1900)
        self.DeltaM_Bd = self.ReadSLHA_Block("FLAVORKITQFV", 1902)
        self.DeltaM_K  = self.ReadSLHA_Block("FLAVORKITQFV", 9100)
        self.epsilon_K = self.ReadSLHA_Block("FLAVORKITQFV", 9103)

        self.CheckBsmumu    = None
        self.CheckBXsgamma  = None
        self.CheckRBtaunu   = None
        self.CheckDeltaM_Bs = None
        self.CheckDeltaM_Bd = None
        self.CheckDeltaM_K  = None
        self.CheckEpsilon_K = None

        self.Bphysics = None

        if self.Bsmumu >= 0.8E-11 and self.Bsmumu <= 6.4E-11:       self.CheckBsmumu    = True
        if self.BXsgamma >= 2.99E-4 and self.BXsgamma <= 3.87E-4:   self.CheckBXsgamma  = True
        if self.RBtaunu >= 0.15 and self.RBtaunu <= 2.41:           self.CheckRBtaunu   = True
        if self.DeltaM_Bs >= 10.2 and self.DeltaM_Bs <= 26.4:       self.CheckDeltaM_Bs = True
        if self.DeltaM_Bd >= 0.294 and self.DeltaM_Bd <= 0.762:     self.CheckDeltaM_Bd = True
        if self.DeltaM_K <= 7.00E-15:                               self.CheckDeltaM_K  = True
        if self.epsilon_K <= 2.23E-3:                               self.CheckEpsilon_K = True

        #self.Bphysics = self.CheckRBtaunu and self.CheckBXsgamma and self.CheckDeltaM_Bs and self.CheckDeltaM_Bd
        #self.Bphysics = self.CheckRBtaunu and self.CheckBXsgamma and self.CheckDeltaM_Bd
        #self.Bphysics = self.CheckRBtaunu and self.CheckBXsgamma and self.CheckDeltaM_Bs
        #self.Bphysics = self.CheckBsmumu and self.CheckBXsgamma and self.CheckRBtaunu
        #self.Bphysics = self.CheckRBtaunu and self.CheckBXsgamma
        #self.Bphysics = self.CheckBsmumu
        #self.Bphysics = self.CheckBXsgamma
        self.Bphysics = self.CheckEpsilon_K and self.CheckDeltaM_Bs and self.CheckDeltaM_K and self.CheckBXsgamma
        
        return self.Bphysics

    def CheckBRexist(self):
        self.CheckBRblocks = self.SLHA.decays.has_key(34)
        return self.CheckBRblocks














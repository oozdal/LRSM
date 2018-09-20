import numpy as np
import pandas as pd
import os
import pyslha
from math import *

class MCMC():
    def __init__(self,PathToFreeParams):
        self.PathToFreeParams = PathToFreeParams
        self.freeparamsdata = pd.read_csv(self.PathToFreeParams, sep=",", header=0, names= ["ParamName","LowerLimit", "UpperLimit"])

        self.numberofparameters = len(self.freeparamsdata)

        self.params = {}
        for i in range(self.numberofparameters):
#            self.params.update({self.freeparamsdata["ParamName"][i] : np.random.uniform(self.freeparamsdata["LowerLimit"][i], self.freeparamsdata["UpperLimit"][i]) }) 
            self.params.update({self.freeparamsdata["ParamName"][i] : np.random.normal(self.freeparamsdata["LowerLimit"][i], self.freeparamsdata["UpperLimit"][i]) })

    def CheckFile(self, FullFilePath):
        self.FullFilePath = FullFilePath
        self.SplitFilePath = self.FullFilePath.split("/")
        self.FileName = self.SplitFilePath[-1]

        self.FileElement_list = []
        for i in range(1, len(self.SplitFilePath)-1):
            self.FileElement_list.append("/"+self.SplitFilePath[i])

        self.OnlyFilePath = OnlyFilePath = ""
        for i in range(len(self.FileElement_list)):
            self.OnlyFilePath = self.OnlyFilePath + self.FileElement_list[i]

        return os.path.isfile(self.FullFilePath)    
    
    def GenerateCKMRmatrix(self, InputFileFullPath, OutputFileFullPath , Mix12 = None, Mix13 = None, Mix23 = None):
        self.InputFileFullPath = InputFileFullPath
        self.OutputFileFullPath = OutputFileFullPath
        self.Mix12 = Mix12
        self.Mix13 = Mix13
        self.Mix23 = Mix23

        if self.Mix12 == None and self.Mix13 == None and self.Mix23 == None:
            self.Mix12 = radians(np.random.uniform(0,360))
            self.Mix13 = radians(np.random.uniform(0,360))
            self.Mix23 = radians(np.random.uniform(0,360))
        else:
            pass

        self.CKMRinput11 = cos(self.Mix12)*cos(self.Mix13)
        self.CKMRinput12 = sin(self.Mix12)*cos(self.Mix13)
        self.CKMRinput13 = sin(self.Mix13)
            
        self.CKMRinput21 = -sin(self.Mix12)*cos(self.Mix23)-cos(self.Mix12)*sin(self.Mix23)*sin(self.Mix13)
        self.CKMRinput22 = cos(self.Mix12)*sin(self.Mix23)-sin(self.Mix12)*sin(self.Mix23)*sin(self.Mix13)
        self.CKMRinput23 = sin(self.Mix23)*cos(self.Mix13)

        self.CKMRinput31 = sin(self.Mix12)*sin(self.Mix23)-cos(self.Mix12)*cos(self.Mix23)*sin(self.Mix13)
        self.CKMRinput32 = -cos(self.Mix12)*sin(self.Mix23)-sin(self.Mix12)*cos(self.Mix23)*sin(self.Mix13)
        self.CKMRinput33 = cos(self.Mix23)*cos(self.Mix13)

        if self.CheckFile(self.InputFileFullPath) and self.CheckUnitary(self.CKMRinput11,self.CKMRinput12,self.CKMRinput13,self.CKMRinput21,self.CKMRinput22,self.CKMRinput23,self.CKMRinput31,self.CKMRinput32,self.CKMRinput33) == True:
            with open(self.InputFileFullPath, 'r') as CKMRfile:
                self.CKMRdata = CKMRfile.read()        

            # Replace the target string
            self.CKMRdata = self.CKMRdata.replace('CKMRinput11', str("{:.6E}".format(self.CKMRinput11)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput12', str("{:.6E}".format(self.CKMRinput12)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput13', str("{:.6E}".format(self.CKMRinput13)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput21', str("{:.6E}".format(self.CKMRinput21)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput22', str("{:.6E}".format(self.CKMRinput22)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput23', str("{:.6E}".format(self.CKMRinput23)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput31', str("{:.6E}".format(self.CKMRinput31)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput32', str("{:.6E}".format(self.CKMRinput32)))
            self.CKMRdata = self.CKMRdata.replace('CKMRinput33', str("{:.6E}".format(self.CKMRinput33)))

            # Write the file out again
            with open(self.OutputFileFullPath, 'w') as updatedCKMRfile:
                self.CKMRdata = updatedCKMRfile.write(self.CKMRdata)

        elif self.CheckUnitary(self.CKMRinput11,self.CKMRinput12,self.CKMRinput13,self.CKMRinput21,self.CKMRinput22,self.CKMRinput23,self.CKMRinput31,self.CKMRinput32,self.CKMRinput33) == False:
            print "GenerateCKMRmatrix: CKMR is NOT unitary!.."
    
    def CheckUnitary(self, a11, a12, a13, a21, a22, a23, a31, a32, a33):
        self.a11 = a11
        self.a12 = a12
        self.a13 = a13

        self.a21 = a21
        self.a22 = a22
        self.a23 = a23

        self.a31 = a31
        self.a32 = a32
        self.a33 = a33

        self.row1 = abs(self.a11)**2 + abs(self.a12)**2 + abs(self.a13)**2
        self.row2 = abs(self.a21)**2 + abs(self.a22)**2 + abs(self.a23)**2
        self.row3 = abs(self.a31)**2 + abs(self.a32)**2 + abs(self.a33)**2

        self.col1 = abs(self.a11)**2 + abs(self.a21)**2 + abs(self.a31)**2
        self.col2 = abs(self.a12)**2 + abs(self.a22)**2 + abs(self.a32)**2
        self.col3 = abs(self.a13)**2 + abs(self.a23)**2 + abs(self.a33)**2
        

        self.UnitaryCheck = None

        self.CheckRow1 = self.row1 >= 0.99 and self.row1 <= 1.01
        self.CheckRow2 = self.row2 >= 0.99 and self.row2 <= 1.01
        self.CheckRow3 = self.row3 >= 0.99 and self.row3 <= 1.01

        self.CheckCol1 = self.col1 >= 0.99 and self.col1 <= 1.01
        self.CheckCol2 = self.col2 >= 0.99 and self.col2 <= 1.01
        self.CheckCol3 = self.col3 >= 0.99 and self.col3 <= 1.01

        self.UnitaryRowCheck = self.CheckRow1 and self.CheckRow2 and self.CheckRow3
        self.UnitaryColCheck = self.CheckCol1 and self.CheckCol2 and self.CheckCol3

        self.UnitaryCheck = self.UnitaryRowCheck and self.UnitaryColCheck

        return self.UnitaryCheck


    def AssignValues(self, LesHouchesFileFullPath, UpdatedLesHouchesFileFullPath):
        self.LesHouchesFileFullPath = LesHouchesFileFullPath
        self.UpdatedLesHouchesFileFullPath = UpdatedLesHouchesFileFullPath

        if self.CheckFile(self.LesHouchesFileFullPath) == True:
            with open(self.LesHouchesFileFullPath, 'r') as file:
                self.filedata = file.read()

            # Replace the target string
            for i in range(self.numberofparameters):    
                self.filedata = self.filedata.replace(self.freeparamsdata["ParamName"][i], str("{:.6E}".format(self.params[str(self.freeparamsdata["ParamName"][i])])))

            # Write the file out again
            with open(self.UpdatedLesHouchesFileFullPath, 'w') as updatedfile:
                self.filedata = updatedfile.write(self.filedata)                        
        else:
            print "Error in AssignValues: No LesHouches File is found in the given path!"

    def RunSPheno(self, SPhenoExeFullPath, LesHouchesInputFullPath):
        self.SPhenoExeFullPath = SPhenoExeFullPath
        self.LesHouchesInputFullPath =  LesHouchesInputFullPath

#        if os.path.isfile(self.LesHouchesInputFullPath) == True:
        if os.path.isfile(self.LesHouchesInputFullPath) and self.UnitaryCheck == True:
            os.system(str(self.SPhenoExeFullPath)+" "+str(self.LesHouchesInputFullPath))
        elif self.UnitaryCheck == False:
            print "Error in RunSPheno: CKMR is NOT unitary!"
        elif os.path.isfile(self.LesHouchesInputFullPath) == False:
            print "Error in RunSPheno: No LesHouches File is found in the given path!"
    




















 
    

#    def CopySLHAtoCards(self, SLHAPath, CardsPath):
#        shutil.copy2(SLHAPath, CardsPath + "/param_card.dat") # complete target filename given

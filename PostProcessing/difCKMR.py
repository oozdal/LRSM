from classMCMC import *
from classReadSLHAforMCMC import *
import os

PathForFreeParams = os.path.join("/Users/oozdal/readclass/", "freeparams.txt")
LesHouchesFileFullPath = os.path.join("/Users/oozdal/projects/LRSM", "LesHouches.in.LRSM")
UpdatedLesHouchesFileFullPath = os.path.join(LesHouchesFileFullPath)+"_updatedifCKMR"
SPhenoExecFullPath = os.path.join("/Users/oozdal/hepwork/SPheno-3.3.8/bin", "SPhenoLRSM_NonSUSY_CKMRgR_tsbar")
SPhenoOutputName = os.path.join("/Users/oozdal/projects/LRSM", "SPheno.spc.LRSM_NonSUSY_CKMRgR_tsbar")
SPhenoOutputDestination = os.path.join("/Users/oozdal/projects/LRSM/temp_LRSM_difCKM", "LRSM.")

###################################################################

OutputNumber = 1
MaxNumberOfOutput = 30

Monte = MCMC(PathForFreeParams)

while OutputNumber < MaxNumberOfOutput:
#    Monte.AssignValues(LesHouchesFileFullPath, UpdatedLesHouchesFileFullPath)
    Monte.GenerateCKMRmatrix(LesHouchesFileFullPath,UpdatedLesHouchesFileFullPath)
    Monte.RunSPheno(SPhenoExecFullPath, UpdatedLesHouchesFileFullPath)
    if os.path.isfile(SPhenoOutputName) ==  True:
        newSLHA = ReadSLHA(SPhenoOutputName)
        if newSLHA.CheckCKMR() == True:
            if newSLHA.CheckSMlikeHiggsMass() == True:
                if newSLHA.CheckBphysics() == True:
                    SPhenoOutputTag = SPhenoOutputDestination + str(OutputNumber)
                    os.rename(SPhenoOutputName,SPhenoOutputTag)
                    OutputNumber = OutputNumber + 1
                    print "New solution is found!"
                else:
                    os.remove(SPhenoOutputName)
                    print "B-physics is not satisfied!"
                    continue
            else:
                print "SM-like Higgs Mass is not satisfied!"
                continue
        else:
            print "CheckCKMR: CKMR is NOT unitary!"
            continue
    else:
        print "Error: No SLHA Output is found."
        continue

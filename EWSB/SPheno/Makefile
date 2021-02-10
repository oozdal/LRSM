modname = LRSM_freegR  # as an example  
PreDef = -DGENERATIONMIXING 
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoLRSM_freegR.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoLRSM_freegR:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoLRSM_freegR.o 
	 ${F90} -o SPhenoLRSM_freegR ${LFlagsB} SPhenoLRSM_freegR.o ../lib/libSPhenoLRSM_freegR.a ../lib/libSPheno.a
	 mv SPhenoLRSM_freegR ../bin
	 rm SPhenoLRSM_freegR.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_LRSM_freegR.o)  \
 ${name}(RGEs_LRSM_freegR.o)   \
 ${name}(Couplings_LRSM_freegR.o) ${name}(TreeLevelMasses_LRSM_freegR.o) ${name}(TadpoleEquations_LRSM_freegR.o) \
 ${name}(LoopCouplings_LRSM_freegR.o) ${name}(CouplingsForDecays_LRSM_freegR.o) \
 ${name}(TreeLevel_Decays_LRSM_freegR.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  ${name}(Fv.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_LRSM_freegR.o) \
 ${name}(LoopMasses_LRSM_freegR.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
 ${name}(BranchingRatios_LRSM_freegR.o) ${name}(HiggsCS_LRSM_freegR.o) ${name}(RunSM_LRSM_freegR.o) \
${name}(FlavorKit_LFV_LRSM_freegR.o) ${name}(FlavorKit_QFV_LRSM_freegR.o) ${name}(FlavorKit_Observables_LRSM_freegR.o)\
 ${name}(LowEnergy_LRSM_freegR.o) \
 ${name}(Boundaries_LRSM_freegR.o)  ${name}(InputOutput_LRSM_freegR.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<

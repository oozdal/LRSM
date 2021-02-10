! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:22 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Program SPhenoLRSM_freegR 
 
Use Control
Use InputOutput_LRSM_freegR
Use LoopFunctions
Use Settings
Use LowEnergy_LRSM_freegR
Use Mathematics
Use Model_Data_LRSM_freegR
Use Tadpoles_LRSM_freegR 
 !Use StandardModel
Use Boundaries_LRSM_freegR
 Use HiggsCS_LRSM_freegR
Use TreeLevelMasses_LRSM_freegR
Use LoopMasses_LRSM_freegR
 
Use BranchingRatios_LRSM_freegR
 
Implicit None
 
Real(dp) :: epsI=0.00001_dp, deltaM = 0.000001_dp 
Real(dp) :: mGut = -1._dp, ratioWoM = 0._dp
Integer :: kont, n_tot 
 
Integer,Parameter :: p_max=100
Real(dp) :: Ecms(p_max),Pm(p_max),Pp(p_max), dt, tz, Qin, gSM(11) 
Real(dp) :: vev, sinw2
Complex(dp) :: YdSM(3,3), YuSM(3,3), YeSM(3,3)
Real(dp) :: vSM, g1SM, g2SM, g3SM
Integer :: i1 
Logical :: ISR(p_max)=.False.
Logical :: CalcTBD
Real(dp) :: Tpar,Spar,Upar,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,ratioBsGamma,             & 
& BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,     & 
& BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM,muEgamma,tauEgamma,tauMuGamma,         & 
& CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,         & 
& BRtauToemumu,BRtauTomuee,BRtauToemumu2,BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,     & 
& BrhtoMuE,BrhtoTauE,BrhtoTauMu,DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,           & 
& BrTautoEPi,BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,            & 
& BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,   & 
& BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,            & 
& BrBtoSMuMu,ratioBtoSMuMu,BrBtoKee,ratioBtoKee,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,     & 
& ratioBtoSnunu,BrBtoDnunu,ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,    & 
& ratioKltoPinunu,DelMK,ratioDelMK,epsK,ratioepsK

Tpar = 0._dp 
Spar = 0._dp 
Upar = 0._dp 
ae = 0._dp 
amu = 0._dp 
atau = 0._dp 
EDMe = 0._dp 
EDMmu = 0._dp 
EDMtau = 0._dp 
dRho = 0._dp 
BrBsGamma = 0._dp 
ratioBsGamma = 0._dp 
BrDmunu = 0._dp 
ratioDmunu = 0._dp 
BrDsmunu = 0._dp 
ratioDsmunu = 0._dp 
BrDstaunu = 0._dp 
ratioDstaunu = 0._dp 
BrBmunu = 0._dp 
ratioBmunu = 0._dp 
BrBtaunu = 0._dp 
ratioBtaunu = 0._dp 
BrKmunu = 0._dp 
ratioKmunu = 0._dp 
RK = 0._dp 
RKSM = 0._dp 
muEgamma = 0._dp 
tauEgamma = 0._dp 
tauMuGamma = 0._dp 
CRmuEAl = 0._dp 
CRmuETi = 0._dp 
CRmuESr = 0._dp 
CRmuESb = 0._dp 
CRmuEAu = 0._dp 
CRmuEPb = 0._dp 
BRmuTo3e = 0._dp 
BRtauTo3e = 0._dp 
BRtauTo3mu = 0._dp 
BRtauToemumu = 0._dp 
BRtauTomuee = 0._dp 
BRtauToemumu2 = 0._dp 
BRtauTomuee2 = 0._dp 
BrZtoMuE = 0._dp 
BrZtoTauE = 0._dp 
BrZtoTauMu = 0._dp 
BrhtoMuE = 0._dp 
BrhtoTauE = 0._dp 
BrhtoTauMu = 0._dp 
DeltaMBs = 0._dp 
ratioDeltaMBs = 0._dp 
DeltaMBq = 0._dp 
ratioDeltaMBq = 0._dp 
BrTautoEPi = 0._dp 
BrTautoEEta = 0._dp 
BrTautoEEtap = 0._dp 
BrTautoMuPi = 0._dp 
BrTautoMuEta = 0._dp 
BrTautoMuEtap = 0._dp 
BrB0dEE = 0._dp 
ratioB0dEE = 0._dp 
BrB0sEE = 0._dp 
ratioB0sEE = 0._dp 
BrB0dMuMu = 0._dp 
ratioB0dMuMu = 0._dp 
BrB0sMuMu = 0._dp 
ratioB0sMuMu = 0._dp 
BrB0dTauTau = 0._dp 
ratioB0dTauTau = 0._dp 
BrB0sTauTau = 0._dp 
ratioB0sTauTau = 0._dp 
BrBtoSEE = 0._dp 
ratioBtoSEE = 0._dp 
BrBtoSMuMu = 0._dp 
ratioBtoSMuMu = 0._dp 
BrBtoKee = 0._dp 
ratioBtoKee = 0._dp 
BrBtoKmumu = 0._dp 
ratioBtoKmumu = 0._dp 
BrBtoSnunu = 0._dp 
ratioBtoSnunu = 0._dp 
BrBtoDnunu = 0._dp 
ratioBtoDnunu = 0._dp 
BrKptoPipnunu = 0._dp 
ratioKptoPipnunu = 0._dp 
BrKltoPinunu = 0._dp 
ratioKltoPinunu = 0._dp 
DelMK = 0._dp 
ratioDelMK = 0._dp 
epsK = 0._dp 
ratioepsK = 0._dp 
Call get_command_argument(1,inputFileName)
If (len_trim(inputFileName)==0) Then
  inputFileName="LesHouches.in.LRSM_freegR"
Else
  inputFileName=trim(inputFileName)
End if
Call get_command_argument(2,outputFileName)
If (len_trim(outputFileName)==0) Then
  outputFileName="SPheno.spc.LRSM_freegR"
Else
  outputFileName=trim(outputFileName)
End if 
g1SM = 0._dp 
g2SM = 0._dp 
g3SM = 0._dp 
YdSM = 0._dp 
YeSM = 0._dp 
YuSM = 0._dp 
vSM = 0._dp 
Call Set_All_Parameters_0() 
 
Qin = SetRenormalizationScale(1.6E2_dp**2)  
kont = 0 
delta_Mass = 0.0001_dp 
CalcTBD = .false. 
Call ReadingData(kont) 
 
 HighScaleModel = "LOW" 
If ((MatchingOrder.lt.-1).or.(MatchingOrder.gt.2)) Then 
  If (HighScaleModel.Eq."LOW") Then 
    If (.not.CalculateOneLoopMasses) Then 
       MatchingOrder = -1 
    Else 
       MatchingOrder =  2 
    End if 
   Else 
       MatchingOrder =  2 
   End If 
End If 
Select Case(MatchingOrder) 
 Case(0) 
   OneLoopMatching = .false. 
   TwoLoopMatching = .false. 
   GuessTwoLoopMatchingBSM = .false. 
 Case(1) 
   OneLoopMatching = .true. 
   TwoLoopMatching = .false. 
   GuessTwoLoopMatchingBSM = .false. 
 Case(2) 
   OneLoopMatching = .true. 
   TwoLoopMatching = .true. 
   GuessTwoLoopMatchingBSM = .true. 
End Select 
If (MatchingOrder.eq.-1) Then 
 ! Setting values 
 vHd = vHdIN 
 vHu = vHuIN 
 vR = vRIN 
 vL = vLIN 
 gBL = gBLIN 
 g2 = g2IN 
 gR = gRIN 
 g3 = g3IN 
 RHO2 = RHO2IN 
 RHO4 = RHO4IN 
 RHO1 = RHO1IN 
 RHO3 = RHO3IN 
 BETA1 = BETA1IN 
 ALP3 = ALP3IN 
 ALP1 = ALP1IN 
 LAM1 = LAM1IN 
 ALP2 = ALP2IN 
 BETA2 = BETA2IN 
 BETA3 = BETA3IN 
 LAM4 = LAM4IN 
 LAM2 = LAM2IN 
 LAM3 = LAM3IN 
 YDR = YDRIN 
 YL1 = YL1IN 
 YQ1 = YQ1IN 
 YQ2 = YQ2IN 
 YDL = YDLIN 
 YL2 = YL2IN 
 muLR2 = muLR2IN 
 MU22 = MU22IN 
 MU12 = MU12IN 
 g3 = g3SM
g2 = g2SM
gR = gRinput
gBL = (g1SM*gR)/Sqrt(-g1SM**2 + gR**2)
CKMR = Conjg(CKM)
MD(1,1) = MD11
MD(1,2) = MD12
MD(1,3) = MD13
MD(2,1) = MD21
MD(2,2) = MD22
MD(2,3) = MD23
MD(3,1) = MD31
MD(3,2) = MD32
MD(3,3) = MD33
vR = vRinput
vL = vLinput
vHd = Sqrt(-2*vL**2 + vSM**2)/Sqrt(1 + TanBeta**2)
vHu = (TanBeta*Sqrt(-2*vL**2 + vSM**2))/Sqrt(1 + TanBeta**2)
YQ2 = -Conjg((-(vHu*vSM*Matmul(Transpose(YuSM),Conjg(CKMR))) + vHd*vSM*Transpose(YdSM))/(-vHd**2 + vHu**2))
YQ1 = Conjg((-(vHd*vSM*MatMul(Transpose(YuSM),Conjg(CKMR))) + vHu*vSM*Transpose(YdSM))/(-vHd**2 + vHu**2))
YL2 = Conjg((147.007_dp*MD*vHu - vHd*vSM*Transpose(YeSM))/(-vHd**2 + vHu**2))
YL1 = Conjg((-(sqrt(2._dp)*MD*vHd) + vHu*vSM*Transpose(YeSM))/(-vHd**2 + vHu**2))
tanbetaMZ = tanbeta 

 
 ! Setting VEVs used for low energy constraints 
 vHdMZ = vHd 
 vHuMZ = vHu 
 vRMZ = vR 
 vLMZ = vL 
    sinW2=1._dp-mW2/mZ2 
   vSM=1/Sqrt((G_F*Sqrt(2._dp)))
   g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
   g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2 ) 
   g3SM=sqrt(AlphaS_MZ*4*Pi) 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
    If (GenerationMixing) YuSM = Matmul(Transpose(CKM),YuSM) 

 ! Setting Boundary conditions 
 Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

g3 = g3SM
g2 = g2SM
gR = gRinput
gBL = (g1SM*gR)/Sqrt(-g1SM**2 + gR**2)
CKMR = Conjg(CKM)
MD(1,1) = MD11
MD(1,2) = MD12
MD(1,3) = MD13
MD(2,1) = MD21
MD(2,2) = MD22
MD(2,3) = MD23
MD(3,1) = MD31
MD(3,2) = MD32
MD(3,3) = MD33
vR = vRinput
vL = vLinput
vHd = Sqrt(-2*vL**2 + vSM**2)/Sqrt(1 + TanBeta**2)
vHu = (TanBeta*Sqrt(-2*vL**2 + vSM**2))/Sqrt(1 + TanBeta**2)
YQ2 = -Conjg((-(vHu*vSM*Matmul(Transpose(YuSM),Conjg(CKMR))) + vHd*vSM*Transpose(YdSM))/(-vHd**2 + vHu**2))
YQ1 = Conjg((-(vHd*vSM*MatMul(Transpose(YuSM),Conjg(CKMR))) + vHu*vSM*Transpose(YdSM))/(-vHd**2 + vHu**2))
YL2 = Conjg((147.007_dp*MD*vHu - vHd*vSM*Transpose(YeSM))/(-vHd**2 + vHu**2))
YL1 = Conjg((-(sqrt(2._dp)*MD*vHd) + vHu*vSM*Transpose(YeSM))/(-vHd**2 + vHu**2))
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,             & 
& MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,               & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)


 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

Else 
   If (GetMassUncertainty) Then 
   ! Uncertainty from Y_top 
 If ((CalculateOneLoopMasses).and.(CalculateTwoLoopHiggsMasses)) Then 
OneLoopMatching = .true. 
TwoLoopMatching = .false. 
GuessTwoLoopMatchingBSM = .True. 
Elseif ((CalculateOneLoopMasses).and.(.not.CalculateTwoLoopHiggsMasses)) Then  
OneLoopMatching = .true. 
TwoLoopMatching = .false. 
GuessTwoLoopMatchingBSM = .false. 
Else  
OneLoopMatching = .true. 
TwoLoopMatching = .false. 
GuessTwoLoopMatchingBSM = .false. 
End if 
Call CalculateSpectrum(n_run,delta_mass,WriteOut,kont,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,            & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,             & 
& ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,           & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,mGUT)

n_tot =1
mass_uncertainty_Yt(n_tot:n_tot+3) = Mhh! difference will be taken later 
n_tot = n_tot + 4 
mass_uncertainty_Yt(n_tot:n_tot+3) = MAh! difference will be taken later 
n_tot = n_tot + 4 
mass_uncertainty_Yt(n_tot:n_tot+3) = MHpm! difference will be taken later 
n_tot = n_tot + 4 
mass_uncertainty_Yt(n_tot:n_tot+1) = MHppmm! difference will be taken later 
If ((CalculateOneLoopMasses).and.(CalculateTwoLoopHiggsMasses)) Then 
OneLoopMatching = .true. 
TwoLoopMatching = .true. 
GuessTwoLoopMatchingBSM = .false. 
Elseif ((CalculateOneLoopMasses).and.(.not.CalculateTwoLoopHiggsMasses)) Then  
OneLoopMatching = .false. 
TwoLoopMatching = .false. 
GuessTwoLoopMatchingBSM = .false. 
Else  
OneLoopMatching = .false. 
TwoLoopMatching = .false. 
GuessTwoLoopMatchingBSM = .false. 
End if 
  End if 
 Call CalculateSpectrum(n_run,delta_mass,WriteOut,kont,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,            & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,             & 
& ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,           & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,mGUT)

  If (GetMassUncertainty) Then 
 Call GetScaleUncertainty(delta_mass,WriteOut,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,               & 
& ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,               & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,mass_uncertainty_Q)

  End if 
 End If 
 ! Save correct Higgs masses for calculation of L -> 3 L' 
MhhL = Mhh
Mhh2L = MhhL**2 
MAhL = MAh
MAh2L = MAhL**2 
 
PhiW = ACos(Sqrt(Abs(ZW(1,1))**2 + Abs(ZW(1,2))**2))
TW = ASin(Abs(ZZ(2,1)))
If ((L_BR).And.(kont.Eq.0)) Then 
 Call CalculateBR(CalcTBD,ratioWoM,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,               & 
& ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,               & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFv,gTFv,            & 
& BRFv,gPVZ,gTVZ,BRVZ,gPVZR,gTVZR,BRVZR,gPHppmm,gTHppmm,BRHppmm,gPHpm,gTHpm,             & 
& BRHpm,gPAh,gTAh,BRAh,gPVWLm,gTVWLm,BRVWLm,gPVWRm,gTVWRm,BRVWRm)

Call HiggsCrossSections(Mhh,ratioGG,ratioPP,rHB_S_VWLm,rHB_S_VZ,rHB_S_S_Fu(:,3)       & 
& ,CS_Higgs_LHC,kont)

Call HiggsCrossSections(MAh,ratioPGG,ratioPPP,0._dp*rHB_S_VWLm,0._dp*rHB_S_VZ,        & 
& rHB_P_S_Fu(:,3),CS_PHiggs_LHC,kont)

End If 
 
 If (CalculateLowEnergy) then 
Call CalculateLowEnergyConstraints(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,            & 
& ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,          & 
& MU22,MU12,vHd,vHu,vR,vL,Tpar,Spar,Upar,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,             & 
& BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,              & 
& ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,               & 
& RK,RKSM,muEgamma,tauEgamma,tauMuGamma,CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,         & 
& CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,BRtauToemumu,BRtauTomuee,BRtauToemumu2,          & 
& BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,BrhtoTauE,BrhtoTauMu,              & 
& DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,BrTautoEPi,BrTautoEEta,BrTautoEEtap,     & 
& BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,          & 
& BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,BrB0dTauTau,ratioB0dTauTau,              & 
& BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,BrBtoSMuMu,ratioBtoSMuMu,              & 
& BrBtoKee,ratioBtoKee,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,BrBtoDnunu,     & 
& ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,             & 
& DelMK,ratioDelMK,epsK,ratioepsK)

MVZ = mz 
MVZ2 = mz2 
MVWLm = mW 
MVWLm2 = mW2 
If (WriteParametersAtQ) Then 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,GenerationMixing,kont)

End If 
 
MFv = nuMasses  
End if 
 
If ((FoundIterativeSolution).or.(WriteOutputForNonConvergence)) Then 
If (OutputForMO) Then 
Call RunningFermionMasses(MFe,MFe2,MFd,MFd2,MFu,MFu2,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

End if 
Write(*,*) "Writing output files" 
Call LesHouches_Out(67,11,kont,MGUT,Tpar,Spar,Upar,ae,amu,atau,EDMe,EDMmu,            & 
& EDMtau,dRho,BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,            & 
& BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,     & 
& RK,RKSM,muEgamma,tauEgamma,tauMuGamma,CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,         & 
& CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,BRtauToemumu,BRtauTomuee,BRtauToemumu2,          & 
& BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,BrhtoTauE,BrhtoTauMu,              & 
& DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,BrTautoEPi,BrTautoEEta,BrTautoEEtap,     & 
& BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,          & 
& BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,BrB0dTauTau,ratioB0dTauTau,              & 
& BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,BrBtoSMuMu,ratioBtoSMuMu,              & 
& BrBtoKee,ratioBtoKee,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,BrBtoDnunu,     & 
& ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,             & 
& DelMK,ratioDelMK,epsK,ratioepsK,GenerationMixing)

End if 
Write(*,*) "Finished!" 
Contains 
 
Subroutine CalculateSpectrum(n_run,delta,WriteOut,kont,MAh,MAh2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,            & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,             & 
& ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,           & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,mGUT)

Implicit None 
Integer, Intent(in) :: n_run 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: WriteOut 
Real(dp), Intent(in) :: delta 
Real(dp), Intent(inout) :: mGUT 
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: vHd,vHu,vR,vL

kont = 0 
Call FirstGuess(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

!If (kont.ne.0) Call TerminateProgram 
 
If (SPA_Convention) Call SetRGEScale(1.e3_dp**2) 
 
If (.Not.UseFixedScale) Then 
 Call SetRGEScale(160._dp**2) 
End If
Call Match_and_Run(delta,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,mGut,kont,WriteOut,n_run)

If (kont.ne.0) Then 
 Write(*,*) "Error appeared in calculation of masses "
 
 Call TerminateProgram 
End If 
 
End Subroutine CalculateSpectrum 
 

 
Subroutine ReadingData(kont)
Implicit None
Integer,Intent(out)::kont
Logical::file_exists
kont=-123456
Inquire(file=inputFileName,exist=file_exists)
If (file_exists) Then
kont=1
Call LesHouches_Input(kont,Ecms,Pm,Pp,ISR,F_GMSB)
LesHouches_Format= .True.
Else
Write(*,*)&
& "File ",inputFileName," does not exist"
Call TerminateProgram
End If
End Subroutine ReadingData

 
Subroutine GetScaleUncertainty(delta,WriteOut,kont,MAhinput,MAh2input,MFdinput,       & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MHppmminput,MHppmm2input,MVWLminput,MVWLm2input,        & 
& MVWRminput,MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,              & 
& UVinput,TWinput,UCinput,UCCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,          & 
& ZELinput,ZULinput,ZHinput,ZWinput,ZZinput,vHdinput,vHuinput,vRinput,vLinput,           & 
& gBLinput,g2input,gRinput,g3input,RHO2input,RHO4input,RHO1input,RHO3input,              & 
& BETA1input,ALP3input,ALP1input,LAM1input,ALP2input,BETA2input,BETA3input,              & 
& LAM4input,LAM2input,LAM3input,YDRinput,YL1input,YQ1input,YQ2input,YDLinput,            & 
& YL2input,muLR2input,MU22input,MU12input,mass_Qerror)

Implicit None 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: WriteOut 
Real(dp), Intent(in) :: delta 
Real(dp) :: mass_in(29), mass_new(29) 
Real(dp), Intent(out) :: mass_Qerror(29) 
Real(dp) :: gD(133), Q, Qsave, Qstep, Qt, g_SM(62), mh_SM 
Integer :: i1, i2, iupdown, ntot 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO4input,RHO1input,RHO3input,             & 
& BETA1input,ALP3input,ALP1input,LAM1input,ALP2input,BETA2input,BETA3input,              & 
& LAM4input,LAM2input,LAM3input,muLR2input,MU22input,MU12input

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YQ2input(3,3),YDLinput(3,3),YL2input(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MHppmminput(2),MHppmm2input(2),MVWLminput,MVWLm2input,      & 
& MVWRminput,MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,              & 
& TWinput,UCinput(4,4),UCCinput(2,2),UPinput(4,4),ZHinput(4,4)

Complex(dp),Intent(in) :: UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),   & 
& ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp),Intent(in) :: vHdinput,vHuinput,vRinput,vLinput

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: vHd,vHu,vR,vL

kont = 0 
Write(*,*) "Check scale uncertainty" 
n_tot =1
mass_in(n_tot:n_tot+3) = Mhhinput
n_tot = n_tot + 4 
mass_in(n_tot:n_tot+3) = MAhinput
n_tot = n_tot + 4 
mass_in(n_tot:n_tot+3) = MHpminput
n_tot = n_tot + 4 
mass_in(n_tot:n_tot+1) = MHppmminput
mass_Qerror = 0._dp 
Qsave=sqrt(getRenormalizationScale()) 
Do iupdown=1,2 
If (iupdown.eq.1) Then 
  Qstep=Qsave/7._dp 
Else 
  Qstep=-0.5_dp*Qsave/7._dp 
End if 
Do i1=1,7 
Q=Qsave+i1*Qstep 
Qt = SetRenormalizationScale(Q**2) 
gBL = gBLinput
g2 = g2input
gR = gRinput
g3 = g3input
RHO2 = RHO2input
RHO4 = RHO4input
RHO1 = RHO1input
RHO3 = RHO3input
BETA1 = BETA1input
ALP3 = ALP3input
ALP1 = ALP1input
LAM1 = LAM1input
ALP2 = ALP2input
BETA2 = BETA2input
BETA3 = BETA3input
LAM4 = LAM4input
LAM2 = LAM2input
LAM3 = LAM3input
YDR = YDRinput
YL1 = YL1input
YQ1 = YQ1input
YQ2 = YQ2input
YDL = YDLinput
YL2 = YL2input
muLR2 = muLR2input
MU22 = MU22input
MU12 = MU12input
vHd = vHdinput
vHu = vHuinput
vR = vRinput
vL = vLinput

 
 ! --- GUT normalize gauge couplings --- 
gBL = Sqrt(2._dp/3._dp)*gBL 
! ----------------------- 
 
Call ParametersToG133(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,               & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,vHd,vHu,vR,vL,gD)

If (iupdown.eq.1) Then 
 tz=Log(Q/Qsave)
 dt=-tz/50._dp
 Call odeint(gD,133,0._dp,tz,0.1_dp*delta,dt,0._dp,rge133,kont)
Else 
 tz=-Log(Q/Qsave)
 dt=tz/50._dp
 Call odeint(gD,133,tz,0._dp,0.1_dp*delta,dt,0._dp,rge133,kont)
End if 
Call GToParameters133(gD,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,            & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,vHd,vHu,vR,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
gBL = Sqrt(3._dp/2._dp)*gBL 
! ----------------------- 
 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,             & 
& MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,               & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

If (((Calculate_mh_within_SM).and.(Mhh(2).gt.300._dp)).OR.(Force_mh_within_SM))Then
g_SM=g_SM_save 
tz=0.5_dp*Log(mZ2/Q**2)
dt=tz/100._dp
g_SM(1)=Sqrt(5._dp/3._dp)*g_SM(1) 
Call odeint(g_SM,62,tz,0._dp,delta,dt,0._dp,rge62_SM,kont) 
g_SM(1)=Sqrt(3._dp/5._dp)*g_SM(1) 
Call Get_mh_pole_SM(g_SM,Q**2,delta,Mhh2(1),mh_SM)
Mhh2(1) = mh_SM**2 
Mhh(1) = mh_SM 
End if
n_tot =1
mass_new(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MHpm
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+1) = MHppmm
  Do i2=1,29 
    If (Abs(mass_new(i2)-mass_in(i2)).gt.mass_Qerror(i2)) mass_Qerror(i2) = Abs(mass_new(i2)-mass_in(i2)) 
  End Do 
End Do 
End Do 
  Do i2=1,29  
    mass_uncertainty_Yt(i2) = Abs(mass_uncertainty_Yt(i2)-mass_in(i2)) 
  End Do 
If (kont.ne.0) Then 
 Write(*,*) "Error appeared in check of scale uncertainty "
 
 Call TerminateProgram 
End If 
 
Qt = SetRenormalizationScale(Qsave**2) 
End Subroutine GetScaleUncertainty 
 

 
End Program SPhenoLRSM_freegR 

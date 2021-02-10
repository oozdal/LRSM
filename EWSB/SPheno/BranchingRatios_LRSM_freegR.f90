! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:11 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_LRSM_freegR 
 
Use Control 
Use Settings 
Use Couplings_LRSM_freegR 
Use Model_Data_LRSM_freegR 
Use LoopCouplings_LRSM_freegR 
Use Fu3Decays_LRSM_freegR 
Use Fe3Decays_LRSM_freegR 
Use Fd3Decays_LRSM_freegR 
Use Fv3Decays_LRSM_freegR 
Use TreeLevelDecays_LRSM_freegR 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,               & 
& ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,               & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFv,gTFv,            & 
& BRFv,gPVZ,gTVZ,BRVZ,gPVZR,gTVZR,BRVZR,gPHppmm,gTHppmm,BRHppmm,gPHpm,gTHpm,             & 
& BRHpm,gPAh,gTAh,BRAh,gPVWLm,gTVWLm,BRVWLm,gPVWRm,gTVWRm,BRVWRm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp),Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(in) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: vHd,vHu,vR,vL

Real(dp),Intent(inout) :: gPFu(3,279),gTFu(3),BRFu(3,279),gPFe(3,297),gTFe(3),BRFe(3,297),gPFd(3,279),          & 
& gTFd(3),BRFd(3,279),gPhh(4,87),gThh(4),BRhh(4,87),gPFv(6,465),gTFv(6),BRFv(6,465),     & 
& gPVZ(1,79),gTVZ,BRVZ(1,79),gPVZR(1,79),gTVZR,BRVZR(1,79),gPHppmm(2,32),gTHppmm(2),     & 
& BRHppmm(2,32),gPHpm(4,67),gTHpm(4),BRHpm(4,67),gPAh(4,79),gTAh(4),BRAh(4,79),          & 
& gPVWLm(1,65),gTVWLm,BRVWLm(1,65),gPVWRm(1,65),gTVWRm,BRVWRm(1,65)

Complex(dp) :: cplHiggsPP(4),cplHiggsGG(4),cplPseudoHiggsPP(4),cplPseudoHiggsGG(4),cplHiggsZZvirt(4),& 
& cplHiggsWWvirt(4)

Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),       & 
& gFuFdcFeFv(3,3,3,6),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),       & 
& gFeFeFvFv(3,3,6,6),gFeFvcFuFd(3,6,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),        & 
& gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,6,6),gFdFuFvFe(3,3,6,3),gFvFvcFdFd(6,6,3,3),         & 
& gFvFvcFeFe(6,6,3,3),gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6),gFvFecFdFu(6,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWLm = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPFu(:,1:36),gTFu,               & 
& BRFu(:,1:36))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPFe(:,1:54),gTFe,               & 
& BRFe(:,1:54))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPFd(:,1:36),gTFd,               & 
& BRFd(:,1:36))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPhh,gThh,BRhh)

Do i1=1,4
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPFv(:,1:60),gTFv,               & 
& BRFv(:,1:60))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPVZ,gTVZ,BRVZ)

Do i1=1,1
gTVZ =Sum(gPVZ(i1,:)) 
If (gTVZ.Gt.0._dp) BRVZ(i1,: ) =gPVZ(i1,:)/gTVZ 
End Do 
 

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPVZR = 0._dp 
gTVZR = 0._dp 
BRVZR = 0._dp 
Call VZRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPVZR,gTVZR,BRVZR)

Do i1=1,1
gTVZR =Sum(gPVZR(i1,:)) 
If (gTVZR.Gt.0._dp) BRVZR(i1,: ) =gPVZR(i1,:)/gTVZR 
End Do 
 

! Set Goldstone Widhts 
gTAh(2)=gTVZR


gPHppmm = 0._dp 
gTHppmm = 0._dp 
BRHppmm = 0._dp 
Call HppmmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPHppmm,gTHppmm,BRHppmm)

Do i1=1,2
gTHppmm(i1) =Sum(gPHppmm(i1,:)) 
If (gTHppmm(i1).Gt.0._dp) BRHppmm(i1,: ) =gPHppmm(i1,:)/gTHppmm(i1) 
End Do 
 

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPHpm,gTHpm,BRHpm)

Do i1=1,4
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
End Do 
 

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm
gTHpm(2)=gTVWRm


gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,              & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPAh,gTAh,BRAh)

Do i1=1,4
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
End Do 
 

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZR


gPVWLm = 0._dp 
gTVWLm = 0._dp 
BRVWLm = 0._dp 
Call VWLmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPVWLm,gTVWLm,BRVWLm)

Do i1=1,1
gTVWLm =Sum(gPVWLm(i1,:)) 
If (gTVWLm.Gt.0._dp) BRVWLm(i1,: ) =gPVWLm(i1,:)/gTVWLm 
End Do 
 

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm


gPVWRm = 0._dp 
gTVWRm = 0._dp 
BRVWRm = 0._dp 
Call VWRmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gPVWRm,gTVWRm,BRVWRm)

Do i1=1,1
gTVWRm =Sum(gPVWRm(i1,:)) 
If (gTVWRm.Gt.0._dp) BRVWRm(i1,: ) =gPVWRm(i1,:)/gTVWRm 
End Do 
 

! Set Goldstone Widhts 
gTHpm(2)=gTVWRm


If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fu)) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdcFeFv,               & 
& epsI,deltaM,.False.,gTFu,gPFu(:,37:279),BRFu(:,37:279))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdcFeFv,               & 
& epsI,deltaM,.True.,gTFu,gPFu(:,37:279),BRFu(:,37:279))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdcFeFv,               & 
& epsI,deltaM,.False.,gTFu,gPFu(:,37:279),BRFu(:,37:279))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fe)) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTHppmm,             & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,        & 
& epsI,deltaM,.False.,gTFe,gPFe(:,55:297),BRFe(:,55:297))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTHppmm,             & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,        & 
& epsI,deltaM,.True.,gTFe,gPFe(:,55:297),BRFe(:,55:297))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTHppmm,             & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,        & 
& epsI,deltaM,.False.,gTFe,gPFe(:,55:297),BRFe(:,55:297))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fd)) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,           & 
& deltaM,.False.,gTFd,gPFd(:,37:279),BRFd(:,37:279))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,           & 
& deltaM,.True.,gTFd,gPFd(:,37:279),BRFd(:,37:279))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,           & 
& deltaM,.False.,gTFd,gPFd(:,37:279),BRFd(:,37:279))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fv)) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFdFu,               & 
& epsI,deltaM,.False.,gTFv,gPFv(:,61:465),BRFv(:,61:465))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFdFu,               & 
& epsI,deltaM,.True.,gTFv,gPFv(:,61:465),BRFv(:,61:465))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,               & 
& RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,               & 
& YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,vHd,vHu,vR,vL,gTAh,gThh,gTHpm,gTVWLm,              & 
& gTVWRm,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFdFu,               & 
& epsI,deltaM,.False.,gTFv,gPFv(:,61:465),BRFv(:,61:465))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

! No 3-body decays for VZ  
! No 3-body decays for VZR  
! No 3-body decays for Hppmm  
! No 3-body decays for Hpm  
! No 3-body decays for Ah  
! No 3-body decays for VWLm  
! No 3-body decays for VWRm  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_LRSM_freegR 
 
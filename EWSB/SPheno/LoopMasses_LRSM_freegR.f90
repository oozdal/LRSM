! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:09 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_LRSM_freegR 
 
Use Control 
Use Settings 
Use Couplings_LRSM_freegR 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_LRSM_freegR 
Use StandardModel 
Use Tadpoles_LRSM_freegR 
 Use Pole2L_LRSM_freegR 
 Use TreeLevelMasses_LRSM_freegR 
 
Real(dp), Private :: Mhh_1L(4), Mhh2_1L(4)  
Complex(dp), Private :: ZH_1L(4,4)  
Real(dp), Private :: MAh_1L(4), MAh2_1L(4)  
Complex(dp), Private :: UP_1L(4,4)  
Real(dp), Private :: MHpm_1L(4), MHpm2_1L(4)  
Complex(dp), Private :: UC_1L(4,4)  
Real(dp), Private :: MHppmm_1L(2), MHppmm2_1L(2)  
Complex(dp), Private :: UCC_1L(2,2)  
Real(dp), Private :: MFv_1L(6), MFv2_1L(6)  
Complex(dp), Private :: UV_1L(6,6)  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZR_1L, MVZR2_1L  
Real(dp), Private :: MVWLm_1L, MVWLm2_1L  
Real(dp), Private :: MVWRm_1L, MVWRm2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(4)  
Real(dp) :: pi_ep2L(4,4)
Real(dp) :: Pi2S_EffPot(4,4)
Real(dp) :: PiP2S_EffPot(4,4)
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

Implicit None 
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: vHd,vHu,vR,vL

Complex(dp) :: cplAhAhcVWLmVWLm(4,4),cplAhAhcVWRmVWLm(4,4),cplAhAhcVWRmVWRm(4,4),cplAhAhUhh(4,4,4),  & 
& cplAhAhUhhUhh(4,4,4,4),cplAhAhUHpmcUHpm(4,4,4,4),cplAhAhUHppmmcUHppmm(4,4,2,2),        & 
& cplAhAhVPVP(4,4),cplAhAhVPVZ(4,4),cplAhAhVPVZR(4,4),cplAhAhVZRVZR(4,4),cplAhAhVZVZ(4,4),& 
& cplAhAhVZVZR(4,4),cplAhcHpmVWLm(4,4),cplAhcUHpmVWLm(4,4),cplAhcUHpmVWRm(4,4),          & 
& cplAhcVWLmVWRm(4),cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),     & 
& cplAhHpmcUHpm(4,4,4),cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhHppmmcUHppmm(4,2,2),   & 
& cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),& 
& cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3), & 
& cplcFdFdVZRR(3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFeFeUAhL(3,3,4),           & 
& cplcFeFeUAhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFeFeVPL(3,3),          & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFeFvVWLmL(3,6),cplcFeFvVWLmR(3,6),cplcFeUFvHpmL(3,6,4),cplcFeUFvHpmR(3,6,4),       & 
& cplcFeUFvVWLmL(3,6),cplcFeUFvVWLmR(3,6),cplcFeUFvVWRmL(3,6),cplcFeUFvVWRmR(3,6),       & 
& cplcFuFdcUHpmL(3,3,4),cplcFuFdcUHpmR(3,3,4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),   & 
& cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),       & 
& cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),             & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3), & 
& cplcFuFuVZRR(3,3),cplcgGgGVG,cplcgPgWLmcVWLm,cplcgPgWLmcVWRm,cplcgPgWLpVWLm,           & 
& cplcgPgWRmcVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,cplcgWLmgPVWLm,cplcgWLmgWLmUAh(4),      & 
& cplcgWLmgWLmUhh(4),cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWLpUHppmm(2),& 
& cplcgWLmgWRmUAh(4),cplcgWLmgWRmUhh(4),cplcgWLmgWRmVP,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,   & 
& cplcgWLmgWRpUHppmm(2),cplcgWLmgZpUHpm(4),cplcgWLmgZpVWLm,cplcgWLmgZUHpm(4),            & 
& cplcgWLmgZVWLm,cplcgWLpgPcVWLm,cplcgWLpgPcVWRm,cplcgWLpgWLmcUHppmm(2),cplcgWLpgWLpUAh(4),& 
& cplcgWLpgWLpUhh(4),cplcgWLpgWLpVP,cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRmcUHppmm(2),& 
& cplcgWLpgWRpUAh(4),cplcgWLpgWRpUhh(4),cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,   & 
& cplcgWLpgZcUHpm(4),cplcgWLpgZcVWLm,cplcgWLpgZcVWRm,cplcgWLpgZpcUHpm(4),cplcgWLpgZpcVWLm,& 
& cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgWLmUAh(4),cplcgWRmgWLmUhh(4),cplcgWRmgWLmVP,  & 
& cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,cplcgWRmgWLpUHppmm(2),cplcgWRmgWRmUAh(4),               & 
& cplcgWRmgWRmUhh(4),cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRmgWRpUHppmm(2),& 
& cplcgWRmgZpUHpm(4),cplcgWRmgZpVWLm,cplcgWRmgZUHpm(4),cplcgWRmgZVWLm,cplcgWRpgPcVWLm,   & 
& cplcgWRpgPcVWRm,cplcgWRpgWLmcUHppmm(2),cplcgWRpgWLpUAh(4),cplcgWRpgWLpUhh(4),          & 
& cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRmcUHppmm(2),cplcgWRpgWRpUAh(4),& 
& cplcgWRpgWRpUhh(4),cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcgWRpgZcUHpm(4),   & 
& cplcgWRpgZcVWLm,cplcgWRpgZcVWRm,cplcgWRpgZpcUHpm(4),cplcgWRpgZpcVWLm,cplcgWRpgZpcVWRm, & 
& cplcgZgWLmcUHpm(4),cplcgZgWLmcVWLm,cplcgZgWLmcVWRm,cplcgZgWLpUHpm(4),cplcgZgWLpVWLm,   & 
& cplcgZgWRmcUHpm(4),cplcgZgWRmcVWLm,cplcgZgWRmcVWRm,cplcgZgWRpUHpm(4),cplcgZgWRpVWLm

Complex(dp) :: cplcgZgZpUhh(4),cplcgZgZUhh(4),cplcgZpgWLmcUHpm(4),cplcgZpgWLmcVWLm,cplcgZpgWLmcVWRm,  & 
& cplcgZpgWLpUHpm(4),cplcgZpgWLpVWLm,cplcgZpgWRmcUHpm(4),cplcgZpgWRmcVWLm,               & 
& cplcgZpgWRmcVWRm,cplcgZpgWRpUHpm(4),cplcgZpgWRpVWLm,cplcgZpgZpUhh(4),cplcgZpgZUhh(4),  & 
& cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4), & 
& cplcHpmVWRmVZR(4),cplcHppmmVWLmVWLm(2),cplcHppmmVWLmVWRm(2),cplcUFdFdAhL(3,3,4),       & 
& cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),cplcUFdFuHpmL(3,3,4),          & 
& cplcUFdFuHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),cplcUFdFuVWRmL(3,3),      & 
& cplcUFdFuVWRmR(3,3),cplcUFecFeHppmmL(3,3,2),cplcUFecFeHppmmR(3,3,2),cplcUFeFeAhL(3,3,4),& 
& cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),         & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZRL(3,3),              & 
& cplcUFeFeVZRR(3,3),cplcUFeFvHpmL(3,6,4),cplcUFeFvHpmR(3,6,4),cplcUFeFvVWLmL(3,6),      & 
& cplcUFeFvVWLmR(3,6),cplcUFeFvVWRmL(3,6),cplcUFeFvVWRmR(3,6),cplcUFuFdcHpmL(3,3,4),     & 
& cplcUFuFdcHpmR(3,3,4),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),  & 
& cplcUFuFdcVWRmR(3,3),cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFuhhL(3,3,4),      & 
& cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),             & 
& cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZRL(3,3),              & 
& cplcUFuFuVZRR(3,3),cplcUHpmVPVWLm(4),cplcUHpmVPVWRm(4),cplcUHpmVWLmVZ(4),              & 
& cplcUHpmVWLmVZR(4),cplcUHpmVWRmVZ(4),cplcUHpmVWRmVZR(4),cplcUHppmmVWLmVWLm(2),         & 
& cplcUHppmmVWLmVWRm(2),cplcUHppmmVWRmVWRm(2),cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,& 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmVPVPVWLm1,& 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,& 
& cplcVWLmVPVWLmVZ3,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,            & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2, & 
& cplcVWLmVWLmVZRVZR3,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,             & 
& cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,               & 
& cplcVWLmVWRmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmVPVPVWLm1,& 
& cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,               & 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,   & 
& cplcVWRmVPVWRmVZ3,cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,            & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,cplcVWRmVWRmVZVZ1,         & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2

Complex(dp) :: cplcVWRmVWRmVZVZR3,cplFeFecUHppmmL(3,3,2),cplFeFecUHppmmR(3,3,2),cplFvFecUHpmL(6,3,4), & 
& cplFvFecUHpmR(6,3,4),cplFvFecVWLmL(6,3),cplFvFecVWLmR(6,3),cplFvFecVWRmL(6,3),         & 
& cplFvFecVWRmR(6,3),cplFvFvUAhL(6,6,4),cplFvFvUAhR(6,6,4),cplFvFvUhhL(6,6,4),           & 
& cplFvFvUhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),    & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhcHpmVWLm(4,4),cplhhcUHpmVWLm(4,4),              & 
& cplhhcUHpmVWRm(4,4),cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),             & 
& cplhhcVWRmVWRm(4),cplhhhhcVWLmVWLm(4,4),cplhhhhcVWRmVWLm(4,4),cplhhhhcVWRmVWRm(4,4),   & 
& cplhhhhUHpmcUHpm(4,4,4,4),cplhhhhUHppmmcUHppmm(4,4,2,2),cplhhhhVPVP(4,4),              & 
& cplhhhhVPVZ(4,4),cplhhhhVPVZR(4,4),cplhhhhVZRVZR(4,4),cplhhhhVZVZ(4,4),cplhhhhVZVZR(4,4),& 
& cplhhHpmcUHpm(4,4,4),cplhhHpmcVWLm(4,4),cplhhHpmcVWRm(4,4),cplhhHppmmcUHppmm(4,2,2),   & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmcVWLmVWLm(4,4),& 
& cplHpmcHpmcVWRmVWLm(4,4),cplHpmcHpmcVWRmVWRm(4,4),cplHpmcHpmVP(4,4),cplHpmcHpmVPVP(4,4),& 
& cplHpmcHpmVPVZ(4,4),cplHpmcHpmVPVZR(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),         & 
& cplHpmcHpmVZRVZR(4,4),cplHpmcHpmVZVZ(4,4),cplHpmcHpmVZVZR(4,4),cplHpmcHppmmVWLm(4,2),  & 
& cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),cplHpmcUHpmVZR(4,4),cplHpmcUHppmmVWLm(4,2),      & 
& cplHpmcUHppmmVWRm(4,2),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),            & 
& cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplHpmHpmcUHppmm(4,4,2),           & 
& cplHpmUHppmmcHpmcUHppmm(4,2,4,2),cplHppmmcHpmcVWLm(2,4),cplHppmmcHpmcVWRm(2,4),        & 
& cplHppmmcHppmmcVWLmVWLm(2,2),cplHppmmcHppmmcVWRmVWLm(2,2),cplHppmmcHppmmcVWRmVWRm(2,2),& 
& cplHppmmcHppmmVP(2,2),cplHppmmcHppmmVPVP(2,2),cplHppmmcHppmmVPVZ(2,2),cplHppmmcHppmmVPVZR(2,2),& 
& cplHppmmcHppmmVZ(2,2),cplHppmmcHppmmVZR(2,2),cplHppmmcHppmmVZRVZR(2,2),cplHppmmcHppmmVZVZ(2,2),& 
& cplHppmmcHppmmVZVZR(2,2),cplHppmmcUHpmcHpm(2,4,4),cplHppmmcUHpmcVWLm(2,4),             & 
& cplHppmmcUHpmcVWRm(2,4),cplHppmmcUHppmmVP(2,2),cplHppmmcUHppmmVZ(2,2),cplHppmmcUHppmmVZR(2,2),& 
& cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2),cplUAhAhhh(4,4,4),   & 
& cplUAhcVWRmVWLm(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),& 
& cplUAhHpmcVWLm(4,4),cplUAhHpmcVWRm(4,4),cplUAhHppmmcHppmm(4,2,2),cplUAhUAhAhAh(4,4,4,4),& 
& cplUAhUAhcVWLmVWLm(4,4),cplUAhUAhcVWRmVWRm(4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,4,4),& 
& cplUAhUAhHppmmcHppmm(4,4,2,2),cplUAhUAhVPVP(4,4),cplUAhUAhVZRVZR(4,4),cplUAhUAhVZVZ(4,4),& 
& cplUFvFecHpmL(6,3,4),cplUFvFecHpmR(6,3,4),cplUFvFecVWLmL(6,3),cplUFvFecVWLmR(6,3),     & 
& cplUFvFecVWRmL(6,3),cplUFvFecVWRmR(6,3),cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),         & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6),cplUhhcVWLmVWLm(4),& 
& cplUhhcVWRmVWLm(4),cplUhhcVWRmVWRm(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),          & 
& cplUhhHpmcVWLm(4,4),cplUhhHpmcVWRm(4,4),cplUhhHppmmcHppmm(4,2,2),cplUhhUhhcVWLmVWLm(4,4),& 
& cplUhhUhhcVWRmVWRm(4,4),cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,4,4),              & 
& cplUhhUhhHppmmcHppmm(4,4,2,2),cplUhhUhhVPVP(4,4),cplUhhUhhVZRVZR(4,4),cplUhhUhhVZVZ(4,4),& 
& cplUhhVPVZ(4),cplUhhVPVZR(4),cplUhhVZRVZR(4),cplUhhVZVZ(4),cplUhhVZVZR(4)

Complex(dp) :: cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVPVP(4,4),           & 
& cplUHpmcUHpmVZRVZR(4,4),cplUHpmcUHpmVZVZ(4,4),cplUHpmHpmcUHpmcHpm(4,4,4,4),            & 
& cplUHpmHppmmcUHpmcHppmm(4,2,4,2),cplUHppmmcUHppmmcVWLmVWLm(2,2),cplUHppmmcUHppmmcVWRmVWRm(2,2),& 
& cplUHppmmcUHppmmVPVP(2,2),cplUHppmmcUHppmmVZRVZR(2,2),cplUHppmmcUHppmmVZVZ(2,2),       & 
& cplUHppmmHppmmcUHppmmcHppmm(2,2,2,2),cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,              & 
& cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(4,4), diff(4,4)
Complex(dp) :: Tad1Loop(4), dmz2  
Real(dp) :: comp(4), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWLm = RXi 
RXiWRm = RXi 
RXiZ = RXi 
RXiZR = RXi 

 ! Running angles 
TanBetaQ = vHu/vHd

 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,GenerationMixing,kont)

BETA2Tree  = BETA2
MU12Tree  = MU12
MU22Tree  = MU22
muLR2Tree  = muLR2

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
vHd=vSM/Sqrt(1 + TanBetaQ**2) 
vHu=TanBetaQ*vHd 
Else 
Call CouplingsForVectorBosons(gBL,g2,gR,ZZ,ZH,UP,UV,PhiW,vHd,vHu,vR,vL,               & 
& UC,UCC,ZDL,ZDR,ZUL,ZUR,ZEL,ZER,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,              & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,cplHpmcVWLmVP,cplHpmcVWRmVP,cplHppmmcHppmmVP,        & 
& cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,   & 
& cplHppmmcHppmmVPVP,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,              & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWRmVPVPVWRm3,cplAhhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,          & 
& cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,             & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,     & 
& cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,               & 
& cplHpmcVWLmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,& 
& cplcVWLmVWLmVZRVZR3,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,        & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,           & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHppmmcHpmcVWLm,cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm, & 
& cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,       & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,& 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplAhcVWRmVWLm,cplhhcVWRmVWLm,cplcgWLmgWRmVZ,cplcgWLpgWRpVZ,cplcgWLmgWRmVP,            & 
& cplcgWLpgWRpVP,cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcHpmVPVWLm,cplcHpmVPVWRm,cplAhAhVPVZ,    & 
& cplhhhhVPVZ,cplHpmcHpmVPVZ,cplHppmmcHppmmVPVZ,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,     & 
& cplcVWLmVPVWLmVZ3,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,               & 
& cplcHpmVWLmVZR,cplAhAhVPVZR,cplhhhhVPVZR,cplHpmcHpmVPVZR,cplHppmmcHppmmVPVZR,          & 
& cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,cplcVWRmVPVWRmVZR1,           & 
& cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplAhAhVZVZR,cplhhhhVZVZR,cplHpmcHpmVZVZR,       & 
& cplHppmmcHppmmVZVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,          & 
& cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,cplAhcHpmVWLm,cplcFdFuVWLmL,  & 
& cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,cplcgWLmgPVWLm,cplcgWRmgPVWLm,               & 
& cplcgPgWLpVWLm,cplcgZgWLpVWLm,cplcgZpgWLpVWLm,cplcgPgWRpVWLm,cplcgZgWRpVWLm,           & 
& cplcgZpgWRpVWLm,cplcgWLmgZVWLm,cplcgWRmgZVWLm,cplcgWLmgZpVWLm,cplcgWRmgZpVWLm,         & 
& cplhhcHpmVWLm,cplHpmcHppmmVWLm,cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplAhAhcVWRmVWLm,   & 
& cplhhhhcVWRmVWLm,cplHpmcHpmcVWRmVWLm,cplHppmmcHppmmcVWRmVWLm,cplcVWRmVPVPVWLm1,        & 
& cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,     & 
& cplcVWLmcVWRmVWLmVWLm3,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWLmVZRVZR1,             & 
& cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3)

End if 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,GenerationMixing,kont)

Call CouplingsForLoopMasses(RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,          & 
& LAM4,LAM2,LAM3,vHd,vHu,vR,vL,UP,gBL,g2,gR,ZZ,YQ1,YQ2,ZDL,ZDR,YL1,YL2,ZEL,              & 
& ZER,ZUL,ZUR,YDR,YDL,UV,PhiW,ZH,UC,RHO2,RHO4,UCC,g3,cplAhAhUhh,cplAhUhhVP,              & 
& cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,            & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,     & 
& cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,       & 
& cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,        & 
& cplUhhHpmcHpm,cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhHppmmcHppmm,cplUhhVPVZ,              & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,        & 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,     & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,        & 
& cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,              & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,             & 
& cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWLmcUHpm,             & 
& cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,        & 
& cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,       & 
& cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,      & 
& cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,               & 
& cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm, & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmHppmmcUHpmcHppmm,         & 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,cplAhHppmmcUHppmm,cplFeFecUHppmmL,cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,& 
& cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,         & 
& cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,           & 
& cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,& 
& cplHppmmcUHppmmVZR,cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,           & 
& cplAhAhUHppmmcUHppmm,cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,& 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,    & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL, & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,cplcUFeFeAhL,cplcUFeFeAhR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,cplUFvFvAhL,           & 
& cplUFvFvAhR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,  & 
& cplUFvFecVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,      & 
& cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,      & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,     & 
& cplcgWRmgWRmVP,cplcgWRpgWRpVP,cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,cplHpmcVWLmVP,         & 
& cplHpmcVWRmVP,cplHppmmcHppmmVP,cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,           & 
& cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplHppmmcHppmmVPVP,cplcVWLmVPVPVWLm1,           & 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,               & 
& cplcVWRmVPVPVWRm3,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,           & 
& cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVZVZ,cplhhVZVZR,      & 
& cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,              & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,              & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,           & 
& cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,       & 
& cplcgWRpgWRpVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,               & 
& cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,       & 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,               & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,        & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,           & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHppmmcHpmcVWLm,cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm, & 
& cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,       & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,& 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,              & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHppmmcHpmcVWRm,cplHppmmcVWRmcVWRm,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm, & 
& cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,& 
& cplcVWRmcVWRmVWRmVWRm3,cplcgWLmgWRmVZ,cplcgWLpgWRpVZ,cplcgWLmgWRmVP,cplcgWLpgWRpVP,    & 
& cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcHpmVPVWLm,cplcHpmVPVWRm,cplAhAhVPVZ,cplhhhhVPVZ,       & 
& cplHpmcHpmVPVZ,cplHppmmcHppmmVPVZ,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,& 
& cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcgWLmgWRmVZR,cplcgWLpgWRpVZR, & 
& cplcHpmVWLmVZR,cplcHpmVWRmVZR,cplAhAhVPVZR,cplhhhhVPVZR,cplHpmcHpmVPVZR,               & 
& cplHppmmcHppmmVPVZR,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplAhAhVZVZR,cplhhhhVZVZR,    & 
& cplHpmcHpmVZVZR,cplHppmmcHppmmVZVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,             & 
& cplcVWLmVWLmVZVZR3,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,           & 
& cplAhcHpmVWLm,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,cplcgWLmgPVWLm,  & 
& cplcgWRmgPVWLm,cplcgPgWLpVWLm,cplcgZgWLpVWLm,cplcgZpgWLpVWLm,cplcgPgWRpVWLm,           & 
& cplcgZgWRpVWLm,cplcgZpgWRpVWLm,cplcgWLmgZVWLm,cplcgWRmgZVWLm,cplcgWLmgZpVWLm,          & 
& cplcgWRmgZpVWLm,cplhhcHpmVWLm,cplHpmcHppmmVWLm,cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,    & 
& cplAhAhcVWRmVWLm,cplhhhhcVWRmVWLm,cplHpmcHpmcVWRmVWLm,cplHppmmcHppmmcVWRmVWLm,         & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWLmcVWRmVWLmVWLm1,          & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,& 
& cplcVWRmcVWRmVWLmVWRm3,cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,          & 
& cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3)

Call OneLoopTadpoleshh(vHd,vHu,vL,vR,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,cplAhAhUhh,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,        & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,     & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,    & 
& cplUhhHppmmcHppmm,cplUhhcVWLmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZRVZR,             & 
& Tad1Loop(1:4))

BETA2Tree  = BETA2
MU12Tree  = MU12
MU22Tree  = MU22
muLR2Tree  = muLR2
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  vHdFix = 0._dp 
  vHuFix = 0._dp 
  vRFix = 0._dp 
  vLFix = 0._dp 
   gBL_saveEP =gBL
   gBL = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
   gR_saveEP =gR
   gR = 0._dp 
     Else 
  vHdFix = vHd 
  vHuFix = vHu 
  vRFix = vR 
  vLFix = vL 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   YDR_saveEP =YDR
   where (aint(Abs(YDR)).eq.YDR) YDR=YDR*(1 + 1*1.0E-12_dp)
   YL1_saveEP =YL1
   where (aint(Abs(YL1)).eq.YL1) YL1=YL1*(1 + 2*1.0E-12_dp)
   YQ1_saveEP =YQ1
   where (aint(Abs(YQ1)).eq.YQ1) YQ1=YQ1*(1 + 3*1.0E-12_dp)
   YQ2_saveEP =YQ2
   where (aint(Abs(YQ2)).eq.YQ2) YQ2=YQ2*(1 + 4*1.0E-12_dp)
   YDL_saveEP =YDL
   where (aint(Abs(YDL)).eq.YDL) YDL=YDL*(1 + 5*1.0E-12_dp)
   YL2_saveEP =YL2
   where (aint(Abs(YL2)).eq.YL2) YL2=YL2*(1 + 6*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,              & 
& RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,             & 
& YDL,YL2,muLR2,MU22,MU12,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,vHd,vHu,vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,              & 
& BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,              & 
& YL2,muLR2,MU22,MU12,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

End if 
   YDR =YDR_saveEP 
   YL1 =YL1_saveEP 
   YQ1 =YQ1_saveEP 
   YQ2 =YQ2_saveEP 
   YDL =YDL_saveEP 
   YL2 =YL2_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   gBL =gBL_saveEP 
   g2 =g2_saveEP 
   gR =gR_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,Tad1Loop)

BETA21L = BETA2
MU121L = MU12
MU221L = MU22
muLR21L = muLR2
Tad1Loop(1:4) = Tad1Loop(1:4) - ti_ep2L 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,Tad1Loop)

BETA22L = BETA2
MU122L = MU12
MU222L = MU22
muLR22L = muLR2
Call OneLoophh(muLR22L,MU222L,MU122L,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,             & 
& BETA22L,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,            & 
& MVWRm2,MHppmm,MHppmm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,       & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhHppmmcHppmm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,               & 
& cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,     & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,  & 
& cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,0.1_dp*delta_mass,Mhh_1L,             & 
& Mhh2_1L,ZH_1L,kont)

If (TwoLoopMethod.gt.2) Then 
Call OneLoopAh(gBL,g2,gR,muLR22L,MU222L,MU122L,RHO1,RHO3,BETA1,ALP3,ALP1,             & 
& LAM1,ALP2,BETA22L,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,               & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,       & 
& cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,     & 
& cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,         & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,       & 
& cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,0.1_dp*delta_mass, & 
& MAh_1L,MAh2_1L,UP_1L,kont)

Else 
Call OneLoopAh(gBL,g2,gR,muLR21L,MU221L,MU121L,RHO1,RHO3,BETA1,ALP3,ALP1,             & 
& LAM1,ALP2,BETA21L,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,               & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,       & 
& cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,     & 
& cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,         & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,       & 
& cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,0.1_dp*delta_mass, & 
& MAh_1L,MAh2_1L,UP_1L,kont)

End if 
Call OneLoopHpm(g2,gR,muLR21L,MU221L,MU121L,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,           & 
& ALP2,BETA21L,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,PhiW,MHpm,MHpm2,MAh,MAh2,              & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,            & 
& cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWLmcUHpm,             & 
& cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,        & 
& cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,       & 
& cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,      & 
& cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,               & 
& cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm, & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmHppmmcUHpmcHppmm,         & 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,0.1_dp*delta_mass,MHpm_1L,MHpm2_1L,UC_1L,kont)

Call OneLoopHppmm(muLR21L,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,ALP2,BETA21L,           & 
& BETA3,vHd,vHu,vR,vL,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL,       & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,0.1_dp*delta_mass,MHppmm_1L,               & 
& MHppmm2_1L,UCC_1L,kont)

Call OneLoopFv(YDR,YL1,YDL,YL2,vHd,vHu,vR,vL,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,            & 
& MFe,MFe2,MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,           & 
& cplUFvFvAhR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,  & 
& cplUFvFecVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,      & 
& cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,         & 
& UV_1L,kont)

Call OneLoopVZR(gBL,g2,gR,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,              & 
& MVWRm2,MHppmm,MHppmm2,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,               & 
& cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,        & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,         & 
& cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,       & 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,               & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,0.1_dp*delta_mass,MVZR_1L,MVZR2_1L,kont)

Call OneLoopVWRm(g2,gR,vHd,vHu,vR,vL,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,           & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm,MHppmm2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,       & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,           & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,       & 
& cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,              & 
& cplHppmmcHpmcVWRm,cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm, & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,        & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,0.1_dp*delta_mass,MVWRm_1L,MVWRm2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
UP = UP_1L 
MHpm = MHpm_1L 
MHpm2 = MHpm2_1L 
UC = UC_1L 
MHppmm = MHppmm_1L 
MHppmm2 = MHppmm2_1L 
UCC = UCC_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MVZR = MVZR_1L 
MVZR2 = MVZR2_1L 
MVWRm = MVWRm_1L 
MVWRm2 = MVWRm2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,               & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,kont)

! Set pole masses 
MVWLm = mW 
MVWLm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWLm = 1._dp 
RXiWRm = 1._dp 
RXiZ = 1._dp 
RXiZR = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
BETA2  = BETA2Tree 
MU12  = MU12Tree 
MU22  = MU22Tree 
muLR2  = muLR2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(vHd,vHu,vL,vR,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,cplAhAhUhh,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,    & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,     & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,    & 
& cplUhhHppmmcHppmm,cplUhhcVWLmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZRVZR,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),        & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),        & 
& cplFvFvUhhR(6,6,4),cplcgWLmgWLmUhh(4),cplcgWLpgWLpUhh(4),cplcgWRmgWRmUhh(4),           & 
& cplcgWRpgWRpUhh(4),cplcgZgZUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),& 
& cplUhhHppmmcHppmm(4,2,2),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWRm(4),cplUhhVZVZ(4),          & 
& cplUhhVZRVZR(4)

Real(dp), Intent(in) :: vHd,vHu,vL,vR

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(4)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(MAh2(i1)) 
  Do gO1 = 1, 4
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 6
 A0m = 2._dp*MFv(i1)*SA_A0(MFv2(i1)) 
  Do gO1 = 1, 4
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWLm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWLm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWLmgWLmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWLmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWLm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWLpgWLpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWRm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWRmgWRmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWRm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWRpgWRpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZR] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZR2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(MHpm2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhHpmcHpm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
Do i1 = 1, 2
 A0m = SA_A0(MHppmm2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhHppmmcHppmm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWLm2)+RXi*SA_A0(MVWLm2*RXi) - 2._dp*MVWLm2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhcVWLmVWLm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWRm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWRm2)+RXi*SA_A0(MVWRm2*RXi) - 2._dp*MVWRm2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhcVWRmVWRm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! VZR 
!------------------------ 
A0m = 3._dp*SA_A0(MVZR2)+RXi*SA_A0(MVZR2*RXi) - 2._dp*MVZR2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZRVZR(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,             & 
& BETA2,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm,MHppmm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,              & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhHppmmcHppmm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,               & 
& cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,     & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,  & 
& cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MVZ,MVZ2,MVZR,MVZR2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,             & 
& MVWRm2,MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,            & 
& LAM3,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),cplcFdFdUhhL(3,3,4),& 
& cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),       & 
& cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),cplcgWLmgWLmUhh(4),          & 
& cplcgWRmgWLmUhh(4),cplcgWLmgWRmUhh(4),cplcgWLpgWLpUhh(4),cplcgWRpgWLpUhh(4),           & 
& cplcgWLpgWRpUhh(4),cplcgWRmgWRmUhh(4),cplcgWRpgWRpUhh(4),cplcgZgZUhh(4),               & 
& cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),& 
& cplUhhHpmcVWLm(4,4),cplUhhHpmcVWRm(4,4),cplUhhHppmmcHppmm(4,2,2),cplUhhVPVZ(4),        & 
& cplUhhVPVZR(4),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWLm(4),cplUhhcVWRmVWRm(4),               & 
& cplUhhVZVZ(4),cplUhhVZVZR(4),cplUhhVZRVZR(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),& 
& cplUhhUhhHpmcHpm(4,4,4,4),cplUhhUhhHppmmcHppmm(4,4,2,2),cplUhhUhhVPVP(4,4),            & 
& cplUhhUhhcVWLmVWLm(4,4),cplUhhUhhcVWRmVWRm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+3*LAM1*vHd**2
mat2a(1,1) = mat2a(1,1)-6*LAM4*vHd*vHu
mat2a(1,1) = mat2a(1,1)+LAM1*vHu**2
mat2a(1,1) = mat2a(1,1)+4*LAM2*vHu**2
mat2a(1,1) = mat2a(1,1)+2*LAM3*vHu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vL**2)/2._dp
mat2a(1,1) = mat2a(1,1)-(BETA2*vL*vR)
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)-3*LAM4*vHd**2
mat2a(1,2) = mat2a(1,2)+2*LAM1*vHd*vHu
mat2a(1,2) = mat2a(1,2)+8*LAM2*vHd*vHu
mat2a(1,2) = mat2a(1,2)+4*LAM3*vHd*vHu
mat2a(1,2) = mat2a(1,2)-3*LAM4*vHu**2
mat2a(1,2) = mat2a(1,2)-(ALP2*vL**2)
mat2a(1,2) = mat2a(1,2)+(BETA1*vL*vR)/2._dp
mat2a(1,2) = mat2a(1,2)-(ALP2*vR**2)
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)-(BETA2*vHd*vL)
mat2a(1,3) = mat2a(1,3)+(BETA1*vHu*vL)/2._dp
mat2a(1,3) = mat2a(1,3)+ALP1*vHd*vR
mat2a(1,3) = mat2a(1,3)-2*ALP2*vHu*vR
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)+ALP1*vHd*vL
mat2a(1,4) = mat2a(1,4)-2*ALP2*vHu*vL
mat2a(1,4) = mat2a(1,4)-(BETA2*vHd*vR)
mat2a(1,4) = mat2a(1,4)+(BETA1*vHu*vR)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vHd**2
mat2a(2,2) = mat2a(2,2)+4*LAM2*vHd**2
mat2a(2,2) = mat2a(2,2)+2*LAM3*vHd**2
mat2a(2,2) = mat2a(2,2)-6*LAM4*vHd*vHu
mat2a(2,2) = mat2a(2,2)+3*LAM1*vHu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vL**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vL**2)/2._dp
mat2a(2,2) = mat2a(2,2)-(BETA3*vL*vR)
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+(BETA1*vHd*vL)/2._dp
mat2a(2,3) = mat2a(2,3)-(BETA3*vHu*vL)
mat2a(2,3) = mat2a(2,3)-2*ALP2*vHd*vR
mat2a(2,3) = mat2a(2,3)+ALP1*vHu*vR
mat2a(2,3) = mat2a(2,3)+ALP3*vHu*vR
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-2*ALP2*vHd*vL
mat2a(2,4) = mat2a(2,4)+ALP1*vHu*vL
mat2a(2,4) = mat2a(2,4)+ALP3*vHu*vL
mat2a(2,4) = mat2a(2,4)+(BETA1*vHd*vR)/2._dp
mat2a(2,4) = mat2a(2,4)-(BETA3*vHu*vR)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(muLR2)
mat2a(3,3) = mat2a(3,3)+(ALP1*vHd**2)/2._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vHd*vHu
mat2a(3,3) = mat2a(3,3)+(ALP1*vHu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vHu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(RHO3*vL**2)/2._dp
mat2a(3,3) = mat2a(3,3)+3*RHO1*vR**2
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(BETA2*vHd**2)/2._dp
mat2a(3,4) = mat2a(3,4)+(BETA1*vHd*vHu)/2._dp
mat2a(3,4) = mat2a(3,4)-(BETA3*vHu**2)/2._dp
mat2a(3,4) = mat2a(3,4)+RHO3*vL*vR
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp*(muLR2)
mat2a(4,4) = mat2a(4,4)+(ALP1*vHd**2)/2._dp
mat2a(4,4) = mat2a(4,4)-2*ALP2*vHd*vHu
mat2a(4,4) = mat2a(4,4)+(ALP1*vHu**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(ALP3*vHu**2)/2._dp
mat2a(4,4) = mat2a(4,4)+3*RHO1*vL**2
mat2a(4,4) = mat2a(4,4)+(RHO3*vR**2)/2._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplAhAhUhh,      & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhHppmmcHppmm,              & 
& cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,& 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,     & 
& kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplAhAhUhh,      & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhHppmmcHppmm,              & 
& cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,& 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplAhAhUhh,      & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhHppmmcHppmm,              & 
& cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,& 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,        & 
& cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,   & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhHppmmcHppmm,              & 
& cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhHppmmcHppmm,& 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MVZ,MVZ2,MVZR,MVZR2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,             & 
& MVWRm2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),cplcFdFdUhhL(3,3,4),& 
& cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),       & 
& cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),cplcgWLmgWLmUhh(4),          & 
& cplcgWRmgWLmUhh(4),cplcgWLmgWRmUhh(4),cplcgWLpgWLpUhh(4),cplcgWRpgWLpUhh(4),           & 
& cplcgWLpgWRpUhh(4),cplcgWRmgWRmUhh(4),cplcgWRpgWRpUhh(4),cplcgZgZUhh(4),               & 
& cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),& 
& cplUhhHpmcVWLm(4,4),cplUhhHpmcVWRm(4,4),cplUhhHppmmcHppmm(4,2,2),cplUhhVPVZ(4),        & 
& cplUhhVPVZR(4),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWLm(4),cplUhhcVWRmVWRm(4),               & 
& cplUhhVZVZ(4),cplUhhVZVZR(4),cplUhhVZRVZR(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),& 
& cplUhhUhhHpmcHpm(4,4,4,4),cplUhhUhhHppmmcHppmm(4,4,2,2),cplUhhUhhVPVP(4,4),            & 
& cplUhhUhhcVWLmVWLm(4,4),cplUhhUhhcVWRmVWRm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZR(i2,gO1)
coup2 =  Conjg(cplAhUhhVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgWLmUhh(gO1)
coup2 =  cplcgWLmgWLmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWLmUhh(gO1)
coup2 =  cplcgWLmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgWLpUhh(gO1)
coup2 =  cplcgWLpgWLpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWLpUhh(gO1)
coup2 =  cplcgWLpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWRmUhh(gO1)
coup2 =  cplcgWRmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWRpUhh(gO1)
coup2 =  cplcgWRpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZR], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcVWLm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcVWRm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHppmm2(i1),MHppmm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHppmmcHppmm(gO1,i2,i1)
coup2 = Conjg(cplUhhHppmmcHppmm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZR(gO1)
coup2 =  Conjg(cplUhhVPVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWLmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWLmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWRm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWRmVWRm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZR(gO1)
coup2 =  Conjg(cplUhhVZVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZR2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZRVZR(gO1)
coup2 =  Conjg(cplUhhVZRVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHppmm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhHppmmcHppmm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopAh(gBL,g2,gR,muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,             & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,               & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,       & 
& cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,     & 
& cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,         & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,       & 
& cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,delta,             & 
& mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: gBL,g2,gR,muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,            & 
& LAM4,LAM2,LAM3,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),cplcFeFeUAhL(3,3,4),        & 
& cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplFvFvUAhL(6,6,4),        & 
& cplFvFvUAhR(6,6,4),cplcgWLmgWLmUAh(4),cplcgWRmgWLmUAh(4),cplcgWLmgWRmUAh(4),           & 
& cplcgWLpgWLpUAh(4),cplcgWRpgWLpUAh(4),cplcgWLpgWRpUAh(4),cplcgWRmgWRmUAh(4),           & 
& cplcgWRpgWRpUAh(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),& 
& cplUAhHpmcVWLm(4,4),cplUAhHpmcVWRm(4,4),cplUAhHppmmcHppmm(4,2,2),cplUAhcVWRmVWLm(4),   & 
& cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,4,4),               & 
& cplUAhUAhHppmmcHppmm(4,4,2,2),cplUAhUAhVPVP(4,4),cplUAhUAhcVWLmVWLm(4,4),              & 
& cplUAhUAhcVWRmVWRm(4,4),cplUAhUAhVZVZ(4,4),cplUAhUAhVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+LAM1*vHd**2
mat2a(1,1) = mat2a(1,1)-2*LAM4*vHd*vHu
mat2a(1,1) = mat2a(1,1)+LAM1*vHu**2
mat2a(1,1) = mat2a(1,1)-4*LAM2*vHu**2
mat2a(1,1) = mat2a(1,1)+2*LAM3*vHu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vL**2)/2._dp
mat2a(1,1) = mat2a(1,1)+BETA2*vL*vR
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vHd**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vHd**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vHd**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vHd**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vHd**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vHd**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vHd**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vHd**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)+LAM4*vHd**2
mat2a(1,2) = mat2a(1,2)-8*LAM2*vHd*vHu
mat2a(1,2) = mat2a(1,2)+LAM4*vHu**2
mat2a(1,2) = mat2a(1,2)+ALP2*vL**2
mat2a(1,2) = mat2a(1,2)+(BETA1*vL*vR)/2._dp
mat2a(1,2) = mat2a(1,2)+ALP2*vR**2
mat2a(1,2) = mat2a(1,2)-(g2**2*vHd*vHu*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHd*vHu*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vHd*vHu*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHd*vHu*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHd*vHu*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vHd*vHu*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHd*vHu*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vHd*vHu*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)-(BETA2*vHd*vL)
mat2a(1,3) = mat2a(1,3)+(BETA1*vHu*vL)/2._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vHd*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vHd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vHd*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vHd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vHd*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vHd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vHd*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vHd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vHd*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vHd*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(gR**2*vHd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vHd*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vHd*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = mat2a(1,3)+(gR**2*vHd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)+BETA2*vHd*vR
mat2a(1,4) = mat2a(1,4)-(BETA1*vHu*vR)/2._dp
mat2a(1,4) = mat2a(1,4)+(g2*gBL*vHd*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,4) = mat2a(1,4)-(gBL*gR*vHd*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,4) = mat2a(1,4)+(g2*gBL*vHd*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,4) = mat2a(1,4)-(gBL*gR*vHd*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,4) = mat2a(1,4)+(g2*gBL*vHd*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,4) = mat2a(1,4)-(g2**2*vHd*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/2._dp
mat2a(1,4) = mat2a(1,4)+(g2*gR*vHd*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,4) = mat2a(1,4)+(g2*gBL*vHd*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,4) = mat2a(1,4)-(g2**2*vHd*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/2._dp
mat2a(1,4) = mat2a(1,4)+(g2*gR*vHd*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,4) = mat2a(1,4)-(gBL*gR*vHd*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,4) = mat2a(1,4)+(g2*gR*vHd*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,4) = mat2a(1,4)-(gBL*gR*vHd*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,4) = mat2a(1,4)+(g2*gR*vHd*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vHd**2
mat2a(2,2) = mat2a(2,2)-4*LAM2*vHd**2
mat2a(2,2) = mat2a(2,2)+2*LAM3*vHd**2
mat2a(2,2) = mat2a(2,2)-2*LAM4*vHd*vHu
mat2a(2,2) = mat2a(2,2)+LAM1*vHu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vL**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vL**2)/2._dp
mat2a(2,2) = mat2a(2,2)+BETA3*vL*vR
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vHu**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vHu**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vHu**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vHu**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vHu**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vHu**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vHu**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vHu**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(BETA1*vHd*vL)/2._dp
mat2a(2,3) = mat2a(2,3)+BETA3*vHu*vL
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vHu*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vHu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vHu*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vHu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vHu*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vHu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vHu*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vHu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vHu*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vHu*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(gR**2*vHu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vHu*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vHu*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = mat2a(2,3)-(gR**2*vHu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)+(BETA1*vHd*vR)/2._dp
mat2a(2,4) = mat2a(2,4)-(BETA3*vHu*vR)
mat2a(2,4) = mat2a(2,4)-(g2*gBL*vHu*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,4) = mat2a(2,4)+(gBL*gR*vHu*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,4) = mat2a(2,4)-(g2*gBL*vHu*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,4) = mat2a(2,4)+(gBL*gR*vHu*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,4) = mat2a(2,4)-(g2*gBL*vHu*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,4) = mat2a(2,4)+(g2**2*vHu*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/2._dp
mat2a(2,4) = mat2a(2,4)-(g2*gR*vHu*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,4) = mat2a(2,4)-(g2*gBL*vHu*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,4) = mat2a(2,4)+(g2**2*vHu*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/2._dp
mat2a(2,4) = mat2a(2,4)-(g2*gR*vHu*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,4) = mat2a(2,4)+(gBL*gR*vHu*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,4) = mat2a(2,4)-(g2*gR*vHu*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,4) = mat2a(2,4)+(gBL*gR*vHu*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,4) = mat2a(2,4)-(g2*gR*vHu*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(muLR2)
mat2a(3,3) = mat2a(3,3)+(ALP1*vHd**2)/2._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vHd*vHu
mat2a(3,3) = mat2a(3,3)+(ALP1*vHu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vHu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(RHO3*vL**2)/2._dp
mat2a(3,3) = mat2a(3,3)+RHO1*vR**2
mat2a(3,3) = mat2a(3,3)+gBL**2*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat2a(3,3) = mat2a(3,3)+gBL**2*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat2a(3,3) = mat2a(3,3)+gR**2*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat2a(3,3) = mat2a(3,3)+gR**2*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3)
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(BETA2*vHd**2)/2._dp
mat2a(3,4) = mat2a(3,4)+(BETA1*vHd*vHu)/2._dp
mat2a(3,4) = mat2a(3,4)-(BETA3*vHu**2)/2._dp
mat2a(3,4) = mat2a(3,4)+gBL**2*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat2a(3,4) = mat2a(3,4)-(g2*gBL*vL*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/2._dp
mat2a(3,4) = mat2a(3,4)-(gBL*gR*vL*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/2._dp
mat2a(3,4) = mat2a(3,4)+gBL**2*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat2a(3,4) = mat2a(3,4)-(g2*gBL*vL*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/2._dp
mat2a(3,4) = mat2a(3,4)-(gBL*gR*vL*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/2._dp
mat2a(3,4) = mat2a(3,4)-(g2*gBL*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/2._dp
mat2a(3,4) = mat2a(3,4)+(g2*gR*vL*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/2._dp
mat2a(3,4) = mat2a(3,4)-(g2*gBL*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/2._dp
mat2a(3,4) = mat2a(3,4)+(g2*gR*vL*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/2._dp
mat2a(3,4) = mat2a(3,4)-(gBL*gR*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(3,4) = mat2a(3,4)+(g2*gR*vL*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(3,4) = mat2a(3,4)-(gBL*gR*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(3,4) = mat2a(3,4)+(g2*gR*vL*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp*(muLR2)
mat2a(4,4) = mat2a(4,4)+(ALP1*vHd**2)/2._dp
mat2a(4,4) = mat2a(4,4)-2*ALP2*vHd*vHu
mat2a(4,4) = mat2a(4,4)+(ALP1*vHu**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(ALP3*vHu**2)/2._dp
mat2a(4,4) = mat2a(4,4)+RHO1*vL**2
mat2a(4,4) = mat2a(4,4)+(RHO3*vR**2)/2._dp
mat2a(4,4) = mat2a(4,4)+gBL**2*vL**2*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat2a(4,4) = mat2a(4,4)-(g2*gBL*vL**2*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))
mat2a(4,4) = mat2a(4,4)+gBL**2*vL**2*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat2a(4,4) = mat2a(4,4)-(g2*gBL*vL**2*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))
mat2a(4,4) = mat2a(4,4)-(g2*gBL*vL**2*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))
mat2a(4,4) = mat2a(4,4)+g2**2*vL**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2)
mat2a(4,4) = mat2a(4,4)-(g2*gBL*vL**2*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))
mat2a(4,4) = mat2a(4,4)+g2**2*vL**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,        & 
& cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,              & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UPOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,        & 
& cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,              & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,        & 
& cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,              & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UPOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,          & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhHppmmcHppmm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,        & 
& cplUAhUAhHppmmcHppmm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,              & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),cplcFeFeUAhL(3,3,4),        & 
& cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplFvFvUAhL(6,6,4),        & 
& cplFvFvUAhR(6,6,4),cplcgWLmgWLmUAh(4),cplcgWRmgWLmUAh(4),cplcgWLmgWRmUAh(4),           & 
& cplcgWLpgWLpUAh(4),cplcgWRpgWLpUAh(4),cplcgWLpgWRpUAh(4),cplcgWRmgWRmUAh(4),           & 
& cplcgWRpgWRpUAh(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),& 
& cplUAhHpmcVWLm(4,4),cplUAhHpmcVWRm(4,4),cplUAhHppmmcHppmm(4,2,2),cplUAhcVWRmVWLm(4),   & 
& cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,4,4),               & 
& cplUAhUAhHppmmcHppmm(4,4,2,2),cplUAhUAhVPVP(4,4),cplUAhUAhcVWLmVWLm(4,4),              & 
& cplUAhUAhcVWRmVWRm(4,4),cplUAhUAhVZVZ(4,4),cplUAhUAhVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgWLmUAh(gO1)
coup2 =  cplcgWLmgWLmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWLmUAh(gO1)
coup2 =  cplcgWLmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgWLpUAh(gO1)
coup2 =  cplcgWLpgWLpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWLpUAh(gO1)
coup2 =  cplcgWLpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWRmUAh(gO1)
coup2 =  cplcgWRmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWRpUAh(gO1)
coup2 =  cplcgWRpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZR(gO1,i2)
coup2 =  Conjg(cplUAhhhVZR(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcVWLm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcVWRm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHppmm2(i1),MHppmm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHppmmcHppmm(gO1,i2,i1)
coup2 = Conjg(cplUAhHppmmcHppmm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUAhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHppmm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhHppmmcHppmm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoopHpm(g2,gR,muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,           & 
& ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,vHd,vHu,vR,vL,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,  & 
& cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,             & 
& cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,      & 
& cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,         & 
& cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,       & 
& cplhhcUHpmVWLm,cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,              & 
& cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm,cplcUHpmVPVWRm, & 
& cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplAhAhUHpmcUHpm,        & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmHppmmcUHpmcHppmm,cplUHpmcUHpmVPVP,         & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,       & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MFu(3),MFu2(3),             & 
& MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,             & 
& MVZR2,MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: g2,gR,muLR2,MU22,MU12,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,           & 
& LAM2,LAM3,vHd,vHu,vR,vL,PhiW

Complex(dp), Intent(in) :: cplAhHpmcUHpm(4,4,4),cplAhcUHpmVWLm(4,4),cplAhcUHpmVWRm(4,4),cplcFuFdcUHpmL(3,3,4),   & 
& cplcFuFdcUHpmR(3,3,4),cplFvFecUHpmL(6,3,4),cplFvFecUHpmR(6,3,4),cplcgZgWLmcUHpm(4),    & 
& cplcgWLmgZUHpm(4),cplcgZpgWLmcUHpm(4),cplcgWLmgZpUHpm(4),cplcgZgWRmcUHpm(4),           & 
& cplcgWRmgZUHpm(4),cplcgZpgWRmcUHpm(4),cplcgWRmgZpUHpm(4),cplcgWLpgZcUHpm(4),           & 
& cplcgZgWLpUHpm(4),cplcgWRpgZcUHpm(4),cplcgZgWRpUHpm(4),cplcgWLpgZpcUHpm(4),            & 
& cplcgZpgWLpUHpm(4),cplcgWRpgZpcUHpm(4),cplcgZpgWRpUHpm(4),cplhhHpmcUHpm(4,4,4),        & 
& cplhhcUHpmVWLm(4,4),cplhhcUHpmVWRm(4,4),cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),         & 
& cplHpmcUHpmVZR(4,4),cplHppmmcUHpmcHpm(2,4,4),cplHppmmcUHpmcVWLm(2,4),cplHppmmcUHpmcVWRm(2,4),& 
& cplcUHpmVPVWLm(4),cplcUHpmVPVWRm(4),cplcUHpmVWLmVZ(4),cplcUHpmVWLmVZR(4),              & 
& cplcUHpmVWRmVZ(4),cplcUHpmVWRmVZR(4),cplAhAhUHpmcUHpm(4,4,4,4),cplhhhhUHpmcUHpm(4,4,4,4),& 
& cplUHpmHpmcUHpmcHpm(4,4,4,4),cplUHpmHppmmcUHpmcHppmm(4,2,4,2),cplUHpmcUHpmVPVP(4,4),   & 
& cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVZVZ(4,4),           & 
& cplUHpmcUHpmVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHpm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+LAM1*vHd**2
mat2a(1,1) = mat2a(1,1)-2*LAM4*vHd*vHu
mat2a(1,1) = mat2a(1,1)+LAM1*vHu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vL**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(ALP3*vL**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vHd**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vHu**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vHd*vHu*Cos(PhiW)*RXiWLm*Sin(PhiW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g2*gR*vHd*vHu*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vHu**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vHd**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)+LAM4*vHd**2
mat2a(1,2) = mat2a(1,2)-4*LAM2*vHd*vHu
mat2a(1,2) = mat2a(1,2)-2*LAM3*vHd*vHu
mat2a(1,2) = mat2a(1,2)+LAM4*vHu**2
mat2a(1,2) = mat2a(1,2)+ALP2*vL**2
mat2a(1,2) = mat2a(1,2)+ALP2*vR**2
mat2a(1,2) = mat2a(1,2)-(g2**2*vHd*vHu*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vHd*vHu*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHd**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vHu**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2*gR*vHd**2*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2*gR*vHu**2*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vHd*vHu*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vHd*vHu*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(BETA1*vHd*vL)/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)-((BETA3*vHu*vL)/sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(ALP3*vHu*vR)/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(gR**2*vHu*vR*Cos(PhiW)**2*RXiWRm)/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)-(g2*gR*vHd*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(g2*gR*vHd*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(gR**2*vHu*vR*RXiWLm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)+(ALP3*vHd*vL)/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(BETA2*vHd*vR)/sqrt(2._dp)
mat2a(1,4) = mat2a(1,4)-(BETA1*vHu*vR)/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)-(g2**2*vHd*vL*Cos(PhiW)**2*RXiWLm)/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(g2*gR*vHu*vL*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)-(g2*gR*vHu*vL*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)-(g2**2*vHd*vL*RXiWRm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vHd**2
mat2a(2,2) = mat2a(2,2)-2*LAM4*vHd*vHu
mat2a(2,2) = mat2a(2,2)+LAM1*vHu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vL**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vHu**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vHd**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vHd*vHu*Cos(PhiW)*RXiWLm*Sin(PhiW))/2._dp
mat2a(2,2) = mat2a(2,2)+(g2*gR*vHd*vHu*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vHd**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vHu**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+(BETA2*vHd*vL)/sqrt(2._dp)
mat2a(2,3) = mat2a(2,3)-(BETA1*vHu*vL)/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)+(ALP3*vHd*vR)/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(gR**2*vHd*vR*Cos(PhiW)**2*RXiWRm)/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)+(g2*gR*vHu*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(g2*gR*vHu*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(gR**2*vHd*vR*RXiWLm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)+(ALP3*vHu*vL)/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(BETA1*vHd*vR)/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)-((BETA3*vHu*vR)/sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(g2**2*vHu*vL*Cos(PhiW)**2*RXiWLm)/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)-(g2*gR*vHd*vL*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(g2*gR*vHd*vL*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(g2**2*vHu*vL*RXiWRm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(muLR2)
mat2a(3,3) = mat2a(3,3)+(ALP1*vHd**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vHd**2)/4._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vHd*vHu
mat2a(3,3) = mat2a(3,3)+(ALP1*vHu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vHu**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(RHO3*vL**2)/2._dp
mat2a(3,3) = mat2a(3,3)+RHO1*vR**2
mat2a(3,3) = mat2a(3,3)+(gR**2*vR**2*Cos(PhiW)**2*RXiWRm)/2._dp
mat2a(3,3) = mat2a(3,3)+(gR**2*vR**2*RXiWLm*Sin(PhiW)**2)/2._dp
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)+(BETA1*vHd**2)/4._dp
mat2a(3,4) = mat2a(3,4)-(BETA2*vHd*vHu)/2._dp
mat2a(3,4) = mat2a(3,4)-(BETA3*vHd*vHu)/2._dp
mat2a(3,4) = mat2a(3,4)+(BETA1*vHu**2)/4._dp
mat2a(3,4) = mat2a(3,4)+(g2*gR*vL*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/2._dp
mat2a(3,4) = mat2a(3,4)-(g2*gR*vL*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp*(muLR2)
mat2a(4,4) = mat2a(4,4)+(ALP1*vHd**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(ALP3*vHd**2)/4._dp
mat2a(4,4) = mat2a(4,4)-2*ALP2*vHd*vHu
mat2a(4,4) = mat2a(4,4)+(ALP1*vHu**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(ALP3*vHu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+RHO1*vL**2
mat2a(4,4) = mat2a(4,4)+(RHO3*vR**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(g2**2*vL**2*Cos(PhiW)**2*RXiWLm)/2._dp
mat2a(4,4) = mat2a(4,4)+(g2**2*vL**2*RXiWRm*Sin(PhiW)**2)/2._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,            & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcUHpm,  & 
& cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,             & 
& cplFvFecUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,         & 
& cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,       & 
& cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,        & 
& cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,          & 
& cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,       & 
& cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm,cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,       & 
& cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,  & 
& cplUHpmHppmmcUHpmcHppmm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,  & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = MHpm2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,            & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcUHpm,  & 
& cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,             & 
& cplFvFecUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,         & 
& cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,       & 
& cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,        & 
& cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,          & 
& cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,       & 
& cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm,cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,       & 
& cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,  & 
& cplUHpmHppmmcUHpmcHppmm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,  & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,            & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcUHpm,  & 
& cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,             & 
& cplFvFecUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,         & 
& cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,       & 
& cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,        & 
& cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,          & 
& cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,cplHppmmcUHpmcVWLm,       & 
& cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm,cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,       & 
& cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,  & 
& cplUHpmHppmmcUHpmcHppmm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,  & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHpm
 
 
Subroutine Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,               & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,               & 
& MHppmm2,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,     & 
& cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,           & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplHppmmcUHpmcHpm,           & 
& cplHppmmcUHpmcVWLm,cplHppmmcUHpmcVWRm,cplcUHpmVPVWLm,cplcUHpmVPVWRm,cplcUHpmVWLmVZ,    & 
& cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,      & 
& cplUHpmHpmcUHpmcHpm,cplUHpmHppmmcUHpmcHppmm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,    & 
& cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MFu(3),MFu2(3),             & 
& MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,             & 
& MVZR2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhHpmcUHpm(4,4,4),cplAhcUHpmVWLm(4,4),cplAhcUHpmVWRm(4,4),cplcFuFdcUHpmL(3,3,4),   & 
& cplcFuFdcUHpmR(3,3,4),cplFvFecUHpmL(6,3,4),cplFvFecUHpmR(6,3,4),cplcgZgWLmcUHpm(4),    & 
& cplcgWLmgZUHpm(4),cplcgZpgWLmcUHpm(4),cplcgWLmgZpUHpm(4),cplcgZgWRmcUHpm(4),           & 
& cplcgWRmgZUHpm(4),cplcgZpgWRmcUHpm(4),cplcgWRmgZpUHpm(4),cplcgWLpgZcUHpm(4),           & 
& cplcgZgWLpUHpm(4),cplcgWRpgZcUHpm(4),cplcgZgWRpUHpm(4),cplcgWLpgZpcUHpm(4),            & 
& cplcgZpgWLpUHpm(4),cplcgWRpgZpcUHpm(4),cplcgZpgWRpUHpm(4),cplhhHpmcUHpm(4,4,4),        & 
& cplhhcUHpmVWLm(4,4),cplhhcUHpmVWRm(4,4),cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),         & 
& cplHpmcUHpmVZR(4,4),cplHppmmcUHpmcHpm(2,4,4),cplHppmmcUHpmcVWLm(2,4),cplHppmmcUHpmcVWRm(2,4),& 
& cplcUHpmVPVWLm(4),cplcUHpmVPVWRm(4),cplcUHpmVWLmVZ(4),cplcUHpmVWLmVZR(4),              & 
& cplcUHpmVWRmVZ(4),cplcUHpmVWRmVZR(4),cplAhAhUHpmcUHpm(4,4,4,4),cplhhhhUHpmcUHpm(4,4,4,4),& 
& cplUHpmHpmcUHpmcHpm(4,4,4,4),cplUHpmHppmmcUHpmcHppmm(4,2,4,2),cplUHpmcUHpmVPVP(4,4),   & 
& cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVZVZ(4,4),           & 
& cplUHpmcUHpmVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhcUHpmVWLm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhcUHpmVWRm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFecUHpmL(i1,i2,gO1)
coupR1 = cplFvFecUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFecUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFecUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgWLmcUHpm(gO1)
coup2 =  cplcgWLmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgWLmcUHpm(gO1)
coup2 =  cplcgWLmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgWRmcUHpm(gO1)
coup2 =  cplcgWRmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgWRmcUHpm(gO1)
coup2 =  cplcgWRmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgZcUHpm(gO1)
coup2 =  cplcgZgWLpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgZcUHpm(gO1)
coup2 =  cplcgZgWRpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgZpcUHpm(gO1)
coup2 =  cplcgZpgWLpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgZpcUHpm(gO1)
coup2 =  cplcgZpgWRpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhcUHpmVWLm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhcUHpmVWRm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVZR(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHppmm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHppmmcUHpmcHpm(i2,gO1,i1)
coup2 = Conjg(cplHppmmcUHpmcHpm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHppmm2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHppmmcUHpmcVWLm(i2,gO1)
coup2 =  Conjg(cplHppmmcUHpmcVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHppmm2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHppmmcUHpmcVWRm(i2,gO1)
coup2 =  Conjg(cplHppmmcUHpmcVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVPVWLm(gO1)
coup2 =  Conjg(cplcUHpmVPVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVPVWRm(gO1)
coup2 =  Conjg(cplcUHpmVPVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVWLmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWLmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVWLmVZR(gO1)
coup2 =  Conjg(cplcUHpmVWLmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWRm2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVWRmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWRmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWRm2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmVWRmVZR(gO1)
coup2 =  Conjg(cplcUHpmVWRmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHppmm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmHppmmcUHpmcHppmm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmcVWLmVWLm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmcVWRmVWRm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmVZRVZR(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHpm 
 
Subroutine OneLoopHppmm(muLR2,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,ALP2,               & 
& BETA2,BETA3,vHd,vHu,vR,vL,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,              & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL, & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MHppmm(2),MHppmm2(2),MAh(4),MAh2(4),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MHpm(4),            & 
& MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: muLR2,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,ALP2,BETA2,BETA3,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: cplAhHppmmcUHppmm(4,2,2),cplFeFecUHppmmL(3,3,2),cplFeFecUHppmmR(3,3,2),               & 
& cplcgWLpgWLmcUHppmm(2),cplcgWLmgWLpUHppmm(2),cplcgWRpgWLmcUHppmm(2),cplcgWLmgWRpUHppmm(2),& 
& cplcgWLpgWRmcUHppmm(2),cplcgWRmgWLpUHppmm(2),cplcgWRpgWRmcUHppmm(2),cplcgWRmgWRpUHppmm(2),& 
& cplhhHppmmcUHppmm(4,2,2),cplHpmHpmcUHppmm(4,4,2),cplHpmcUHppmmVWLm(4,2),               & 
& cplHpmcUHppmmVWRm(4,2),cplHppmmcUHppmmVP(2,2),cplHppmmcUHppmmVZ(2,2),cplHppmmcUHppmmVZR(2,2),& 
& cplcUHppmmVWLmVWLm(2),cplcUHppmmVWLmVWRm(2),cplcUHppmmVWRmVWRm(2),cplAhAhUHppmmcUHppmm(4,4,2,2),& 
& cplhhhhUHppmmcUHppmm(4,4,2,2),cplHpmUHppmmcHpmcUHppmm(4,2,4,2),cplUHppmmHppmmcUHppmmcHppmm(2,2,2,2),& 
& cplUHppmmcUHppmmVPVP(2,2),cplUHppmmcUHppmmcVWLmVWLm(2,2),cplUHppmmcUHppmmcVWRmVWRm(2,2),& 
& cplUHppmmcUHppmmVZVZ(2,2),cplUHppmmcUHppmmVZRVZR(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHppmm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(muLR2)
mat2a(1,1) = mat2a(1,1)+(ALP1*vHd**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(ALP3*vHd**2)/2._dp
mat2a(1,1) = mat2a(1,1)-2*ALP2*vHd*vHu
mat2a(1,1) = mat2a(1,1)+(ALP1*vHu**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(RHO3*vL**2)/2._dp
mat2a(1,1) = mat2a(1,1)+RHO1*vR**2
mat2a(1,1) = mat2a(1,1)+2*RHO2*vR**2
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-(BETA3*vHd**2)/2._dp
mat2a(1,2) = mat2a(1,2)+(BETA1*vHd*vHu)/2._dp
mat2a(1,2) = mat2a(1,2)-(BETA2*vHu**2)/2._dp
mat2a(1,2) = mat2a(1,2)+2*RHO4*vL*vR
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(muLR2)
mat2a(2,2) = mat2a(2,2)+(ALP1*vHd**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vHd**2)/2._dp
mat2a(2,2) = mat2a(2,2)-2*ALP2*vHd*vHu
mat2a(2,2) = mat2a(2,2)+(ALP1*vHu**2)/2._dp
mat2a(2,2) = mat2a(2,2)+RHO1*vL**2
mat2a(2,2) = mat2a(2,2)+2*RHO2*vL**2
mat2a(2,2) = mat2a(2,2)+(RHO3*vR**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopHppmm(p2,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL,       & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCCOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MHppmm2(i1)
Call Pi1LoopHppmm(p2,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL,       & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopHppmm(p2,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL,       & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCCOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHppmm
 
 
Subroutine Pi1LoopHppmm(p2,MHppmm,MHppmm2,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHpm,            & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhHppmmcUHppmm,cplFeFecUHppmmL, & 
& cplFeFecUHppmmR,cplcgWLpgWLmcUHppmm,cplcgWLmgWLpUHppmm,cplcgWRpgWLmcUHppmm,            & 
& cplcgWLmgWRpUHppmm,cplcgWLpgWRmcUHppmm,cplcgWRmgWLpUHppmm,cplcgWRpgWRmcUHppmm,         & 
& cplcgWRmgWRpUHppmm,cplhhHppmmcUHppmm,cplHpmHpmcUHppmm,cplHpmcUHppmmVWLm,               & 
& cplHpmcUHppmmVWRm,cplHppmmcUHppmmVP,cplHppmmcUHppmmVZ,cplHppmmcUHppmmVZR,              & 
& cplcUHppmmVWLmVWLm,cplcUHppmmVWLmVWRm,cplcUHppmmVWRmVWRm,cplAhAhUHppmmcUHppmm,         & 
& cplhhhhUHppmmcUHppmm,cplHpmUHppmmcHpmcUHppmm,cplUHppmmHppmmcUHppmmcHppmm,              & 
& cplUHppmmcUHppmmVPVP,cplUHppmmcUHppmmcVWLmVWLm,cplUHppmmcUHppmmcVWRmVWRm,              & 
& cplUHppmmcUHppmmVZVZ,cplUHppmmcUHppmmVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHppmm(2),MHppmm2(2),MAh(4),MAh2(4),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MHpm(4),            & 
& MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhHppmmcUHppmm(4,2,2),cplFeFecUHppmmL(3,3,2),cplFeFecUHppmmR(3,3,2),               & 
& cplcgWLpgWLmcUHppmm(2),cplcgWLmgWLpUHppmm(2),cplcgWRpgWLmcUHppmm(2),cplcgWLmgWRpUHppmm(2),& 
& cplcgWLpgWRmcUHppmm(2),cplcgWRmgWLpUHppmm(2),cplcgWRpgWRmcUHppmm(2),cplcgWRmgWRpUHppmm(2),& 
& cplhhHppmmcUHppmm(4,2,2),cplHpmHpmcUHppmm(4,4,2),cplHpmcUHppmmVWLm(4,2),               & 
& cplHpmcUHppmmVWRm(4,2),cplHppmmcUHppmmVP(2,2),cplHppmmcUHppmmVZ(2,2),cplHppmmcUHppmmVZR(2,2),& 
& cplcUHppmmVWLmVWLm(2),cplcUHppmmVWLmVWRm(2),cplcUHppmmVWRmVWRm(2),cplAhAhUHppmmcUHppmm(4,4,2,2),& 
& cplhhhhUHppmmcUHppmm(4,4,2,2),cplHpmUHppmmcHpmcUHppmm(4,2,4,2),cplUHppmmHppmmcUHppmmcHppmm(2,2,2,2),& 
& cplUHppmmcUHppmmVPVP(2,2),cplUHppmmcUHppmmcVWLmVWLm(2,2),cplUHppmmcUHppmmcVWRmVWRm(2,2),& 
& cplUHppmmcUHppmmVZVZ(2,2),cplUHppmmcUHppmmVZRVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hppmm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHppmm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhHppmmcUHppmm(i2,i1,gO1)
coup2 = Conjg(cplAhHppmmcUHppmm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fe, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFeFecUHppmmL(i1,i2,gO1)
coupR1 = cplFeFecUHppmmR(i1,i2,gO1)
coupL2 =  Conjg(cplFeFecUHppmmL(i1,i2,gO2))
coupR2 =  Conjg(cplFeFecUHppmmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWLpgWLmcUHppmm(gO1)
coup2 =  cplcgWLmgWLpUHppmm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWRpgWLmcUHppmm(gO1)
coup2 =  cplcgWLmgWRpUHppmm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWLpgWRmcUHppmm(gO1)
coup2 =  cplcgWRmgWLpUHppmm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWRpgWRmcUHppmm(gO1)
coup2 =  cplcgWRmgWRpUHppmm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hppmm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHppmm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhHppmmcUHppmm(i2,i1,gO1)
coup2 = Conjg(cplhhHppmmcUHppmm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmHpmcUHppmm(i1,i2,gO1)
coup2 = Conjg(cplHpmHpmcUHppmm(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHppmmVWLm(i2,gO1)
coup2 =  Conjg(cplHpmcUHppmmVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHppmmVWRm(i2,gO1)
coup2 =  Conjg(cplHpmcUHppmmVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHppmm2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHppmmcUHppmmVP(i2,gO1)
coup2 =  Conjg(cplHppmmcUHppmmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHppmm2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHppmmcUHppmmVZ(i2,gO1)
coup2 =  Conjg(cplHppmmcUHppmmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHppmm2(i2),MVZR2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHppmmcUHppmmVZR(i2,gO1)
coup2 =  Conjg(cplHppmmcUHppmmVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWLm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHppmmVWLmVWLm(gO1)
coup2 =  Conjg(cplcUHppmmVWLmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VWRm, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWRm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHppmmVWLmVWRm(gO1)
coup2 =  Conjg(cplcUHppmmVWLmVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWRm2,MVWRm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHppmmVWRmVWRm(gO1)
coup2 =  Conjg(cplcUHppmmVWRmVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUHppmmcUHppmm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUHppmmcUHppmm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmUHppmmcHpmcUHppmm(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHppmm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHppmmHppmmcUHppmmcHppmm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHppmmcUHppmmcVWLmVWLm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHppmmcUHppmmcVWRmVWRm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHppmmcUHppmmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHppmmcUHppmmVZRVZR(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHppmm 
 
Subroutine OneLoopFd(YQ1,YQ2,vHd,vHu,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZR,MVZR2,MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,    & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,delta,MFd_1L,              & 
& MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: vHd,vHu

Complex(dp), Intent(in) :: YQ1(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,4),cplcUFdFuHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vHu*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vHd*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vHu*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vHd*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vHu*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vHd*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vHu*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vHd*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vHu*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vHd*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vHu*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vHd*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vHu*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vHd*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vHu*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vHd*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vHu*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vHd*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,4),cplcUFdFuHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZRL(gO1,i2)
coupR1 = cplcUFdFdVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWLmL(gO1,i2)
coupR1 = cplcUFdFuVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWRmL(gO1,i2)
coupR1 = cplcUFdFuVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(YQ1,YQ2,vHd,vHu,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,           & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,      & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,         & 
& cplcUFuFdcVWRmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,      & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,delta,              & 
& MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFd(3),MFd2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: vHd,vHu

Complex(dp), Intent(in) :: YQ1(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcHpmL(3,3,4),cplcUFuFdcHpmR(3,3,4),  & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vHd*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vHu*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vHd*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vHu*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vHd*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vHu*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vHd*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vHu*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vHd*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vHu*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vHd*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vHu*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vHd*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vHu*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vHd*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vHu*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vHd*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vHu*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,               & 
& MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,            & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,         & 
& cplcUFuFdcVWRmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,      & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,               & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFd(3),MFd2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcHpmL(3,3,4),cplcUFuFdcHpmR(3,3,4),  & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWLmL(gO1,i2)
coupR1 = cplcUFuFdcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWRmL(gO1,i2)
coupR1 = cplcUFuFdcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZRL(gO1,i2)
coupR1 = cplcUFuFuVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(YL1,YL2,vHd,vHu,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZR,MVZR2,MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,         & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,     & 
& cplcUFeFvVWLmL,cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,          & 
& cplcUFecFeHppmmR,delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(6),MFv2(6),MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: vHd,vHu

Complex(dp), Intent(in) :: YL1(3,3),YL2(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvHpmL(3,6,4),cplcUFeFvHpmR(3,6,4),       & 
& cplcUFeFvVWLmL(3,6),cplcUFeFvVWLmR(3,6),cplcUFeFvVWRmL(3,6),cplcUFeFvVWRmR(3,6),       & 
& cplcUFecFeHppmmL(3,3,2),cplcUFecFeHppmmR(3,3,2)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vHu*Conjg(YL1(1,1)))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vHd*Conjg(YL2(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vHu*Conjg(YL1(1,2)))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vHd*Conjg(YL2(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vHu*Conjg(YL1(1,3)))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vHd*Conjg(YL2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vHu*Conjg(YL1(2,1)))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vHd*Conjg(YL2(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vHu*Conjg(YL1(2,2)))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vHd*Conjg(YL2(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vHu*Conjg(YL1(2,3)))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vHd*Conjg(YL2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vHu*Conjg(YL1(3,1)))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vHd*Conjg(YL2(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vHu*Conjg(YL1(3,2)))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vHd*Conjg(YL2(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vHu*Conjg(YL1(3,3)))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vHd*Conjg(YL2(3,3)))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,cplcUFeFeAhR,     & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,sigL,sigR,             & 
& sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,cplcUFeFeAhR,     & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,sigL,sigR,             & 
& sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,cplcUFeFeAhR,     & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,sigL,sigR,             & 
& sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,             & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,   & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,        & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(6),MFv2(6),MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvHpmL(3,6,4),cplcUFeFvHpmR(3,6,4),       & 
& cplcUFeFvVWLmL(3,6),cplcUFeFvVWLmR(3,6),cplcUFeFvVWRmL(3,6),cplcUFeFvVWRmR(3,6),       & 
& cplcUFecFeHppmmL(3,3,2),cplcUFecFeHppmmR(3,3,2)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZRL(gO1,i2)
coupR1 = cplcUFeFeVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWLmL(gO1,i2)
coupR1 = cplcUFeFvVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWRmL(gO1,i2)
coupR1 = cplcUFeFvVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hppmm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MHppmm2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MHppmm2(i2)),dp) 
coupL1 = cplcUFecFeHppmmL(gO1,i1,i2)
coupR1 = cplcUFecFeHppmmR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFecFeHppmmL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFecFeHppmmR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopFv(YDR,YL1,YDL,YL2,vHd,vHu,vR,vL,MFv,MFv2,MAh,MAh2,MHpm,            & 
& MHpm2,MFe,MFe2,MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,     & 
& cplUFvFvAhR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,  & 
& cplUFvFecVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,      & 
& cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,delta,MFv_1L,MFv2_1L,UV_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFe(3),MFe2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: vHd,vHu,vR,vL

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YDL(3,3),YL2(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),cplUFvFecHpmL(6,3,4),cplUFvFecHpmR(6,3,4),      & 
& cplUFvFecVWLmL(6,3),cplUFvFecVWLmR(6,3),cplUFvFecVWRmL(6,3),cplUFvFecVWRmR(6,3),       & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6),cplcFeUFvHpmL(3,6,4),& 
& cplcFeUFvHpmR(3,6,4),cplcFeUFvVWLmL(3,6),cplcFeUFvVWLmR(3,6),cplcFeUFvVWRmL(3,6),      & 
& cplcFeUFvVWRmR(3,6)

Complex(dp) :: mat1a(6,6), mat1(6,6), mat2(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2 
Real(dp), Intent(out) :: MFv_1L(6),MFv2_1L(6) 
Complex(dp), Intent(out) ::  UV_1L(6,6) 
Real(dp) :: MFv_t(6),MFv2_t(6) 
Complex(dp) ::  UV_t(6,6) 
Complex(dp) ::  phaseM, E6(6), sigL(6,6), sigR(6,6), sigSL(6,6), sigSR(6,6) 
Real(dp) :: UVa(6,6), test(2), eig(6) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+sqrt(2._dp)*vL*YDL(1,1)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vL*YDL(1,2))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vL*YDL(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vL*YDL(1,3))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vL*YDL(3,1))/sqrt(2._dp)
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vHd*Conjg(YL1(1,1)))/sqrt(2._dp)
mat1a(1,4) = mat1a(1,4)+(vHu*Conjg(YL2(1,1)))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vHd*Conjg(YL1(1,2)))/sqrt(2._dp)
mat1a(1,5) = mat1a(1,5)+(vHu*Conjg(YL2(1,2)))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vHd*Conjg(YL1(1,3)))/sqrt(2._dp)
mat1a(1,6) = mat1a(1,6)+(vHu*Conjg(YL2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vL*YDL(1,2))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vL*YDL(2,1))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+sqrt(2._dp)*vL*YDL(2,2)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vL*YDL(2,3))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vL*YDL(3,2))/sqrt(2._dp)
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vHd*Conjg(YL1(2,1)))/sqrt(2._dp)
mat1a(2,4) = mat1a(2,4)+(vHu*Conjg(YL2(2,1)))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vHd*Conjg(YL1(2,2)))/sqrt(2._dp)
mat1a(2,5) = mat1a(2,5)+(vHu*Conjg(YL2(2,2)))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vHd*Conjg(YL1(2,3)))/sqrt(2._dp)
mat1a(2,6) = mat1a(2,6)+(vHu*Conjg(YL2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vL*YDL(1,3))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vL*YDL(3,1))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vL*YDL(2,3))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vL*YDL(3,2))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+sqrt(2._dp)*vL*YDL(3,3)
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vHd*Conjg(YL1(3,1)))/sqrt(2._dp)
mat1a(3,4) = mat1a(3,4)+(vHu*Conjg(YL2(3,1)))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vHd*Conjg(YL1(3,2)))/sqrt(2._dp)
mat1a(3,5) = mat1a(3,5)+(vHu*Conjg(YL2(3,2)))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vHd*Conjg(YL1(3,3)))/sqrt(2._dp)
mat1a(3,6) = mat1a(3,6)+(vHu*Conjg(YL2(3,3)))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vHd*Conjg(YL1(1,1)))/sqrt(2._dp)
mat1a(4,1) = mat1a(4,1)+(vHu*Conjg(YL2(1,1)))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vHd*Conjg(YL1(2,1)))/sqrt(2._dp)
mat1a(4,2) = mat1a(4,2)+(vHu*Conjg(YL2(2,1)))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vHd*Conjg(YL1(3,1)))/sqrt(2._dp)
mat1a(4,3) = mat1a(4,3)+(vHu*Conjg(YL2(3,1)))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+sqrt(2._dp)*vR*Conjg(YDR(1,1))
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+(vR*Conjg(YDR(1,2)))/sqrt(2._dp)
mat1a(4,5) = mat1a(4,5)+(vR*Conjg(YDR(2,1)))/sqrt(2._dp)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+(vR*Conjg(YDR(1,3)))/sqrt(2._dp)
mat1a(4,6) = mat1a(4,6)+(vR*Conjg(YDR(3,1)))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vHd*Conjg(YL1(1,2)))/sqrt(2._dp)
mat1a(5,1) = mat1a(5,1)+(vHu*Conjg(YL2(1,2)))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vHd*Conjg(YL1(2,2)))/sqrt(2._dp)
mat1a(5,2) = mat1a(5,2)+(vHu*Conjg(YL2(2,2)))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vHd*Conjg(YL1(3,2)))/sqrt(2._dp)
mat1a(5,3) = mat1a(5,3)+(vHu*Conjg(YL2(3,2)))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+(vR*Conjg(YDR(1,2)))/sqrt(2._dp)
mat1a(5,4) = mat1a(5,4)+(vR*Conjg(YDR(2,1)))/sqrt(2._dp)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+sqrt(2._dp)*vR*Conjg(YDR(2,2))
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+(vR*Conjg(YDR(2,3)))/sqrt(2._dp)
mat1a(5,6) = mat1a(5,6)+(vR*Conjg(YDR(3,2)))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vHd*Conjg(YL1(1,3)))/sqrt(2._dp)
mat1a(6,1) = mat1a(6,1)+(vHu*Conjg(YL2(1,3)))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vHd*Conjg(YL1(2,3)))/sqrt(2._dp)
mat1a(6,2) = mat1a(6,2)+(vHu*Conjg(YL2(2,3)))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vHd*Conjg(YL1(3,3)))/sqrt(2._dp)
mat1a(6,3) = mat1a(6,3)+(vHu*Conjg(YL2(3,3)))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+(vR*Conjg(YDR(1,3)))/sqrt(2._dp)
mat1a(6,4) = mat1a(6,4)+(vR*Conjg(YDR(3,1)))/sqrt(2._dp)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+(vR*Conjg(YDR(2,3)))/sqrt(2._dp)
mat1a(6,5) = mat1a(6,5)+(vR*Conjg(YDR(3,2)))/sqrt(2._dp)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+sqrt(2._dp)*vR*Conjg(YDR(3,3))

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHpmL,       & 
& cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,             & 
& cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,               & 
& cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,   & 
& cplcFeUFvVWRmL,cplcFeUFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
UVOS_0 = UV_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_0 = UV_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHpmL,       & 
& cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,             & 
& cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,               & 
& cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,   & 
& cplcFeUFvVWRmL,cplcFeUFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHpmL,       & 
& cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,             & 
& cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,               & 
& cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,   & 
& cplcFeUFvVWRmL,cplcFeUFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,               & 
& MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,              & 
& cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,              & 
& cplUFvFecVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvHpmL,cplcFeUFvHpmR,cplcFeUFvVWLmL,      & 
& cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFe(3),MFe2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),cplUFvFecHpmL(6,3,4),cplUFvFecHpmR(6,3,4),      & 
& cplUFvFecVWLmL(6,3),cplUFvFecVWLmR(6,3),cplUFvFecVWRmL(6,3),cplUFvFecVWRmR(6,3),       & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6),cplcFeUFvHpmL(3,6,4),& 
& cplcFeUFvHpmR(3,6,4),cplcFeUFvVWLmL(3,6),cplcFeUFvVWLmR(3,6),cplcFeUFvVWRmL(3,6),      & 
& cplcFeUFvVWRmR(3,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_B0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFecHpmL(gO1,i2,i1)
coupR1 = cplUFvFecHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFecHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFecHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWLm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWLm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWLmL(gO1,i2)
coupR1 = cplUFvFecVWLmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWLmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWLmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWRm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWRm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWRmL(gO1,i2)
coupR1 = cplUFvFecVWRmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWRmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWRmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),0._dp),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZR2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZR2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZRL(gO1,i2)
coupR1 = cplUFvFvVZRR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZRL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZRR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hpm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_B0(p2,MFe2(i1),MHpm2(i2)),dp) 
coupL1 = cplcFeUFvHpmL(i1,gO1,i2)
coupR1 = cplcFeUFvHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUFvHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUFvHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], VWLm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWLm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWLm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWLmL(i1,gO1)
coupR1 = cplcFeUFvVWLmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWLmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWLmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Fe], VWRm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWRm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWRm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWRmL(i1,gO1)
coupR1 = cplcFeUFvVWRmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWRmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWRmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,        & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,     & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,          & 
& cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,     & 
& cplcgWRmgWRmVP,cplcgWRpgWRpVP,cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,cplHpmcVWLmVP,         & 
& cplHpmcVWRmVP,cplHppmmcHppmmVP,cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,           & 
& cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplHppmmcHppmmVPVP,cplcVWLmVPVPVWLm3,           & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,               & 
& cplcVWRmVPVPVWRm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),   & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWLmgWLmVP,      & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplHpmcHpmVP(4,4),cplHpmcVWLmVP(4),cplHpmcVWRmVP(4),        & 
& cplHppmmcHppmmVP(2,2),cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP(4,4),   & 
& cplhhhhVPVP(4,4),cplHpmcHpmVPVP(4,4),cplHppmmcHppmmVPVP(2,2),cplcVWLmVPVPVWLm3,        & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,               & 
& cplcVWRmVPVPVWRm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZR2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZR2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHppmm2(i2).gt.50._dp**2).and.(MHppmm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHppmm2(i2).lt.50._dp**2).and.(MHppmm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHppmm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHppmm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
!------------------------ 
! conj[VWRm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,              & 
& MHppmm2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,         & 
& cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,        & 
& cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,        & 
& cplHpmcVWLmVP,cplHpmcVWRmVP,cplHppmmcHppmmVP,cplcVWLmVPVWLm,cplcVWRmVPVWLm,            & 
& cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplHppmmcHppmmVPVP,              & 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,               & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),   & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWLmgWLmVP,      & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplHpmcHpmVP(4,4),cplHpmcVWLmVP(4),cplHpmcVWRmVP(4),        & 
& cplHppmmcHppmmVP(2,2),cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP(4,4),   & 
& cplhhhhVPVP(4,4),cplHpmcHpmVPVP(4,4),cplHppmmcHppmmVPVP(2,2),cplcVWLmVPVPVWLm3,        & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,               & 
& cplcVWRmVPVPVWRm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZR2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZR2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHppmm2(i2).gt.50._dp**2).and.(MHppmm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHppmm2(i2).lt.50._dp**2).and.(MHppmm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHppmm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHppmm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
!------------------------ 
! conj[VWRm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVZ(gBL,g2,gR,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,MHppmm,MHppmm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,           & 
& cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: gBL,g2,gR,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),            & 
& cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplHppmmcHppmmVZVZ(2,2),         & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,          & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),            & 
& cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplHppmmcHppmmVZVZ(2,2),         & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,              & 
& MHppmm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,        & 
& cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,           & 
& cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,              & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),            & 
& cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplHppmmcHppmmVZVZ(2,2),         & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVZR(gBL,g2,gR,vHd,vHu,vR,vL,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MHppmm,MHppmm2,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,         & 
& cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,        & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,         & 
& cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,       & 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,               & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: gBL,g2,gR,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),       & 
& cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),           & 
& cplHppmmcHppmmVZRVZR(2,2),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3, & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZR'
 
mi2 = MVZR2 

 
p2 = MVZR2
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,           & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,  & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,         & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,          & 
& cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,      & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,           & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,  & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,         & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,          & 
& cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,      & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZR
 
 
Subroutine Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,          & 
& cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,           & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,  & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,         & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,          & 
& cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,      & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),       & 
& cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),           & 
& cplHppmmcHppmmVZRVZR(2,2),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3, & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZRVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZR 
 
Subroutine DerPi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,              & 
& MHppmm2,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,   & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,  & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,         & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,          & 
& cplHppmmcHppmmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,      & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),       & 
& cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),           & 
& cplHppmmcHppmmVZRVZR(2,2),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3, & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZRVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp)  
coup1 = cplHppmmcHppmmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZR 
 
Subroutine OneLoopVWLm(g2,gR,vHd,vHu,vR,vL,PhiW,MHpm,MHpm2,MAh,MAh2,MVWRm,            & 
& MVWRm2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,             & 
& MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,  & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,           & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,              & 
& cplHppmmcHpmcVWLm,cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,cplcVWLmVPVWLm,cplcVWLmVPVWRm, & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,        & 
& cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmVPVPVWLm3,        & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,     & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,             & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: g2,gR,vHd,vHu,vR,vL,PhiW

Complex(dp), Intent(in) :: cplAhHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplFvFecVWLmL(6,3),cplFvFecVWLmR(6,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm(4,4),  & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),& 
& cplHppmmcHpmcVWLm(2,4),cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),cplcVWLmVPVWLm,     & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),cplHppmmcHppmmcVWLmVWLm(2,2),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWLm'
 
mi2 = MVWLm2 

 
p2 = MVWLm2
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,            & 
& cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,              & 
& cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,         & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHppmmcHpmcVWLm,           & 
& cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,    & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,       & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,            & 
& cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,              & 
& cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,         & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHppmmcHpmcVWLm,           & 
& cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,    & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,       & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWLm
 
 
Subroutine Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,              & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,               & 
& MHppmm2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,      & 
& cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,         & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHppmmcHpmcVWLm,           & 
& cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,    & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,       & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplFvFecVWLmL(6,3),cplFvFecVWLmR(6,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm(4,4),  & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),& 
& cplHppmmcHpmcVWLm(2,4),cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),cplcVWLmVPVWLm,     & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),cplHppmmcHppmmcVWLmVWLm(2,2),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MAh2(i2)),dp)
coup1 = cplAhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWLmL(i1,i2)
coupR1 = cplcFuFdcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWLmL(i1,i2)
coupR1 = cplFvFecVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHpm2(i1)),dp)  
coup1 = cplHppmmcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWLm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWRm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWLmVWLmVWLm2
coup2 = cplcVWLmcVWLmVWLmVWLm3
coup3 = cplcVWLmcVWLmVWLmVWLm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLm 
 
Subroutine DerPi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,           & 
& MHppmm2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,      & 
& cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,         & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHppmmcHpmcVWLm,           & 
& cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,    & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplHppmmcHppmmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,       & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplFvFecVWLmL(6,3),cplFvFecVWLmR(6,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm(4,4),  & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),& 
& cplHppmmcHpmcVWLm(2,4),cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),cplcVWLmVPVWLm,     & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),cplHppmmcHppmmcVWLmVWLm(2,2),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MAh2(i2)),dp)
coup1 = cplAhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWLmL(i1,i2)
coupR1 = cplcFuFdcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWLmL(i1,i2)
coupR1 = cplFvFecVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i2)),dp)
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHpm2(i1)),dp)  
coup1 = cplHppmmcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWLmVWLmVWLm2
coup2 = cplcVWLmcVWLmVWLmVWLm3
coup3 = cplcVWLmcVWLmVWLmVWLm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLm 
 
Subroutine OneLoopVWRm(g2,gR,vHd,vHu,vR,vL,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,            & 
& MVWLm2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,             & 
& MVZR,MVZR2,MHppmm,MHppmm2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,  & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,           & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,       & 
& cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,              & 
& cplHppmmcHpmcVWRm,cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm, & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,        & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Real(dp), Intent(in) :: g2,gR,vHd,vHu,vR,vL,PhiW

Complex(dp), Intent(in) :: cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplFvFecVWRmL(6,3),cplFvFecVWRmR(6,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm(4,4),  & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),& 
& cplHppmmcHpmcVWRm(2,4),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2),cplcVWRmVPVWLm,     & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),cplHppmmcHppmmcVWRmVWRm(2,2),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWRm'
 
mi2 = MVWRm2 

 
p2 = MVWRm2
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,            & 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,              & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,           & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,    & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,      & 
& cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,       & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,MHppmm2,            & 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,              & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,           & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,    & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,      & 
& cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,       & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWRm
 
 
Subroutine Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,              & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,               & 
& MHppmm2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,      & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,           & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,    & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,      & 
& cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,       & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplFvFecVWRmL(6,3),cplFvFecVWRmR(6,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm(4,4),  & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),& 
& cplHppmmcHpmcVWRm(2,4),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2),cplcVWRmVPVWLm,     & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),cplHppmmcHppmmcVWRmVWRm(2,2),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MAh2(i2)),dp)
coup1 = cplAhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWRmL(i1,i2)
coupR1 = cplcFuFdcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWRmL(i1,i2)
coupR1 = cplFvFecVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHpm2(i1)),dp)  
coup1 = cplHppmmcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWLm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWRm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWRmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWRmVWRm2
coup2 = cplcVWRmcVWRmVWRmVWRm3
coup3 = cplcVWRmcVWRmVWRmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRm 
 
Subroutine DerPi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MHppmm,           & 
& MHppmm2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,      & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,           & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,    & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,      & 
& cplHpmcHpmcVWRmVWRm,cplHppmmcHppmmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,       & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplFvFecVWRmL(6,3),cplFvFecVWRmR(6,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm(4,4),  & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),& 
& cplHppmmcHpmcVWRm(2,4),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2),cplcVWRmVPVWLm,     & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),cplHppmmcHppmmcVWRmVWRm(2,2),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MAh2(i2)),dp)
coup1 = cplAhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWRmL(i1,i2)
coupR1 = cplcFuFdcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWRmL(i1,i2)
coupR1 = cplFvFecVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i2)),dp)
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHpm2(i1)),dp)  
coup1 = cplHppmmcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWLmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHppmm2(i2)),dp)
coup1 = cplHppmmcVWRmcVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWRmVWRm2
coup2 = cplcVWRmcVWRmVWRmVWRm3
coup3 = cplcVWRmcVWRmVWRmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWRm 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,          & 
& MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,             & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,   & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,        & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(6),MFv2(6),MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm(2),MHppmm2(2)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvHpmL(3,6,4),cplcUFeFvHpmR(3,6,4),       & 
& cplcUFeFvVWLmL(3,6),cplcUFeFvVWLmR(3,6),cplcUFeFvVWRmL(3,6),cplcUFeFvVWRmR(3,6),       & 
& cplcUFecFeHppmmL(3,3,2),cplcUFecFeHppmmR(3,3,2)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZRL(gO1,i2)
coupR1 = cplcUFeFeVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWLmL(gO1,i2)
coupR1 = cplcUFeFvVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWRmL(gO1,i2)
coupR1 = cplcUFeFvVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hppmm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MHppmm2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MHppmm2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MHppmm2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MHppmm2(i2)),dp) 
End If 
coupL1 = cplcUFecFeHppmmL(gO1,i1,i2)
coupR1 = cplcUFecFeHppmmR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFecFeHppmmL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFecFeHppmmR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,          & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,4),cplcUFdFuHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZRL(gO1,i2)
coupR1 = cplcUFdFdVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWLmL(gO1,i2)
coupR1 = cplcUFdFuVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWRmL(gO1,i2)
coupR1 = cplcUFdFuVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,            & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,         & 
& cplcUFuFdcVWRmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,      & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,               & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFd(3),MFd2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcHpmL(3,3,4),cplcUFuFdcHpmR(3,3,4),  & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWLmL(gO1,i2)
coupR1 = cplcUFuFdcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWRmL(gO1,i2)
coupR1 = cplcUFuFdcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZRL(gO1,i2)
coupR1 = cplcUFuFuVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,      & 
& cplcgWLmgWRmVZ,cplcgWLpgWLpVP,cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,            & 
& cplcgWRmgWLmVP,cplcgWRmgWLmVZ,cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,            & 
& cplcgWRpgWLpVZ,cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcHpmVPVWLm,cplcHpmVPVWRm,              & 
& cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,        & 
& cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,         & 
& cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,   & 
& cplcVWRmVWRmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,      & 
& cplhhVPVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHppmmcHppmmVP,              & 
& cplHppmmcHppmmVPVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,cplcgWLpgWLpVP,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,cplcgWRmgWLmVZ,            & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWRpVP,            & 
& cplcgWRpgWRpVZ,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplcHpmVWLmVZ(4),cplcHpmVWRmVZ(4),    & 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,         & 
& cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvVPL(6,6),     & 
& cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhhhVPVZ(4,4),cplhhVPVZ(4),         & 
& cplhhVPVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVP(4,4),cplHpmcHpmVPVZ(4,4),        & 
& cplHpmcHpmVZ(4,4),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4), & 
& cplHppmmcHppmmVP(2,2),cplHppmmcHppmmVPVZ(2,2),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = cplcgWLmgWLmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = cplcgWLmgWRmVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = cplcgWLpgWLpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = cplcgWLpgWRpVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVP
coup2 = cplcgWRmgWLmVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = cplcgWRmgWRmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVP
coup2 = cplcgWRpgWLpVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = cplcgWRpgWRpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVP(i2)
coup2 = cplcHpmVWLmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVP(i2)
coup2 = cplcHpmVWRmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVP(i2,i1)
coup2 = cplHppmmcHppmmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcVWLmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWLmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWLmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcVWRmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZ2
coup2 = cplcVWLmVPVWLmVZ1
coup3 = cplcVWLmVPVWLmVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZ2
coup2 = cplcVWRmVPVWRmVZ1
coup3 = cplcVWRmVPVWRmVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZ 
 
Subroutine DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,      & 
& cplcgWLmgWRmVZ,cplcgWLpgWLpVP,cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,            & 
& cplcgWRmgWLmVP,cplcgWRmgWLmVZ,cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,            & 
& cplcgWRpgWLpVZ,cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcHpmVPVWLm,cplcHpmVPVWRm,              & 
& cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,        & 
& cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,         & 
& cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,   & 
& cplcVWRmVWRmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,      & 
& cplhhVPVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHppmmcHppmmVP,              & 
& cplHppmmcHppmmVPVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,cplcgWLpgWLpVP,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,cplcgWRmgWLmVZ,            & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWRpVP,            & 
& cplcgWRpgWRpVZ,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplcHpmVWLmVZ(4),cplcHpmVWRmVZ(4),    & 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,         & 
& cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvVPL(6,6),     & 
& cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhhhVPVZ(4,4),cplhhVPVZ(4),         & 
& cplhhVPVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVP(4,4),cplHpmcHpmVPVZ(4,4),        & 
& cplHpmcHpmVZ(4,4),cplHpmcVWLmVP(4),cplHpmcVWLmVZ(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4), & 
& cplHppmmcHppmmVP(2,2),cplHppmmcHppmmVPVZ(2,2),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = cplcgWLmgWLmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = cplcgWLmgWRmVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = cplcgWLpgWLpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = cplcgWLpgWRpVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVP
coup2 = cplcgWRmgWLmVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = cplcgWRmgWRmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVP
coup2 = cplcgWRpgWLpVZ 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = cplcgWRpgWRpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVP(i2)
coup2 = cplcHpmVWLmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVP(i2)
coup2 = cplcHpmVWRmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVP(i2,i1)
coup2 = cplHppmmcHppmmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcVWLmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWLmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWLmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcVWRmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZ2
coup2 = cplcVWLmVPVWLmVZ1
coup3 = cplcVWLmVPVWLmVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZ2
coup2 = cplcVWRmVPVWRmVZ1
coup3 = cplcVWRmVPVWRmVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZ 
 
Subroutine Pi1LoopVPVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVPVZR,cplAhhhVP,cplAhhhVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZRL,          & 
& cplcFdFdVZRR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLpVP,cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmVP,cplcgWRmgWLmVZR,cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpVP,cplcgWRpgWRpVZR,cplcHpmVPVWLm,cplcHpmVPVWRm,            & 
& cplcHpmVWLmVZR,cplcHpmVWRmVZR,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,    & 
& cplcVWLmVPVWLmVZR3,cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,      & 
& cplcVWRmVPVWRm,cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,               & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZRL,cplFvFvVZRR,         & 
& cplhhhhVPVZR,cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZR, & 
& cplHpmcHpmVZR,cplHpmcVWLmVP,cplHpmcVWLmVZR,cplHpmcVWRmVP,cplHpmcVWRmVZR,               & 
& cplHppmmcHppmmVP,cplHppmmcHppmmVPVZR,cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZR(4,4),cplAhhhVP(4,4),cplAhhhVZR(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,cplcgWLpgWLpVP,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,cplcgWRpgWRpVP,          & 
& cplcgWRpgWRpVZR,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4), & 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,               & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),     & 
& cplhhhhVPVZR(4,4),cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),             & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVPVZR(4,4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVP(4),            & 
& cplHpmcVWLmVZR(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVP(2,2),            & 
& cplHppmmcHppmmVPVZR(2,2),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVP
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVP
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVP(i2)
coup2 = cplcHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVP(i2)
coup2 = cplcHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVP(i2,i1)
coup2 = cplHppmmcHppmmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcVWLmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZR2
coup2 = cplcVWLmVPVWLmVZR1
coup3 = cplcVWLmVPVWLmVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZR2
coup2 = cplcVWRmVPVWRmVZR1
coup3 = cplcVWRmVPVWRmVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZR 
 
Subroutine DerPi1LoopVPVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVPVZR,cplAhhhVP,cplAhhhVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZRL,          & 
& cplcFdFdVZRR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLpVP,cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmVP,cplcgWRmgWLmVZR,cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpVP,cplcgWRpgWRpVZR,cplcHpmVPVWLm,cplcHpmVPVWRm,            & 
& cplcHpmVWLmVZR,cplcHpmVWRmVZR,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,    & 
& cplcVWLmVPVWLmVZR3,cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,      & 
& cplcVWRmVPVWRm,cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,               & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZRL,cplFvFvVZRR,         & 
& cplhhhhVPVZR,cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZR, & 
& cplHpmcHpmVZR,cplHpmcVWLmVP,cplHpmcVWLmVZR,cplHpmcVWRmVP,cplHpmcVWRmVZR,               & 
& cplHppmmcHppmmVP,cplHppmmcHppmmVPVZR,cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZR(4,4),cplAhhhVP(4,4),cplAhhhVZR(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,cplcgWLpgWLpVP,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,cplcgWRpgWRpVP,          & 
& cplcgWRpgWRpVZR,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4), & 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,               & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),     & 
& cplhhhhVPVZR(4,4),cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),             & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVPVZR(4,4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVP(4),            & 
& cplHpmcVWLmVZR(4),cplHpmcVWRmVP(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVP(2,2),            & 
& cplHppmmcHppmmVPVZR(2,2),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVP
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVP
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVP(i2)
coup2 = cplcHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVP(i2)
coup2 = cplcHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVP(i2,i1)
coup2 = cplHppmmcHppmmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcVWLmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZR2
coup2 = cplcVWLmVPVWLmVZR1
coup3 = cplcVWLmVPVWLmVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZR2
coup2 = cplcVWRmVPVWRmVZR1
coup3 = cplcVWRmVPVWRmVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZR 
 
Subroutine Pi1LoopVZVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVZVZR,cplAhhhVZ,cplAhhhVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,          & 
& cplcFdFdVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcHpmVWLmVZ,cplcHpmVWLmVZR,           & 
& cplcHpmVWRmVZ,cplcHpmVWRmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,        & 
& cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,   & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,  & 
& cplcVWRmVWRmVZVZR3,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVZVZR,         & 
& cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcHpmVZR,      & 
& cplHpmcHpmVZVZR,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHpmcVWRmVZ,cplHpmcVWRmVZR,             & 
& cplHppmmcHppmmVZ,cplHppmmcHppmmVZR,cplHppmmcHppmmVZVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVZVZR(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,          & 
& cplcgWRpgWRpVZR,cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4), & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,& 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,          & 
& cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,              & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhhhVZVZR(4,4),   & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),& 
& cplHpmcHpmVZR(4,4),cplHpmcHpmVZVZR(4,4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),            & 
& cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZ(2,2),cplHppmmcHppmmVZR(2,2),       & 
& cplHppmmcHppmmVZVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplcHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplcHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplHppmmcHppmmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcVWLmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZR1
coup2 = cplcVWLmVWLmVZVZR2
coup3 = cplcVWLmVWLmVZVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZR1
coup2 = cplcVWRmVWRmVZVZR2
coup3 = cplcVWRmVWRmVZVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZVZR 
 
Subroutine DerPi1LoopVZVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhVZVZR,cplAhhhVZ,cplAhhhVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,          & 
& cplcFdFdVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcHpmVWLmVZ,cplcHpmVWLmVZR,           & 
& cplcHpmVWRmVZ,cplcHpmVWRmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,        & 
& cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,   & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,  & 
& cplcVWRmVWRmVZVZR3,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVZVZR,         & 
& cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcHpmVZR,      & 
& cplHpmcHpmVZVZR,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHpmcVWRmVZ,cplHpmcVWRmVZR,             & 
& cplHppmmcHppmmVZ,cplHppmmcHppmmVZR,cplHppmmcHppmmVZVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVZVZR(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,          & 
& cplcgWRpgWRpVZR,cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4), & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,& 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,          & 
& cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,              & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhhhVZVZR(4,4),   & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),& 
& cplHpmcHpmVZR(4,4),cplHpmcHpmVZVZR(4,4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),            & 
& cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZ(2,2),cplHppmmcHppmmVZR(2,2),       & 
& cplHppmmcHppmmVZVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplcHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplcHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplHppmmcHppmmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcVWLmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZR1
coup2 = cplcVWLmVWLmVZVZR2
coup3 = cplcVWLmVWLmVZVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZR1
coup2 = cplcVWRmVWRmVZVZR2
coup3 = cplcVWRmVWRmVZVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZVZR 
 
Subroutine Pi1LoopVWLmVWRm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhcVWRmVWLm,cplAhcHpmVWLm,cplAhHpmcVWRm,cplcFdFuVWLmL,cplcFdFuVWLmR,        & 
& cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcgPgWLmcVWRm,             & 
& cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,cplcgWLmgPVWLm,cplcgWLmgZpVWLm,          & 
& cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,        & 
& cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,       & 
& cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,        & 
& cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,cplcHpmVPVWLm,cplcHpmVWLmVZ,          & 
& cplcHpmVWLmVZR,cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplcVWLmcVWRmVWLmVWLm1,             & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplhhcHpmVWLm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,               & 
& cplhhcVWRmVWRm,cplhhhhcVWRmVWLm,cplhhHpmcVWRm,cplHpmcHpmcVWRmVWLm,cplHpmcHppmmVWLm,    & 
& cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,cplHppmmcHppmmcVWRmVWLm,  & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhcVWRmVWLm(4,4),cplAhcHpmVWLm(4,4),cplAhHpmcVWRm(4,4),cplcFdFuVWLmL(3,3),       & 
& cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,6),cplcFeFvVWLmR(3,6),cplcFuFdcVWRmL(3,3),          & 
& cplcFuFdcVWRmR(3,3),cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,     & 
& cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,         & 
& cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,        & 
& cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,       & 
& cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,      & 
& cplcHpmVPVWLm(4),cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHppmmVWLmVWLm(2),              & 
& cplcHppmmVWLmVWRm(2),cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,& 
& cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,& 
& cplcVWRmcVWRmVWLmVWRm3,cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,          & 
& cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,      & 
& cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,           & 
& cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecVWRmL(6,3),cplFvFecVWRmR(6,3),& 
& cplhhcHpmVWLm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),              & 
& cplhhhhcVWRmVWLm(4,4),cplhhHpmcVWRm(4,4),cplHpmcHpmcVWRmVWLm(4,4),cplHpmcHppmmVWLm(4,2),& 
& cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplHppmmcHpmcVWRm(2,4),            & 
& cplHppmmcHppmmcVWRmVWLm(2,2),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWLm(i2,i1)
coup2 = cplAhHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcVWRmL(i2,i1)
coupR2 = cplcFuFdcVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecVWRmL(i2,i1)
coupR2 = cplFvFecVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLmgPVWLm
coup2 = cplcgPgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRmgPVWLm
coup2 = cplcgPgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWLm(i2,i1)
coup2 = cplhhHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcVWRmVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcVWRmVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWLm(i2,i1)
coup2 = cplHppmmcHpmcVWRm(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,0._dp),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,0._dp),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWLm(i1)
coup2 = cplHppmmcVWLmcVWRm(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcVWRmcVWRm(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcVWRmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWRmVPVPVWLm3
coup2 = cplcVWRmVPVPVWLm1
coup3 = cplcVWRmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWLm2
coup2 = cplcVWLmcVWRmVWLmVWLm3
coup3 = cplcVWLmcVWRmVWLmVWLm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWLmVWRm2
coup2 = cplcVWRmcVWRmVWLmVWRm3
coup3 = cplcVWRmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWRmVWLmVZVZ1
coup2 = cplcVWRmVWLmVZVZ2
coup3 = cplcVWRmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWRmVWLmVZRVZR1
coup2 = cplcVWRmVWLmVZRVZR2
coup3 = cplcVWRmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLmVWRm 
 
Subroutine DerPi1LoopVWLmVWRm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,cplAhAhcVWRmVWLm,cplAhcHpmVWLm,cplAhHpmcVWRm,cplcFdFuVWLmL,cplcFdFuVWLmR,   & 
& cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcgPgWLmcVWRm,             & 
& cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,cplcgWLmgPVWLm,cplcgWLmgZpVWLm,          & 
& cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,        & 
& cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,       & 
& cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,        & 
& cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,cplcHpmVPVWLm,cplcHpmVWLmVZ,          & 
& cplcHpmVWLmVZR,cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplcVWLmcVWRmVWLmVWLm1,             & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplhhcHpmVWLm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,               & 
& cplhhcVWRmVWRm,cplhhhhcVWRmVWLm,cplhhHpmcVWRm,cplHpmcHpmcVWRmVWLm,cplHpmcHppmmVWLm,    & 
& cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,cplHppmmcHppmmcVWRmVWLm,  & 
& cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhcVWRmVWLm(4,4),cplAhcHpmVWLm(4,4),cplAhHpmcVWRm(4,4),cplcFdFuVWLmL(3,3),       & 
& cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,6),cplcFeFvVWLmR(3,6),cplcFuFdcVWRmL(3,3),          & 
& cplcFuFdcVWRmR(3,3),cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,     & 
& cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,         & 
& cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,        & 
& cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,       & 
& cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,      & 
& cplcHpmVPVWLm(4),cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHppmmVWLmVWLm(2),              & 
& cplcHppmmVWLmVWRm(2),cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,& 
& cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,& 
& cplcVWRmcVWRmVWLmVWRm3,cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,          & 
& cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,      & 
& cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,           & 
& cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecVWRmL(6,3),cplFvFecVWRmR(6,3),& 
& cplhhcHpmVWLm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),              & 
& cplhhhhcVWRmVWLm(4,4),cplhhHpmcVWRm(4,4),cplHpmcHpmcVWRmVWLm(4,4),cplHpmcHppmmVWLm(4,2),& 
& cplHpmcVWRmVP(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplHppmmcHpmcVWRm(2,4),            & 
& cplHppmmcHppmmcVWRmVWLm(2,2),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWLm(i2,i1)
coup2 = cplAhHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFu(i2)*Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcVWRmL(i2,i1)
coupR2 = cplcFuFdcVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFv(i2)*Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecVWRmL(i2,i1)
coupR2 = cplFvFecVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLmgPVWLm
coup2 = cplcgPgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRmgPVWLm
coup2 = cplcgPgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWLm(i2,i1)
coup2 = cplhhHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcVWRmVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcVWRmVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWLm(i2,i1)
coup2 = cplHppmmcHpmcVWRm(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcVWRmVP(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVP2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVP2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWLm(i1)
coup2 = cplHppmmcVWLmcVWRm(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcVWRmcVWRm(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcVWRmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplHpmcVWRmVZR(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHppmm2(i1))
 coup1 = cplHppmmcHppmmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWRmVPVPVWLm3
coup2 = cplcVWRmVPVPVWLm1
coup3 = cplcVWRmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWLm2
coup2 = cplcVWLmcVWRmVWLmVWLm3
coup3 = cplcVWLmcVWRmVWLmVWLm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWLmVWRm2
coup2 = cplcVWRmcVWRmVWLmVWRm3
coup3 = cplcVWRmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWRmVWLmVZVZ1
coup2 = cplcVWRmVWLmVZVZ2
coup3 = cplcVWRmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWRmVWLmVZRVZR1
coup2 = cplcVWRmVWLmVZRVZR2
coup3 = cplcVWRmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLmVWRm 
 
Subroutine Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,             & 
& MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmhh,cplcgWLmgWLmVZ,cplcgWLmgWRmhh,      & 
& cplcgWLmgWRmVZ,cplcgWLpgWLphh,cplcgWLpgWLpVZ,cplcgWLpgWRphh,cplcgWLpgWRpVZ,            & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZ,cplcgWRmgWRmhh,cplcgWRmgWRmVZ,cplcgWRpgWLphh,            & 
& cplcgWRpgWLpVZ,cplcgWRpgWRphh,cplcgWRpgWRpVZ,cplcHpmVWLmVZ,cplcHpmVWRmVZ,              & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,       & 
& cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmcVWLm,cplhhHpmcVWRm,cplhhHppmmcHppmm,& 
& cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MHpm(4),MHpm2(4),         & 
& MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZ,cplcgWLpgWLphh(4),   & 
& cplcgWLpgWLpVZ,cplcgWLpgWRphh(4),cplcgWLpgWRpVZ,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZ,      & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZ,cplcgWRpgWLphh(4),cplcgWRpgWLpVZ,cplcgWRpgWRphh(4),   & 
& cplcgWRpgWRpVZ,cplcHpmVWLmVZ(4),cplcHpmVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,        & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),     & 
& cplFvFvVZR(6,6),cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),               & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmcVWLm(4,4),cplhhHpmcVWRm(4,4),cplhhHppmmcHppmm(4,2,2),cplHpmcHpmVZ(4,4),       & 
& cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplhhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplhhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplhhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplhhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplhhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,          & 
& MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmhh,cplcgWLmgWLmVZ,cplcgWLmgWRmhh,      & 
& cplcgWLmgWRmVZ,cplcgWLpgWLphh,cplcgWLpgWLpVZ,cplcgWLpgWRphh,cplcgWLpgWRpVZ,            & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZ,cplcgWRmgWRmhh,cplcgWRmgWRmVZ,cplcgWRpgWLphh,            & 
& cplcgWRpgWLpVZ,cplcgWRpgWRphh,cplcgWRpgWRpVZ,cplcHpmVWLmVZ,cplcHpmVWRmVZ,              & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,       & 
& cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmcVWLm,cplhhHpmcVWRm,cplhhHppmmcHppmm,& 
& cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MHpm(4),MHpm2(4),         & 
& MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZ,cplcgWLpgWLphh(4),   & 
& cplcgWLpgWLpVZ,cplcgWLpgWRphh(4),cplcgWLpgWRpVZ,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZ,      & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZ,cplcgWRpgWLphh(4),cplcgWRpgWLpVZ,cplcgWRpgWRphh(4),   & 
& cplcgWRpgWRpVZ,cplcHpmVWLmVZ(4),cplcHpmVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,        & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),     & 
& cplFvFvVZR(6,6),cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),               & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmcVWLm(4,4),cplhhHpmcVWRm(4,4),cplhhHppmmcHppmm(4,2,2),cplHpmcHpmVZ(4,4),       & 
& cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplhhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplhhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplhhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplhhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplhhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhhh,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,               & 
& cplAhHppmmcHppmm,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWLmgWLmAh,cplcgWLmgWLmVZ,cplcgWLmgWRmAh,cplcgWLmgWRmVZ,               & 
& cplcgWLpgWLpAh,cplcgWLpgWLpVZ,cplcgWLpgWRpAh,cplcgWLpgWRpVZ,cplcgWRmgWLmAh,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmAh,cplcgWRmgWRmVZ,cplcgWRpgWLpAh,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRpAh,cplcgWRpgWRpVZ,cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcVWLmVWRmVZ,              & 
& cplcVWRmVWLmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,        & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),             & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhHppmmcHppmm(4,2,2),cplcFdFdAhL(3,3,4),      & 
& cplcFdFdAhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),               & 
& cplcFeFeAhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),               & 
& cplcFuFuAhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZ, & 
& cplcgWLmgWRmAh(4),cplcgWLmgWRmVZ,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZ,cplcgWLpgWRpAh(4),   & 
& cplcgWLpgWRpVZ,cplcgWRmgWLmAh(4),cplcgWRmgWLmVZ,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZ,      & 
& cplcgWRpgWLpAh(4),cplcgWRpgWLpVZ,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZ,cplcHpmVWLmVZ(4),    & 
& cplcHpmVWRmVZ(4),cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),    & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),               & 
& cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplAhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplAhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplAhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplAhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplAhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhhh,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,               & 
& cplAhHppmmcHppmm,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWLmgWLmAh,cplcgWLmgWLmVZ,cplcgWLmgWRmAh,cplcgWLmgWRmVZ,               & 
& cplcgWLpgWLpAh,cplcgWLpgWLpVZ,cplcgWLpgWRpAh,cplcgWLpgWRpVZ,cplcgWRmgWLmAh,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmAh,cplcgWRmgWRmVZ,cplcgWRpgWLpAh,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRpAh,cplcgWRpgWRpVZ,cplcHpmVWLmVZ,cplcHpmVWRmVZ,cplcVWLmVWRmVZ,              & 
& cplcVWRmVWLmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,        & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),             & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhHppmmcHppmm(4,2,2),cplcFdFdAhL(3,3,4),      & 
& cplcFdFdAhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),               & 
& cplcFeFeAhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),               & 
& cplcFuFuAhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZ, & 
& cplcgWLmgWRmAh(4),cplcgWLmgWRmVZ,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZ,cplcgWLpgWRpAh(4),   & 
& cplcgWLpgWRpVZ,cplcgWRmgWLmAh(4),cplcgWRmgWLmVZ,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZ,      & 
& cplcgWRpgWLpAh(4),cplcgWRpgWLpVZ,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZ,cplcHpmVWLmVZ(4),    & 
& cplcHpmVWRmVZ(4),cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),    & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),               & 
& cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZ(i2)
coup2 = cplAhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZ(i2)
coup2 = cplAhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZ(i2,i1)
coup2 = cplAhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplAhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplAhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVZRhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,            & 
& MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZRL,         & 
& cplcFdFdVZRR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmhh,cplcgWLmgWLmVZR,cplcgWLmgWRmhh,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLphh,cplcgWLpgWLpVZR,cplcgWLpgWRphh,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZR,cplcgWRmgWRmhh,cplcgWRmgWRmVZR,cplcgWRpgWLphh,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRphh,cplcgWRpgWRpVZR,cplcHpmVWLmVZR,cplcHpmVWRmVZR,          & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL,            & 
& cplFvFvhhR,cplFvFvVZRL,cplFvFvVZRR,cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,         & 
& cplhhcVWLmVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmcVWLm,               & 
& cplhhHpmcVWRm,cplhhHppmmcHppmm,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,            & 
& cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MHpm(4),MHpm2(4),         & 
& MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),            & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),             & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZR,cplcgWLpgWLphh(4), & 
& cplcgWLpgWLpVZR,cplcgWLpgWRphh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZR,   & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZR,cplcgWRpgWLphh(4),cplcgWRpgWLpVZR,cplcgWRpgWRphh(4), & 
& cplcgWRpgWRpVZR,cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,   & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZRL(6,6),  & 
& cplFvFvVZRR(6,6),cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),              & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmcVWLm(4,4),cplhhHpmcVWRm(4,4),cplhhHppmmcHppmm(4,2,2),cplHpmcHpmVZR(4,4),      & 
& cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZR(i2)
coup2 = cplhhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZR(i2)
coup2 = cplhhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZR(i2,i1)
coup2 = cplhhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplhhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplhhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRhh 
 
Subroutine DerPi1LoopVZRhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,               & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZRL,   & 
& cplcFdFdVZRR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmhh,cplcgWLmgWLmVZR,cplcgWLmgWRmhh,   & 
& cplcgWLmgWRmVZR,cplcgWLpgWLphh,cplcgWLpgWLpVZR,cplcgWLpgWRphh,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZR,cplcgWRmgWRmhh,cplcgWRmgWRmVZR,cplcgWRpgWLphh,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRphh,cplcgWRpgWRpVZR,cplcHpmVWLmVZR,cplcHpmVWRmVZR,          & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL,            & 
& cplFvFvhhR,cplFvFvVZRL,cplFvFvVZRR,cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,         & 
& cplhhcVWLmVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmcVWLm,               & 
& cplhhHpmcVWRm,cplhhHppmmcHppmm,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,            & 
& cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MHpm(4),MHpm2(4),         & 
& MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),            & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),             & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZR,cplcgWLpgWLphh(4), & 
& cplcgWLpgWLpVZR,cplcgWLpgWRphh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZR,   & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZR,cplcgWRpgWLphh(4),cplcgWRpgWLpVZR,cplcgWRpgWRphh(4), & 
& cplcgWRpgWRpVZR,cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,   & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZRL(6,6),  & 
& cplFvFvVZRR(6,6),cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),              & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmcVWLm(4,4),cplhhHpmcVWRm(4,4),cplhhHppmmcHppmm(4,2,2),cplHpmcHpmVZR(4,4),      & 
& cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZR(i2)
coup2 = cplhhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZR(i2)
coup2 = cplhhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZR(i2,i1)
coup2 = cplhhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplhhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplhhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRhh 
 
Subroutine Pi1LoopVZRAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhhh,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,               & 
& cplAhHppmmcHppmm,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmAh,cplcgWLmgWLmVZR,cplcgWLmgWRmAh,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpAh,cplcgWLpgWLpVZR,cplcgWLpgWRpAh,cplcgWLpgWRpVZR,cplcgWRmgWLmAh,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmAh,cplcgWRmgWRmVZR,cplcgWRpgWLpAh,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpAh,cplcgWRpgWRpVZR,cplcHpmVWLmVZR,cplcHpmVWRmVZR,cplcVWLmVWRmVZR,          & 
& cplcVWRmVWLmVZR,cplFvFvAhL,cplFvFvAhR,cplFvFvVZRL,cplFvFvVZRR,cplhhVPVZR,              & 
& cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),             & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhHppmmcHppmm(4,2,2),cplcFdFdAhL(3,3,4),      & 
& cplcFdFdAhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),             & 
& cplcFeFeAhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuAhL(3,3,4),             & 
& cplcFuFuAhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgWLmgWLmAh(4),              & 
& cplcgWLmgWLmVZR,cplcgWLmgWRmAh(4),cplcgWLmgWRmVZR,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZR,   & 
& cplcgWLpgWRpAh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmAh(4),cplcgWRmgWLmVZR,cplcgWRmgWRmAh(4), & 
& cplcgWRmgWRmVZR,cplcgWRpgWLpAh(4),cplcgWRpgWLpVZR,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZR,   & 
& cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4),cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL(6,6,4), & 
& cplFvFvAhR(6,6,4),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhVPVZR(4),cplhhVZRVZR(4),      & 
& cplhhVZVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZR(i2)
coup2 = cplAhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZR(i2)
coup2 = cplAhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZR(i2,i1)
coup2 = cplAhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplAhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplAhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRAh 
 
Subroutine DerPi1LoopVZRAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhAhhh,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,               & 
& cplAhHppmmcHppmm,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmAh,cplcgWLmgWLmVZR,cplcgWLmgWRmAh,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpAh,cplcgWLpgWLpVZR,cplcgWLpgWRpAh,cplcgWLpgWRpVZR,cplcgWRmgWLmAh,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmAh,cplcgWRmgWRmVZR,cplcgWRpgWLpAh,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpAh,cplcgWRpgWRpVZR,cplcHpmVWLmVZR,cplcHpmVWRmVZR,cplcVWLmVWRmVZR,          & 
& cplcVWRmVWLmVZR,cplFvFvAhL,cplFvFvAhR,cplFvFvVZRL,cplFvFvVZRR,cplhhVPVZR,              & 
& cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplHppmmcHppmmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),             & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhHppmmcHppmm(4,2,2),cplcFdFdAhL(3,3,4),      & 
& cplcFdFdAhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),             & 
& cplcFeFeAhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuAhL(3,3,4),             & 
& cplcFuFuAhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgWLmgWLmAh(4),              & 
& cplcgWLmgWLmVZR,cplcgWLmgWRmAh(4),cplcgWLmgWRmVZR,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZR,   & 
& cplcgWLpgWRpAh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmAh(4),cplcgWRmgWLmVZR,cplcgWRmgWRmAh(4), & 
& cplcgWRmgWRmVZR,cplcgWRpgWLpAh(4),cplcgWRpgWLpVZR,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZR,   & 
& cplcHpmVWLmVZR(4),cplcHpmVWRmVZR(4),cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL(6,6,4), & 
& cplFvFvAhR(6,6,4),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhVPVZR(4),cplhhVZRVZR(4),      & 
& cplhhVZVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplHppmmcHppmmVZR(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWLmVZR(i2)
coup2 = cplAhcHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWRmVZR(i2)
coup2 = cplAhcHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hppmm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHppmm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHppmmcHppmmVZR(i2,i1)
coup2 = cplAhHppmmcHppmm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplAhHpmcVWLm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[Hpm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplAhHpmcVWRm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRAh 
 
Subroutine Pi1LoopVWLmHpm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWRmVWLm,cplAhHpmcHpm,cplcFdFuVWLmL,           & 
& cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgPgWLpVWLm,  & 
& cplcgPgWRpVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcHpm,cplcgWLpgZcHpm,           & 
& cplcgWLpgZpcHpm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcHpm,cplcgWRpgZcHpm,          & 
& cplcgWRpgZpcHpm,cplcgZgWLmcHpm,cplcgZgWLpVWLm,cplcgZgWRmcHpm,cplcgZgWRpVWLm,           & 
& cplcgZpgWLmcHpm,cplcgZpgWLpVWLm,cplcgZpgWRmcHpm,cplcgZpgWRpVWLm,cplcHpmVPVWLm,         & 
& cplcHpmVPVWRm,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,               & 
& cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,     & 
& cplcVWRmVPVWLm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplFvFecHpmL,cplFvFecHpmR,               & 
& cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,cplhhHpmcHpm,cplHpmcHpmVP,   & 
& cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHppmmVWLm,cplHppmmcHpmcHpm,cplHppmmcHpmcVWLm,        & 
& cplHppmmcHpmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWRmVWLm(4),cplAhHpmcHpm(4,4,4),          & 
& cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,6),cplcFeFvVWLmR(3,6),           & 
& cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcgPgWLpVWLm,cplcgPgWRpVWLm,               & 
& cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcHpm(4),cplcgWLpgZcHpm(4),cplcgWLpgZpcHpm(4), & 
& cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcHpm(4),cplcgWRpgZcHpm(4),cplcgWRpgZpcHpm(4), & 
& cplcgZgWLmcHpm(4),cplcgZgWLpVWLm,cplcgZgWRmcHpm(4),cplcgZgWRpVWLm,cplcgZpgWLmcHpm(4),  & 
& cplcgZpgWLpVWLm,cplcgZpgWRmcHpm(4),cplcgZpgWRpVWLm,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),  & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4),cplcHppmmVWLmVWLm(2),& 
& cplcHppmmVWLmVWRm(2),cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWRmVPVWLm,     & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplFvFecHpmL(6,3,4),cplFvFecHpmR(6,3,4),cplhhcHpmVWLm(4,4),& 
& cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhHpmcHpm(4,4,4),            & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),cplHpmcHppmmVWLm(4,2),          & 
& cplHppmmcHpmcHpm(2,4,4),cplHppmmcHpmcVWLm(2,4),cplHppmmcHpmcVWRm(2,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWLm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWRm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MAh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MAh2(i2)),dp) 
coup1 = cplAhcVWRmVWLm(i2)
coup2 = cplAhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,0._dp),dp) 
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZR2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,0._dp),dp) 
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZR2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWLm2),dp) 
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWRm2),dp) 
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MVWLm2),dp) 
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MVWRm2),dp) 
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWLm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWLm(i2,i1)
coup2 = cplHppmmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,0._dp),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcHpmVPVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,0._dp),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcHpmVPVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWLm(i1)
coup2 = cplHppmmcHpmcVWLm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcHpmcVWRm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcHpmVWLmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcHpmVWRmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplHpmcHpmVZR(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZR2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcHpmVWLmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZR2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcHpmVWRmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLmHpm 
 
Subroutine DerPi1LoopVWLmHpm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWRmVWLm,cplAhHpmcHpm,cplcFdFuVWLmL,      & 
& cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgPgWLpVWLm,  & 
& cplcgPgWRpVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcHpm,cplcgWLpgZcHpm,           & 
& cplcgWLpgZpcHpm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcHpm,cplcgWRpgZcHpm,          & 
& cplcgWRpgZpcHpm,cplcgZgWLmcHpm,cplcgZgWLpVWLm,cplcgZgWRmcHpm,cplcgZgWRpVWLm,           & 
& cplcgZpgWLmcHpm,cplcgZpgWLpVWLm,cplcgZpgWRmcHpm,cplcgZpgWRpVWLm,cplcHpmVPVWLm,         & 
& cplcHpmVPVWRm,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,               & 
& cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,     & 
& cplcVWRmVPVWLm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplFvFecHpmL,cplFvFecHpmR,               & 
& cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,cplhhHpmcHpm,cplHpmcHpmVP,   & 
& cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHppmmVWLm,cplHppmmcHpmcHpm,cplHppmmcHpmcVWLm,        & 
& cplHppmmcHpmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWRmVWLm(4),cplAhHpmcHpm(4,4,4),          & 
& cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,6),cplcFeFvVWLmR(3,6),           & 
& cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcgPgWLpVWLm,cplcgPgWRpVWLm,               & 
& cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcHpm(4),cplcgWLpgZcHpm(4),cplcgWLpgZpcHpm(4), & 
& cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcHpm(4),cplcgWRpgZcHpm(4),cplcgWRpgZpcHpm(4), & 
& cplcgZgWLmcHpm(4),cplcgZgWLpVWLm,cplcgZgWRmcHpm(4),cplcgZgWRpVWLm,cplcgZpgWLmcHpm(4),  & 
& cplcgZpgWLpVWLm,cplcgZpgWRmcHpm(4),cplcgZpgWRpVWLm,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),  & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4),cplcHppmmVWLmVWLm(2),& 
& cplcHppmmVWLmVWRm(2),cplcVWLmVPVWLm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWRmVPVWLm,     & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplFvFecHpmL(6,3,4),cplFvFecHpmR(6,3,4),cplhhcHpmVWLm(4,4),& 
& cplhhcHpmVWRm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhHpmcHpm(4,4,4),            & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),cplHpmcHppmmVWLm(4,2),          & 
& cplHppmmcHpmcHpm(2,4,4),cplHppmmcHpmcVWLm(2,4),cplHppmmcHpmcVWRm(2,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWLm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWRm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MAh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MAh2(i2)),dp) 
coup1 = cplAhcVWRmVWLm(i2)
coup2 = cplAhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVP2),dp) 
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZR2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVP2),dp) 
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZR2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWLm2),dp) 
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWRm2),dp) 
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MVWLm2),dp) 
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MVWRm2),dp) 
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWLm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWLm(i2,i1)
coup2 = cplHppmmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWLm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVP2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcHpmVPVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVP2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcHpmVPVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWLm(i1)
coup2 = cplHppmmcHpmcVWLm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcHpmcVWRm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcHpmVWLmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcHpmVWRmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWLmVZR(i1)
coup2 = cplHpmcHpmVZR(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZR2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcHpmVWLmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZR2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcHpmVWRmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLmHpm 
 
Subroutine Pi1LoopVWRmHpm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhHpmcHpm,cplcFdFuVWRmL,           & 
& cplcFdFuVWRmR,cplcFeFvVWRmL,cplcFeFvVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgPgWLpVWRm,  & 
& cplcgPgWRpVWRm,cplcgWLmgZpVWRm,cplcgWLmgZVWRm,cplcgWLpgPcHpm,cplcgWLpgZcHpm,           & 
& cplcgWLpgZpcHpm,cplcgWRmgZpVWRm,cplcgWRmgZVWRm,cplcgWRpgPcHpm,cplcgWRpgZcHpm,          & 
& cplcgWRpgZpcHpm,cplcgZgWLmcHpm,cplcgZgWLpVWRm,cplcgZgWRmcHpm,cplcgZgWRpVWRm,           & 
& cplcgZpgWLmcHpm,cplcgZpgWLpVWRm,cplcgZpgWRmcHpm,cplcgZpgWRpVWRm,cplcHpmVPVWLm,         & 
& cplcHpmVPVWRm,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,               & 
& cplcHppmmVWLmVWRm,cplcHppmmVWRmVWRm,cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,     & 
& cplcVWRmVPVWRm,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecHpmL,cplFvFecHpmR,               & 
& cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWRm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplHpmcHpmVP,   & 
& cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHppmmVWRm,cplHppmmcHpmcHpm,cplHppmmcHpmcVWLm,        & 
& cplHppmmcHpmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),cplAhHpmcHpm(4,4,4),          & 
& cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3),cplcFeFvVWRmL(3,6),cplcFeFvVWRmR(3,6),           & 
& cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcgPgWLpVWRm,cplcgPgWRpVWRm,               & 
& cplcgWLmgZpVWRm,cplcgWLmgZVWRm,cplcgWLpgPcHpm(4),cplcgWLpgZcHpm(4),cplcgWLpgZpcHpm(4), & 
& cplcgWRmgZpVWRm,cplcgWRmgZVWRm,cplcgWRpgPcHpm(4),cplcgWRpgZcHpm(4),cplcgWRpgZpcHpm(4), & 
& cplcgZgWLmcHpm(4),cplcgZgWLpVWRm,cplcgZgWRmcHpm(4),cplcgZgWRpVWRm,cplcgZpgWLmcHpm(4),  & 
& cplcgZpgWLpVWRm,cplcgZpgWRmcHpm(4),cplcgZpgWRpVWRm,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),  & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4),cplcHppmmVWLmVWRm(2),& 
& cplcHppmmVWRmVWRm(2),cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVPVWRm,     & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecHpmL(6,3,4),cplFvFecHpmR(6,3,4),cplhhcHpmVWLm(4,4),& 
& cplhhcHpmVWRm(4,4),cplhhcVWLmVWRm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),            & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),cplHpmcHppmmVWRm(4,2),          & 
& cplHppmmcHpmcHpm(2,4,4),cplHppmmcHpmcVWLm(2,4),cplHppmmcHpmcVWRm(2,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWRm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MAh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MAh2(i2)),dp) 
coup1 = cplAhcVWLmVWRm(i2)
coup2 = cplAhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWRmL(i1,i2)
coupR1 = cplcFdFuVWRmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWRmL(i1,i2)
coupR1 = cplcFeFvVWRmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,0._dp),dp) 
coup1 = cplcgPgWLpVWRm
coup2 = cplcgWLpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcgZgWLpVWRm
coup2 = cplcgWLpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZR2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcgZpgWLpVWRm
coup2 = cplcgWLpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,0._dp),dp) 
coup1 = cplcgPgWRpVWRm
coup2 = cplcgWRpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcgZgWRpVWRm
coup2 = cplcgWRpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZR2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcgZpgWRpVWRm
coup2 = cplcgWRpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWLm2),dp) 
coup1 = cplcgWLmgZVWRm
coup2 = cplcgZgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWRm2),dp) 
coup1 = cplcgWRmgZVWRm
coup2 = cplcgZgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MVWLm2),dp) 
coup1 = cplcgWLmgZpVWRm
coup2 = cplcgZpgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MVWRm2),dp) 
coup1 = cplcgWRmgZpVWRm
coup2 = cplcgZpgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWRm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWRm(i2)
coup2 = cplhhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWRm(i2)
coup2 = cplhhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWRm(i2,i1)
coup2 = cplHppmmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,0._dp),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcHpmVPVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,0._dp),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcHpmVPVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcHpmcVWLm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWRmVWRm(i1)
coup2 = cplHppmmcHpmcVWRm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcHpmVWLmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcHpmVWRmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplHpmcHpmVZR(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVZR2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplcHpmVWLmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVZR2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplcHpmVWRmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRmHpm 
 
Subroutine DerPi1LoopVWRmHpm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,cplAhcHpmVWLm,cplAhcHpmVWRm,cplAhcVWLmVWRm,cplAhHpmcHpm,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFeFvVWRmL,cplcFeFvVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgPgWLpVWRm,  & 
& cplcgPgWRpVWRm,cplcgWLmgZpVWRm,cplcgWLmgZVWRm,cplcgWLpgPcHpm,cplcgWLpgZcHpm,           & 
& cplcgWLpgZpcHpm,cplcgWRmgZpVWRm,cplcgWRmgZVWRm,cplcgWRpgPcHpm,cplcgWRpgZcHpm,          & 
& cplcgWRpgZpcHpm,cplcgZgWLmcHpm,cplcgZgWLpVWRm,cplcgZgWRmcHpm,cplcgZgWRpVWRm,           & 
& cplcgZpgWLmcHpm,cplcgZpgWLpVWRm,cplcgZpgWRmcHpm,cplcgZpgWRpVWRm,cplcHpmVPVWLm,         & 
& cplcHpmVPVWRm,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,               & 
& cplcHppmmVWLmVWRm,cplcHppmmVWRmVWRm,cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,     & 
& cplcVWRmVPVWRm,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecHpmL,cplFvFecHpmR,               & 
& cplhhcHpmVWLm,cplhhcHpmVWRm,cplhhcVWLmVWRm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplHpmcHpmVP,   & 
& cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHppmmVWRm,cplHppmmcHpmcHpm,cplHppmmcHpmcVWLm,        & 
& cplHppmmcHpmcVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplAhcVWLmVWRm(4),cplAhHpmcHpm(4,4,4),          & 
& cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3),cplcFeFvVWRmL(3,6),cplcFeFvVWRmR(3,6),           & 
& cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcgPgWLpVWRm,cplcgPgWRpVWRm,               & 
& cplcgWLmgZpVWRm,cplcgWLmgZVWRm,cplcgWLpgPcHpm(4),cplcgWLpgZcHpm(4),cplcgWLpgZpcHpm(4), & 
& cplcgWRmgZpVWRm,cplcgWRmgZVWRm,cplcgWRpgPcHpm(4),cplcgWRpgZcHpm(4),cplcgWRpgZpcHpm(4), & 
& cplcgZgWLmcHpm(4),cplcgZgWLpVWRm,cplcgZgWRmcHpm(4),cplcgZgWRpVWRm,cplcgZpgWLmcHpm(4),  & 
& cplcgZpgWLpVWRm,cplcgZpgWRmcHpm(4),cplcgZpgWRpVWRm,cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),  & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4),cplcHppmmVWLmVWRm(2),& 
& cplcHppmmVWRmVWRm(2),cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVPVWRm,     & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplFvFecHpmL(6,3,4),cplFvFecHpmR(6,3,4),cplhhcHpmVWLm(4,4),& 
& cplhhcHpmVWRm(4,4),cplhhcVWLmVWRm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),            & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),cplHpmcHppmmVWRm(4,2),          & 
& cplHppmmcHpmcHpm(2,4,4),cplHppmmcHpmcVWLm(2,4),cplHppmmcHpmcVWRm(2,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWRm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MAh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MAh2(i2)),dp) 
coup1 = cplAhcVWLmVWRm(i2)
coup2 = cplAhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWRmL(i1,i2)
coupR1 = cplcFdFuVWRmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWRmL(i1,i2)
coupR1 = cplcFeFvVWRmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVP2),dp) 
coup1 = cplcgPgWLpVWRm
coup2 = cplcgWLpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcgZgWLpVWRm
coup2 = cplcgWLpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZR2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcgZpgWLpVWRm
coup2 = cplcgWLpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVP2),dp) 
coup1 = cplcgPgWRpVWRm
coup2 = cplcgWRpgPcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcgZgWRpVWRm
coup2 = cplcgWRpgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZR2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcgZpgWRpVWRm
coup2 = cplcgWRpgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWLm2),dp) 
coup1 = cplcgWLmgZVWRm
coup2 = cplcgZgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWRm2),dp) 
coup1 = cplcgWRmgZVWRm
coup2 = cplcgZgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MVWLm2),dp) 
coup1 = cplcgWLmgZpVWRm
coup2 = cplcgZpgWLmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MVWRm2),dp) 
coup1 = cplcgWRmgZpVWRm
coup2 = cplcgZpgWRmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWRm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWRm(i2)
coup2 = cplhhcHpmVWLm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWRm(i2)
coup2 = cplhhcHpmVWRm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hppmm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHppmm2(i1)),dp) 
coup1 = cplHpmcHppmmVWRm(i2,i1)
coup2 = cplHppmmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWRm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVP2),dp) 
coup1 = cplcVWLmVPVWRm
coup2 = cplcHpmVPVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVP2),dp) 
coup1 = cplcVWRmVPVWRm
coup2 = cplcHpmVPVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hppmm], VWLm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWLmVWRm(i1)
coup2 = cplHppmmcHpmcVWLm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hppmm], VWRm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHppmm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHppmm2(i1)),dp) 
coup1 = cplcHppmmVWRmVWRm(i1)
coup2 = cplHppmmcHpmcVWRm(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcHpmVWLmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcHpmVWRmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWRmVZR(i1)
coup2 = cplHpmcHpmVZR(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVZR2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplcHpmVWLmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVZR2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplcHpmVWRmVZR(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWRmHpm 
 
End Module LoopMasses_LRSM_freegR 

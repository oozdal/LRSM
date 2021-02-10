! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:22 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_LRSM_freegR 
 
Use Model_Data_LRSM_freegR 
Use TreeLevelMasses_LRSM_freegR 
Use RGEs_LRSM_freegR 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,              & 
& ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,          & 
& MU22,MU12,vHd,vHu,vR,vL,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12,vHd,vHu,vR,vL

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Complex(dp), Intent(in) :: Tad1Loop(4)

! For numerical routines 
Real(dp) :: gC(133)
logical :: broycheck 
Real(dp) :: broyx(4)

If (HighScaleModel.Eq."LOW") Then 
MU12 = (ALP1*vHd**2*vL**4 - ALP1*vHu**2*vL**4 - ALP3*vHu**2*vL**4 - 2*BETA1*vHd*vHu*vL**3*vR +& 
&  4*BETA3*vHu**2*vL**3*vR + 4*RHO1*vL**4*vR**2 - 2*RHO3*vL**4*vR**2 + 2*BETA1*vHd*vHu*vL*vR**3 -& 
&  4*BETA3*vHu**2*vL*vR**3 - ALP1*vHd**2*vR**4 + ALP1*vHu**2*vR**4 + ALP3*vHu**2*vR**4 - & 
&  4*RHO1*vL**2*vR**4 + 2*RHO3*vL**2*vR**4 - 4*LAM4*vHd*vHu*(vHd**2 - vHu**2)*(vL**2 -   & 
&  vR**2) + 2*LAM1*(vHd**4 - vHu**4)*(vL**2 - vR**2) - 2*vHd*vL**2*Tad1Loop(1) +         & 
&  2*vHd*vR**2*Tad1Loop(1) + 2*vHu*vL**2*Tad1Loop(2) - 2*vHu*vR**2*Tad1Loop(2) +         & 
&  4*vL**2*vR*Tad1Loop(3) - 4*vL*vR**2*Tad1Loop(4))/(2._dp*(vHd**2 - vHu**2)*(vL**2 - vR**2))
MU22 = (-4*LAM3*vHd**4*vHu*vL**2 + 4*LAM3*vHd**2*vHu**3*vL**2 + 2*ALP2*vHd**3*vL**4 -        & 
&  ALP3*vHd**2*vHu*vL**4 - 2*ALP2*vHd*vHu**2*vL**4 - BETA1*vHd**3*vL**3*vR +             & 
&  2*BETA3*vHd**2*vHu*vL**3*vR - BETA1*vHd*vHu**2*vL**3*vR + 2*BETA3*vHu**3*vL**3*vR +   & 
&  4*LAM3*vHd**4*vHu*vR**2 - 4*LAM3*vHd**2*vHu**3*vR**2 + 4*RHO1*vHu*vL**4*vR**2 -       & 
&  2*RHO3*vHu*vL**4*vR**2 + BETA1*vHd**3*vL*vR**3 - 2*BETA3*vHd**2*vHu*vL*vR**3 +        & 
&  BETA1*vHd*vHu**2*vL*vR**3 - 2*BETA3*vHu**3*vL*vR**3 - 2*ALP2*vHd**3*vR**4 +           & 
&  ALP3*vHd**2*vHu*vR**4 + 2*ALP2*vHd*vHu**2*vR**4 - 4*RHO1*vHu*vL**2*vR**4 +            & 
&  2*RHO3*vHu*vL**2*vR**4 - 8*LAM2*vHd**2*vHu*(vHd**2 - vHu**2)*(vL**2 - vR**2) +        & 
&  2*LAM4*vHd*(vHd**4 - vHu**4)*(vL**2 - vR**2) - 2*vHd*vHu*vL**2*Tad1Loop(1) +          & 
&  2*vHd*vHu*vR**2*Tad1Loop(1) + 2*vHd**2*vL**2*Tad1Loop(2) - 2*vHd**2*vR**2*Tad1Loop(2) +& 
&  4*vHu*vL**2*vR*Tad1Loop(3) - 4*vHu*vL*vR**2*Tad1Loop(4))/(4._dp*vHd*(vHd**2 -         & 
&  vHu**2)*(vL**2 - vR**2))
muLR2 = (ALP3*vHu**2*vL**2 + 2*RHO1*vL**4 - ALP3*vHu**2*vR**2 - 2*RHO1*vR**4 + ALP1*(vHd**2 + & 
&  vHu**2)*(vL**2 - vR**2) + 4*ALP2*vHd*vHu*(-vL**2 + vR**2) + 2*vR*Tad1Loop(3) -        & 
&  2*vL*Tad1Loop(4))/(2._dp*(vL**2 - vR**2))
BETA2 = (-2*RHO1*vL**3*vR + RHO3*vL**3*vR + 2*RHO1*vL*vR**3 - RHO3*vL*vR**3 + BETA1*vHd*vHu*(vL**2 -& 
&  vR**2) + BETA3*vHu**2*(-vL**2 + vR**2) - 2*vL*Tad1Loop(3) + 2*vR*Tad1Loop(4))/(vHd**2*(vL**2 - vR**2))

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 If (muLR2.ne.muLR2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for muLR2" 
   Call TerminateProgram  
 End If 
 If (BETA2.ne.BETA2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for BETA2" 
   Call TerminateProgram  
 End If 
 Else 
MU12 = (ALP1*vHd**2*vL**4 - ALP1*vHu**2*vL**4 - ALP3*vHu**2*vL**4 - 2*BETA1*vHd*vHu*vL**3*vR +& 
&  4*BETA3*vHu**2*vL**3*vR + 4*RHO1*vL**4*vR**2 - 2*RHO3*vL**4*vR**2 + 2*BETA1*vHd*vHu*vL*vR**3 -& 
&  4*BETA3*vHu**2*vL*vR**3 - ALP1*vHd**2*vR**4 + ALP1*vHu**2*vR**4 + ALP3*vHu**2*vR**4 - & 
&  4*RHO1*vL**2*vR**4 + 2*RHO3*vL**2*vR**4 - 4*LAM4*vHd*vHu*(vHd**2 - vHu**2)*(vL**2 -   & 
&  vR**2) + 2*LAM1*(vHd**4 - vHu**4)*(vL**2 - vR**2) - 2*vHd*vL**2*Tad1Loop(1) +         & 
&  2*vHd*vR**2*Tad1Loop(1) + 2*vHu*vL**2*Tad1Loop(2) - 2*vHu*vR**2*Tad1Loop(2) +         & 
&  4*vL**2*vR*Tad1Loop(3) - 4*vL*vR**2*Tad1Loop(4))/(2._dp*(vHd**2 - vHu**2)*(vL**2 - vR**2))
MU22 = (-4*LAM3*vHd**4*vHu*vL**2 + 4*LAM3*vHd**2*vHu**3*vL**2 + 2*ALP2*vHd**3*vL**4 -        & 
&  ALP3*vHd**2*vHu*vL**4 - 2*ALP2*vHd*vHu**2*vL**4 - BETA1*vHd**3*vL**3*vR +             & 
&  2*BETA3*vHd**2*vHu*vL**3*vR - BETA1*vHd*vHu**2*vL**3*vR + 2*BETA3*vHu**3*vL**3*vR +   & 
&  4*LAM3*vHd**4*vHu*vR**2 - 4*LAM3*vHd**2*vHu**3*vR**2 + 4*RHO1*vHu*vL**4*vR**2 -       & 
&  2*RHO3*vHu*vL**4*vR**2 + BETA1*vHd**3*vL*vR**3 - 2*BETA3*vHd**2*vHu*vL*vR**3 +        & 
&  BETA1*vHd*vHu**2*vL*vR**3 - 2*BETA3*vHu**3*vL*vR**3 - 2*ALP2*vHd**3*vR**4 +           & 
&  ALP3*vHd**2*vHu*vR**4 + 2*ALP2*vHd*vHu**2*vR**4 - 4*RHO1*vHu*vL**2*vR**4 +            & 
&  2*RHO3*vHu*vL**2*vR**4 - 8*LAM2*vHd**2*vHu*(vHd**2 - vHu**2)*(vL**2 - vR**2) +        & 
&  2*LAM4*vHd*(vHd**4 - vHu**4)*(vL**2 - vR**2) - 2*vHd*vHu*vL**2*Tad1Loop(1) +          & 
&  2*vHd*vHu*vR**2*Tad1Loop(1) + 2*vHd**2*vL**2*Tad1Loop(2) - 2*vHd**2*vR**2*Tad1Loop(2) +& 
&  4*vHu*vL**2*vR*Tad1Loop(3) - 4*vHu*vL*vR**2*Tad1Loop(4))/(4._dp*vHd*(vHd**2 -         & 
&  vHu**2)*(vL**2 - vR**2))
muLR2 = (ALP3*vHu**2*vL**2 + 2*RHO1*vL**4 - ALP3*vHu**2*vR**2 - 2*RHO1*vR**4 + ALP1*(vHd**2 + & 
&  vHu**2)*(vL**2 - vR**2) + 4*ALP2*vHd*vHu*(-vL**2 + vR**2) + 2*vR*Tad1Loop(3) -        & 
&  2*vL*Tad1Loop(4))/(2._dp*(vL**2 - vR**2))
BETA2 = (-2*RHO1*vL**3*vR + RHO3*vL**3*vR + 2*RHO1*vL*vR**3 - RHO3*vL*vR**3 + BETA1*vHd*vHu*(vL**2 -& 
&  vR**2) + BETA3*vHu**2*(-vL**2 + vR**2) - 2*vL*Tad1Loop(3) + 2*vR*Tad1Loop(4))/(vHd**2*(vL**2 - vR**2))

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 If (muLR2.ne.muLR2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for muLR2" 
   Call TerminateProgram  
 End If 
 If (BETA2.ne.BETA2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for BETA2" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,             & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12,vHd,vHu,vR,vL

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Complex(dp), Intent(in) :: Tad1Loop(4)

Real(dp), Intent(out) :: TadpoleValues(4)

TadpoleValues(1) = Real((2*LAM1*vHd**3 - 6*LAM4*vHd**2*vHu + vHd*(-2._dp*(MU12)       & 
&  + 2*(LAM1 + 4._dp*(LAM2) + 2._dp*(LAM3))*vHu**2 + ALP1*vL**2 - 2*BETA2*vL*vR + ALP1*vR**2)& 
&  + vHu*(4._dp*(MU22) - 2*LAM4*vHu**2 - 2*ALP2*vL**2 + BETA1*vL*vR - 2*ALP2*vR**2))     & 
& /2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((-2*LAM4*vHd**3 + 2*(LAM1 + 4._dp*(LAM2) + 2._dp*(LAM3))      & 
& *vHd**2*vHu + vHd*(4._dp*(MU22) - 6*LAM4*vHu**2 - 2*ALP2*vL**2 + BETA1*vL*vR - 2*ALP2*vR**2)& 
&  + vHu*(-2._dp*(MU12) + 2*LAM1*vHu**2 + (ALP1 + ALP3)*vL**2 - 2*BETA3*vL*vR + ALP1*vR**2 + ALP3*vR**2))& 
& /2._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((vHd**2*(-(BETA2*vL) + ALP1*vR) + vHd*vHu*(BETA1*vL - 4*ALP2*vR)& 
&  + vHu**2*(-(BETA3*vL) + (ALP1 + ALP3)*vR) + vR*(-2._dp*(muLR2) + RHO3*vL**2 + 2*RHO1*vR**2))& 
& /2._dp - Tad1Loop(3),dp) 
TadpoleValues(4) = Real((2*RHO1*vL**3 - (BETA2*vHd**2 - BETA1*vHd*vHu + BETA3*vHu**2) & 
& *vR + vL*(-2._dp*(muLR2) + ALP1*vHd**2 - 4*ALP2*vHd*vHu + (ALP1 + ALP3)*vHu**2 + RHO3*vR**2))& 
& /2._dp - Tad1Loop(4),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_LRSM_freegR 
 

! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:06 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Module RGEs_LRSM_freegR 
 
Use Control 
Use Settings 
Use Model_Data_LRSM_freegR 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters129(g,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,            & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12)

Implicit None 
Real(dp), Intent(in) :: g(129) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(out) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters129' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO4= g(6) 
RHO1= g(7) 
RHO3= g(8) 
BETA1= g(9) 
ALP3= g(10) 
ALP1= g(11) 
LAM1= g(12) 
ALP2= g(13) 
BETA2= g(14) 
BETA3= g(15) 
LAM4= g(16) 
LAM2= g(17) 
LAM3= g(18) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+19), g(SumI+20), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+37), g(SumI+38), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+55), g(SumI+56), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+73), g(SumI+74), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDL(i1,i2) = Cmplx( g(SumI+91), g(SumI+92), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL2(i1,i2) = Cmplx( g(SumI+109), g(SumI+110), dp) 
End Do 
 End Do 
 
muLR2= g(127) 
MU22= g(128) 
MU12= g(129) 
Do i1=1,129 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters129

Subroutine ParametersToG129(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,              & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,g)

Implicit None 
Real(dp), Intent(out) :: g(129) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG129' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO4  
g(7) = RHO1  
g(8) = RHO3  
g(9) = BETA1  
g(10) = ALP3  
g(11) = ALP1  
g(12) = LAM1  
g(13) = ALP2  
g(14) = BETA2  
g(15) = BETA3  
g(16) = LAM4  
g(17) = LAM2  
g(18) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19) = Real(YDR(i1,i2), dp) 
g(SumI+20) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+37) = Real(YL1(i1,i2), dp) 
g(SumI+38) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+55) = Real(YQ1(i1,i2), dp) 
g(SumI+56) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+73) = Real(YQ2(i1,i2), dp) 
g(SumI+74) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+91) = Real(YDL(i1,i2), dp) 
g(SumI+92) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+109) = Real(YL2(i1,i2), dp) 
g(SumI+110) = Aimag(YL2(i1,i2)) 
End Do 
End Do 

g(127) = muLR2  
g(128) = MU22  
g(129) = MU12  
Iname = Iname - 1 
 
End Subroutine ParametersToG129

Subroutine rge129(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO4,betaRHO41,      & 
& betaRHO42,DRHO4,RHO1,betaRHO11,betaRHO12,DRHO1,RHO3,betaRHO31,betaRHO32,               & 
& DRHO3,BETA1,betaBETA11,betaBETA12,DBETA1,ALP3,betaALP31,betaALP32,DALP3,               & 
& ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,ALP2,betaALP21,          & 
& betaALP22,DALP2,BETA2,betaBETA21,betaBETA22,DBETA2,BETA3,betaBETA31,betaBETA32,        & 
& DBETA3,LAM4,betaLAM41,betaLAM42,DLAM4,LAM2,betaLAM21,betaLAM22,DLAM2,LAM3,             & 
& betaLAM31,betaLAM32,DLAM3,muLR2,betamuLR21,betamuLR22,DmuLR2,MU22,betaMU221,           & 
& betaMU222,DMU22,MU12,betaMU121,betaMU122,DMU12
Complex(dp) :: YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3)             & 
& ,YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3)              & 
& ,DYQ2(3,3),adjYQ2(3,3),YDL(3,3),betaYDL1(3,3),betaYDL2(3,3),DYDL(3,3),adjYDL(3,3)      & 
& ,YL2(3,3),betaYL21(3,3),betaYL22(3,3),DYL2(3,3),adjYL2(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge129' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters129(gy,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,            & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YQ2,adjYQ2)
Call Adjungate(YDL,adjYDL)
Call Adjungate(YL2,adjYL2)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! gR 
!-------------------- 
 
betagR1  = 0

 
 
If (TwoLoopRGE) Then 
betagR2 = 0

 
DgR = oo16pi2*( betagR1 + oo16pi2 * betagR2 ) 

 
Else 
DgR = oo16pi2* betagR1 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! RHO4 
!-------------------- 
 
betaRHO41  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO42 = 0

 
DRHO4 = oo16pi2*( betaRHO41 + oo16pi2 * betaRHO42 ) 

 
Else 
DRHO4 = oo16pi2* betaRHO41 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! RHO3 
!-------------------- 
 
betaRHO31  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO32 = 0

 
DRHO3 = oo16pi2*( betaRHO31 + oo16pi2 * betaRHO32 ) 

 
Else 
DRHO3 = oo16pi2* betaRHO31 
End If 
 
 
!-------------------- 
! BETA1 
!-------------------- 
 
betaBETA11  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA12 = 0

 
DBETA1 = oo16pi2*( betaBETA11 + oo16pi2 * betaBETA12 ) 

 
Else 
DBETA1 = oo16pi2* betaBETA11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! BETA2 
!-------------------- 
 
betaBETA21  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA22 = 0

 
DBETA2 = oo16pi2*( betaBETA21 + oo16pi2 * betaBETA22 ) 

 
Else 
DBETA2 = oo16pi2* betaBETA21 
End If 
 
 
!-------------------- 
! BETA3 
!-------------------- 
 
betaBETA31  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA32 = 0

 
DBETA3 = oo16pi2*( betaBETA31 + oo16pi2 * betaBETA32 ) 

 
Else 
DBETA3 = oo16pi2* betaBETA31 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! YDR 
!-------------------- 
 
betaYDR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDR2 = 0

 
DYDR = oo16pi2*( betaYDR1 + oo16pi2 * betaYDR2 ) 

 
Else 
DYDR = oo16pi2* betaYDR1 
End If 
 
 
Call Chop(DYDR) 

!-------------------- 
! YL1 
!-------------------- 
 
betaYL11  = 0

 
 
If (TwoLoopRGE) Then 
betaYL12 = 0

 
DYL1 = oo16pi2*( betaYL11 + oo16pi2 * betaYL12 ) 

 
Else 
DYL1 = oo16pi2* betaYL11 
End If 
 
 
Call Chop(DYL1) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! YDL 
!-------------------- 
 
betaYDL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDL2 = 0

 
DYDL = oo16pi2*( betaYDL1 + oo16pi2 * betaYDL2 ) 

 
Else 
DYDL = oo16pi2* betaYDL1 
End If 
 
 
Call Chop(DYDL) 

!-------------------- 
! YL2 
!-------------------- 
 
betaYL21  = 0

 
 
If (TwoLoopRGE) Then 
betaYL22 = 0

 
DYL2 = oo16pi2*( betaYL21 + oo16pi2 * betaYL22 ) 

 
Else 
DYL2 = oo16pi2* betaYL21 
End If 
 
 
Call Chop(DYL2) 

!-------------------- 
! muLR2 
!-------------------- 
 
betamuLR21  = 0

 
 
If (TwoLoopRGE) Then 
betamuLR22 = 0

 
DmuLR2 = oo16pi2*( betamuLR21 + oo16pi2 * betamuLR22 ) 

 
Else 
DmuLR2 = oo16pi2* betamuLR21 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
Call ParametersToG129(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO4,DRHO1,DRHO3,DBETA1,DALP3,          & 
& DALP1,DLAM1,DALP2,DBETA2,DBETA3,DLAM4,DLAM2,DLAM3,DYDR,DYL1,DYQ1,DYQ2,DYDL,            & 
& DYL2,DmuLR2,DMU22,DMU12,f)

Iname = Iname - 1 
 
End Subroutine rge129  

Subroutine GToParameters133(g,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,            & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL)

Implicit None 
Real(dp), Intent(in) :: g(133) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12,vHd,vHu,vR,vL

Complex(dp),Intent(out) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters133' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO4= g(6) 
RHO1= g(7) 
RHO3= g(8) 
BETA1= g(9) 
ALP3= g(10) 
ALP1= g(11) 
LAM1= g(12) 
ALP2= g(13) 
BETA2= g(14) 
BETA3= g(15) 
LAM4= g(16) 
LAM2= g(17) 
LAM3= g(18) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+19), g(SumI+20), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+37), g(SumI+38), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+55), g(SumI+56), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+73), g(SumI+74), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDL(i1,i2) = Cmplx( g(SumI+91), g(SumI+92), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL2(i1,i2) = Cmplx( g(SumI+109), g(SumI+110), dp) 
End Do 
 End Do 
 
muLR2= g(127) 
MU22= g(128) 
MU12= g(129) 
vHd= g(130) 
vHu= g(131) 
vR= g(132) 
vL= g(133) 
Do i1=1,133 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters133

Subroutine ParametersToG133(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,              & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,g)

Implicit None 
Real(dp), Intent(out) :: g(133) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12,vHd,vHu,vR,vL

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG133' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO4  
g(7) = RHO1  
g(8) = RHO3  
g(9) = BETA1  
g(10) = ALP3  
g(11) = ALP1  
g(12) = LAM1  
g(13) = ALP2  
g(14) = BETA2  
g(15) = BETA3  
g(16) = LAM4  
g(17) = LAM2  
g(18) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19) = Real(YDR(i1,i2), dp) 
g(SumI+20) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+37) = Real(YL1(i1,i2), dp) 
g(SumI+38) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+55) = Real(YQ1(i1,i2), dp) 
g(SumI+56) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+73) = Real(YQ2(i1,i2), dp) 
g(SumI+74) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+91) = Real(YDL(i1,i2), dp) 
g(SumI+92) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+109) = Real(YL2(i1,i2), dp) 
g(SumI+110) = Aimag(YL2(i1,i2)) 
End Do 
End Do 

g(127) = muLR2  
g(128) = MU22  
g(129) = MU12  
g(130) = vHd  
g(131) = vHu  
g(132) = vR  
g(133) = vL  
Iname = Iname - 1 
 
End Subroutine ParametersToG133

Subroutine rge133(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO4,betaRHO41,      & 
& betaRHO42,DRHO4,RHO1,betaRHO11,betaRHO12,DRHO1,RHO3,betaRHO31,betaRHO32,               & 
& DRHO3,BETA1,betaBETA11,betaBETA12,DBETA1,ALP3,betaALP31,betaALP32,DALP3,               & 
& ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,ALP2,betaALP21,          & 
& betaALP22,DALP2,BETA2,betaBETA21,betaBETA22,DBETA2,BETA3,betaBETA31,betaBETA32,        & 
& DBETA3,LAM4,betaLAM41,betaLAM42,DLAM4,LAM2,betaLAM21,betaLAM22,DLAM2,LAM3,             & 
& betaLAM31,betaLAM32,DLAM3,muLR2,betamuLR21,betamuLR22,DmuLR2,MU22,betaMU221,           & 
& betaMU222,DMU22,MU12,betaMU121,betaMU122,DMU12,vHd,betavHd1,betavHd2,DvHd,             & 
& vHu,betavHu1,betavHu2,DvHu,vR,betavR1,betavR2,DvR,vL,betavL1,betavL2,DvL
Complex(dp) :: YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3)             & 
& ,YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3)              & 
& ,DYQ2(3,3),adjYQ2(3,3),YDL(3,3),betaYDL1(3,3),betaYDL2(3,3),DYDL(3,3),adjYDL(3,3)      & 
& ,YL2(3,3),betaYL21(3,3),betaYL22(3,3),DYL2(3,3),adjYL2(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge133' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters133(gy,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,            & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,               & 
& MU12,vHd,vHu,vR,vL)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YQ2,adjYQ2)
Call Adjungate(YDL,adjYDL)
Call Adjungate(YL2,adjYL2)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! gR 
!-------------------- 
 
betagR1  = 0

 
 
If (TwoLoopRGE) Then 
betagR2 = 0

 
DgR = oo16pi2*( betagR1 + oo16pi2 * betagR2 ) 

 
Else 
DgR = oo16pi2* betagR1 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! RHO4 
!-------------------- 
 
betaRHO41  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO42 = 0

 
DRHO4 = oo16pi2*( betaRHO41 + oo16pi2 * betaRHO42 ) 

 
Else 
DRHO4 = oo16pi2* betaRHO41 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! RHO3 
!-------------------- 
 
betaRHO31  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO32 = 0

 
DRHO3 = oo16pi2*( betaRHO31 + oo16pi2 * betaRHO32 ) 

 
Else 
DRHO3 = oo16pi2* betaRHO31 
End If 
 
 
!-------------------- 
! BETA1 
!-------------------- 
 
betaBETA11  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA12 = 0

 
DBETA1 = oo16pi2*( betaBETA11 + oo16pi2 * betaBETA12 ) 

 
Else 
DBETA1 = oo16pi2* betaBETA11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! BETA2 
!-------------------- 
 
betaBETA21  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA22 = 0

 
DBETA2 = oo16pi2*( betaBETA21 + oo16pi2 * betaBETA22 ) 

 
Else 
DBETA2 = oo16pi2* betaBETA21 
End If 
 
 
!-------------------- 
! BETA3 
!-------------------- 
 
betaBETA31  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA32 = 0

 
DBETA3 = oo16pi2*( betaBETA31 + oo16pi2 * betaBETA32 ) 

 
Else 
DBETA3 = oo16pi2* betaBETA31 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! YDR 
!-------------------- 
 
betaYDR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDR2 = 0

 
DYDR = oo16pi2*( betaYDR1 + oo16pi2 * betaYDR2 ) 

 
Else 
DYDR = oo16pi2* betaYDR1 
End If 
 
 
Call Chop(DYDR) 

!-------------------- 
! YL1 
!-------------------- 
 
betaYL11  = 0

 
 
If (TwoLoopRGE) Then 
betaYL12 = 0

 
DYL1 = oo16pi2*( betaYL11 + oo16pi2 * betaYL12 ) 

 
Else 
DYL1 = oo16pi2* betaYL11 
End If 
 
 
Call Chop(DYL1) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! YDL 
!-------------------- 
 
betaYDL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDL2 = 0

 
DYDL = oo16pi2*( betaYDL1 + oo16pi2 * betaYDL2 ) 

 
Else 
DYDL = oo16pi2* betaYDL1 
End If 
 
 
Call Chop(DYDL) 

!-------------------- 
! YL2 
!-------------------- 
 
betaYL21  = 0

 
 
If (TwoLoopRGE) Then 
betaYL22 = 0

 
DYL2 = oo16pi2*( betaYL21 + oo16pi2 * betaYL22 ) 

 
Else 
DYL2 = oo16pi2* betaYL21 
End If 
 
 
Call Chop(DYL2) 

!-------------------- 
! muLR2 
!-------------------- 
 
betamuLR21  = 0

 
 
If (TwoLoopRGE) Then 
betamuLR22 = 0

 
DmuLR2 = oo16pi2*( betamuLR21 + oo16pi2 * betamuLR22 ) 

 
Else 
DmuLR2 = oo16pi2* betamuLR21 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
!-------------------- 
! vHd 
!-------------------- 
 
betavHd1  = 0

 
 
If (TwoLoopRGE) Then 
betavHd2 = 0

 
DvHd = oo16pi2*( betavHd1 + oo16pi2 * betavHd2 ) 

 
Else 
DvHd = oo16pi2* betavHd1 
End If 
 
 
!-------------------- 
! vHu 
!-------------------- 
 
betavHu1  = 0

 
 
If (TwoLoopRGE) Then 
betavHu2 = 0

 
DvHu = oo16pi2*( betavHu1 + oo16pi2 * betavHu2 ) 

 
Else 
DvHu = oo16pi2* betavHu1 
End If 
 
 
!-------------------- 
! vR 
!-------------------- 
 
betavR1  = 0

 
 
If (TwoLoopRGE) Then 
betavR2 = 0

 
DvR = oo16pi2*( betavR1 + oo16pi2 * betavR2 ) 

 
Else 
DvR = oo16pi2* betavR1 
End If 
 
 
!-------------------- 
! vL 
!-------------------- 
 
betavL1  = 0

 
 
If (TwoLoopRGE) Then 
betavL2 = 0

 
DvL = oo16pi2*( betavL1 + oo16pi2 * betavL2 ) 

 
Else 
DvL = oo16pi2* betavL1 
End If 
 
 
Call ParametersToG133(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO4,DRHO1,DRHO3,DBETA1,DALP3,          & 
& DALP1,DLAM1,DALP2,DBETA2,DBETA3,DLAM4,DLAM2,DLAM3,DYDR,DYL1,DYQ1,DYQ2,DYDL,            & 
& DYL2,DmuLR2,DMU22,DMU12,DvHd,DvHu,DvR,DvL,f)

Iname = Iname - 1 
 
End Subroutine rge133  

End Module RGEs_LRSM_freegR 
 

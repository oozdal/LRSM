! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:11 on 10.2.2021   
! ----------------------------------------------------------------------  
 
 
Module Boundaries_LRSM_freegR 
 
Use Control 
Use Settings 
Use LoopCouplings_LRSM_freegR 
Use LoopMasses_LRSM_freegR 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_LRSM_freegR 
Use RGEs_LRSM_freegR 
Use RunSM_LRSM_freegR 
 
Use Tadpoles_LRSM_freegR 
Use RGEs_SM_HC 
Use LoopMasses_SM_HC 
Use CouplingsForDecays_LRSM_freegR 
Use StandardModel 
 
Integer, save :: YukScen 
Real(dp), save :: Lambda, MlambdaS,F_GMSB 
Real(dp),save::mGUT_save,sinW2_Q_mZ&
&, mf_l_Q_SM(3),mf_d_Q_SM(3),mf_u_Q_SM(3) & 
&, mf_l_MS_SM(3),mf_d_MS_SM(3),mf_u_MS_SM(3) 
Complex(dp),save::Yl_mZ(3,3),Yu_mZ(3,3),Yd_mZ(3,3),Yl_Q(3,3),Yu_Q(3,3),Yd_Q(3,3)
Real(dp),Save::vevs_DR_save(2), vSM_save
Contains 
 
Subroutine BoundarySM(i_run,Lambda_SM,delta0,g_SM,kont)

Implicit None 
Real(dp), Intent(out)::g_SM(62)
Integer, Intent(in) :: i_run 
Real(dp) :: mHiggs 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Complex(dp) ::uU_L_T(3,3),uU_R_T(3,3),uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), MuSM, adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp), Intent(in) :: Lambda_SM 
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp) :: Q2, logQ 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundarySM'
sinW2 = 1._dp - mW2/mZ2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
If (i_run.Eq.1) Then
   vSM = 246._dp 
   sinW2_Q=sinW2
   sinW2_old=sinW2_Q
   Y_l=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
       yl_MZ(i1,i1)=sqrt2*mf_l_mZ(i1)/vSM 
       yd_MZ(i1,i1)=sqrt2*mf_d_mZ(i1)/vSM 
       yu_MZ(i1,i1)=sqrt2*mf_u_mZ(i1)/vSM 
   End Do
   mf_l2=mf_l_mZ**2
   mf_d2=mf_d_mZ**2
   mf_u2=mf_u_mZ**2
Else
   vSM = vSM_save 
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
   mf_l2=mf_l2**2
   mf_d2=mf_d2**2
   mf_u2=mf_u2**2
End If
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
alphaMZ = AlphaEW_MS_SM(mZ,mf_d,mf_u,mf_l) 
 
alpha3 = AlphaS_MS_SM(mZ,mf_d,mf_u) 
If (.not.OneLoopMatching) alpha3= AlphaS_mZ 
If (.not.OneLoopMatching) alphaMZ = Alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*rho_2(mHiggs/mf_u(3)) 
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
TW= Asin(Sqrt(sinw2_Q)) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q)  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) 
vSM=sqrt(vev2) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
rho=1._dp/(1._dp-delta_rho)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta= 0._dp 
delta_rho0=0._dp
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
If ((0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ)  
vSM=sqrt(vev2) 


! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
  mf_l_MS_SM=mf_l_MZ
  mf_d_MS_SM=mf_d_MZ
  mf_u_MS_SM=mf_u_MZ
  mf_l_Q=mf_l_MS_SM
  mf_d_Q=mf_d_MS_SM
  mf_u_Q=mf_u_MS_SM
  YdSM=0._dp
  YuSM=0._dp
  YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_MS_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_MS_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_MS_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM


! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements


! Full one-loop corrections
Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,sigR_d,            & 
& sigL_d,sigSR_d,sigSL_d,sigR_u,sigL_u,sigSR_u,sigSL_u,sigR_l,sigL_l,sigSR_l,            & 
& sigSL_l,kont)

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/MFu(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
Else  
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
& -oo16pi2*MFu(3)*((2821._dp + 2028._dp*LogQ + 396._dp*LogQ**2 + 16._dp*Pi**2*(1._dp + 2._dp*log2) - 48._dp*Zeta3)*gSU3**4/18._dp) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
End if 
SigQCD=oo16pi2*SigQCD

mf_u_MS_SM(3)=mf_u(3)+SigQCD



! Obtain Yukawas
Call Yukawas(mf_u_MS_SM,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas(mf_d_MS_SM,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas(mf_l_MS_SM,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call FermionMass(YdSM,vSM,mf_d_Q,uD_L_T,uD_R_T,kont) 
Call FermionMass(YeSM,vSM,mf_l_Q,uL_L_T,uL_R_T,kont)
Call FermionMass(YuSM,vSM,mf_u_Q,uU_L_T,uU_R_T,kont)


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge
Call ParametersToG62_SM(g1SM,g2SM,g3SM,Lambda_SM,YuSM,YdSM,YeSM,MuSM,vSM,g_SM)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas(mf,vev,uL,uR,SigS,SigL,SigR,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invY
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
Y=Y*vev*oosqrt2
If (ReSum) Then
kont=0
Call chop(Y)
invY=Y
Call gaussj(kont,invY,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invY)-Transpose(SigL)-Matmul(Y,Matmul(SigR,invY))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Y=Matmul(invf,mass)
Else
Y=mass+SigS+Matmul(Transpose(SigL),Y)+Matmul(Y,SigR)
End If
Y=sqrt2*Y/vev
Call chop(y)
End Subroutine Yukawas

End Subroutine BoundarySM 
 
Subroutine BoundaryBSM(i_run,g_SM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,              & 
& vR,vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,          & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:) 
Real(dp),Intent(in) :: g_SM(62) 
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: vHd,vHu,vR,vL

Complex(dp) :: cplAhhhVP(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),   & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWLmgWLmVP,      & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplHpmcHpmVP(4,4),cplHpmcVWLmVP(4),cplHpmcVWRmVP(4),        & 
& cplHppmmcHppmmVP(2,2),cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP(4,4),   & 
& cplhhhhVPVP(4,4),cplHpmcHpmVPVP(4,4),cplHppmmcHppmmVPVP(2,2),cplcVWLmVPVPVWLm1,        & 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,               & 
& cplcVWRmVPVPVWRm3,cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),   & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),    & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),          & 
& cplHpmcVWRmVZ(4),cplHppmmcHppmmVZ(2,2),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplHppmmcHppmmVZVZ(2,2),         & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplHpmcVWLmVZR(4),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR, & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplAhHpmcVWLm(4,4),        & 
& cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplFvFecVWLmL(6,3),          & 
& cplFvFecVWLmR(6,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,    & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm(4,4),cplhhcVWLmVWLm(4),& 
& cplhhcVWLmVWRm(4),cplHppmmcHpmcVWLm(2,4),cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),  & 
& cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),& 
& cplHpmcHpmcVWLmVWLm(4,4),cplHppmmcHppmmcVWLmVWLm(2,2),cplcVWLmcVWLmVWLmVWLm1,          & 
& cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,& 
& cplcVWLmcVWRmVWLmVWRm3,cplAhcVWRmVWLm(4),cplhhcVWRmVWLm(4),cplcgWLmgWRmVZ,             & 
& cplcgWLpgWRpVZ,cplcgWLmgWRmVP,cplcgWLpgWRpVP,cplcHpmVWLmVZ(4),cplcHpmVWRmVZ(4),        & 
& cplcHpmVPVWLm(4),cplcHpmVPVWRm(4),cplAhAhVPVZ(4,4),cplhhhhVPVZ(4,4),cplHpmcHpmVPVZ(4,4),& 
& cplHppmmcHppmmVPVZ(2,2),cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,         & 
& cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcHpmVWLmVZR(4),               & 
& cplAhAhVPVZR(4,4),cplhhhhVPVZR(4,4),cplHpmcHpmVPVZR(4,4),cplHppmmcHppmmVPVZR(2,2),     & 
& cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,cplcVWRmVPVWRmVZR1,           & 
& cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplAhAhVZVZR(4,4),cplhhhhVZVZR(4,4),             & 
& cplHpmcHpmVZVZR(4,4),cplHppmmcHppmmVZVZR(2,2),cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,   & 
& cplcVWLmVWLmVZVZR3,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,           & 
& cplAhcHpmVWLm(4,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,6),           & 
& cplcFeFvVWLmR(3,6),cplcgWLmgPVWLm,cplcgWRmgPVWLm,cplcgPgWLpVWLm,cplcgZgWLpVWLm,        & 
& cplcgZpgWLpVWLm,cplcgPgWRpVWLm,cplcgZgWRpVWLm,cplcgZpgWRpVWLm,cplcgWLmgZVWLm

Complex(dp) :: cplcgWRmgZVWLm,cplcgWLmgZpVWLm,cplcgWRmgZpVWLm,cplhhcHpmVWLm(4,4),cplHpmcHppmmVWLm(4,2),& 
& cplcHppmmVWLmVWLm(2),cplcHppmmVWLmVWRm(2),cplAhAhcVWRmVWLm(4,4),cplhhhhcVWRmVWLm(4,4), & 
& cplHpmcHpmcVWRmVWLm(4,4),cplHppmmcHppmmcVWRmVWLm(2,2),cplcVWRmVPVPVWLm1,               & 
& cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,     & 
& cplcVWLmcVWRmVWLmVWLm3,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWLmVZRVZR1,             & 
& cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3

Complex(dp) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,4),cplcUFdFuHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3),cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),       & 
& cplcUFuFdcHpmL(3,3,4),cplcUFuFdcHpmR(3,3,4),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3), & 
& cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),     & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3),             & 
& cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),       & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvHpmL(3,6,4),cplcUFeFvHpmR(3,6,4),       & 
& cplcUFeFvVWLmL(3,6),cplcUFeFvVWLmR(3,6),cplcUFeFvVWRmL(3,6),cplcUFeFvVWRmR(3,6),       & 
& cplcUFecFeHppmmL(3,3,2),cplcUFecFeHppmmR(3,3,2)

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaQ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_Q,CosW2SinW2,gauge(3),delta,delta_SM,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dMZ2_SM, dMW2_SM, dMW2_0_SM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: SigSR_u_SM(3,3),SigSL_u_SM(3,3),sigR_u_SM(3,3),SigL_u_SM(3,3)
Complex(dp) :: SigSR_d_SM(3,3),SigSL_d_SM(3,3),SigR_d_SM(3,3),SigL_d_SM(3,3)
Complex(dp) :: SigSR_l_SM(3,3),SigSL_l_SM(3,3),sigR_l_SM(3,3),SigL_l_SM(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Real(dp) :: g1_MS, g2_MS,g3_MS,v_MS, mf_d_MS(3), mf_u_MS(3), mf_e_MS(3) 
Complex(dp) :: Yu_MS(3,3),Yd_MS(3,3),Ye_MS(3,3), Mu_MS, Lam_MS, MuSM 
Complex(dp) :: uU_L_MS(3,3),uU_R_MS(3,3)&
&,uD_L_MS(3,3),uD_R_MS(3,3),uL_L_MS(3,3),uL_R_MS(3,3), CKM_MS(3,3), delta_r_SM
Complex(dp) :: uU_L_T(3,3),uU_R_T(3,3)&
&,uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ, sinTW_MS, alphaEW_MS, alphaS_MS, mudim, mz2_MS, mw2_MS 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryBSM'
rMS_SM = rMS 
tanb = tanbetaMZ 
sinW2 = 1._dp - mW2/mZ2 
mudim = GetRenormalizationScale() 
mudim = sqrt(mudim) 
Call GToParameters62_SM(g_SM,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,Mu_MS,v_MS) 
sinTW_MS = g1_MS/sqrt(g1_MS**2+g2_MS**2) 
sinW2_Q = sinTW_MS**2 
alphaEW_MS = (sinTW_MS*g2_MS)**2/(4._dp*Pi) 
alphaS_MS = g3_MS**2/(4._dp*Pi) 
mz2_MS = (g1_MS**2+g2_MS**2)/(4._dp)*(v_MS**2) 
delta_r_SM = 1._dp - alphaEW_MS*Pi/(G_F*mz2*sqrt2*sinW2_Q*(1-sinW2_Q))
   Call FermionMass(Yd_MS,v_MS,mf_d_MS,uD_L_MS,uD_R_MS,kont)
   Call FermionMass(Ye_MS,v_MS,mf_e_MS,uL_L_MS,uL_R_MS,kont)
   Call FermionMass(Yu_MS,v_MS,mf_u_MS,uU_L_MS,uU_R_MS,kont)
   CKM_MS = MatMul(uU_R_MS,Transpose(Conjg(uD_R_MS))) 
!-----------------
!sin(theta_W)^2
!-----------------
vSM = v_MS 
   sinW2_old=sinW2_Q
   mf_l2=mf_e_MS**2
   mf_d2=mf_d_MS**2
   mf_u2=mf_u_MS**2
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaQ = AlphaEw_T(alphaEW_MS,mudim,Abs(MVWLm),Abs(MVWRm),Abs(MHpm),Abs(MHppmm),Abs(MFd),Abs(MFu),Abs(MFe)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaS_T(alphaS_MS,mudim,Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = alphaS_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
If (i_run.eq.1) Then 
 YeSM=Yl_MZ
 YdSM=Yd_MZ
 YuSM=Yu_MZ
Else 
 YeSM=Yl_Q
 YdSM=Yd_Q
 YuSM=Yu_Q
End if 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,GenerationMixing,kont)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 
MVZ2 = mZ2 
MVZ= Sqrt(MVZ2) 
MVWLm2 = mW2 
MVWLm= Sqrt(MVWLm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
If (.not.MatchZWpoleMasses) Then 
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

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,dmZ2)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWLm2 = mW2_run 
MVWLm= Sqrt(MVWLm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=Sqrt(vev2)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

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

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,dmZ2)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWLm2 = mW2_run 
MVWLm= Sqrt(MVWLm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q *CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

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

Call Pi1LoopVWLm(mW2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,              & 
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
& cplcVWLmVWLmVZRVZR3,kont,dmW2)

Call Pi1LoopVWLm(0._dp,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,            & 
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
& cplcVWLmVWLmVZRVZR3,kont,dmW2_0)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmW2 = dmW2 - dmW2_SM
dmW2_0 = dmW2_0 - dmW2_0_SM
If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2,sinW2_Q,rho,MAh,MFe,MFv,Mhh,MHpm,MHppmm,MVWLm,MVWRm,               & 
& MVZR,g2,gBL,gR,PhiW,UV,UC,UCC,ZER,UP,ZEL,vHd,vHu,vL,vR,YDL,YDR,YL1,YL2,ZH,ZZ,delta)

Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta_SM)

 delta=delta-delta_SM 
Else 
 delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
CosW2SinW2=pi*alphaQ/(sqrt2*mZ2*G_F*(1-delta_r_SM - delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at renormalisation scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
If ((0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
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

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplHppmmcHppmmVZVZ,              & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,dmZ2)

Call Pi1LoopVWLm(mW2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,              & 
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
& cplcVWLmVWLmVZRVZR3,kont,dmW2)

Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,kont,             & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

If (.not.OneLoopMatching) dmZ2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_0_SM = 0._dp 
mZ2_run=mZ2_MS-dmZ2+dmz2_SM
mW2_run=mw2_MS-dmW2+dmw2_SM
sinW2_Q=1._dp-mW2_run/MZ2_run
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM=sqrt(4._dp*mz2_run/(g1SM**2+g2SM**2))
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

vev2=4._dp*mz2_run/(g1SM**2+g2SM**2) -(0) 
vSM=sqrt(vev2) 
End If 
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
If (.not.MatchZWpoleMasses) Then 
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Else 
mW2=(1._dp-sinW2_Q)*MZ2 
mW=Sqrt(mW2)
End If 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM_Q = vSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM_MS,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM_MS
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_e_MS*(1._dp-alphaQ/(4._dp*Pi))
   mf_d_Q_SM=mf_d_MS*(1._dp-alpha3/(3._dp*pi)&
           &-43._dp*alpha3**2/(144._dp*Pi2) - alphaQ/(36._dp*Pi))
   mf_u_Q_SM(1:3)=mf_u_MS(1:3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
Else 
   mf_l_Q_SM=mf_e_MS
   mf_d_Q_SM=mf_d_MS
   mf_u_Q_SM=mf_u_MS
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(YQ1,YQ2,UP,ZDL,ZDR,ZH,g3,gBL,g2,gR,ZZ,UC,ZUL,             & 
& ZUR,PhiW,YL1,YL2,ZEL,ZER,YDR,YDL,UV,UCC,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,        & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL, & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,cplcUFeFeAhL,cplcUFeFeAhR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,           & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHppmm,MHppmm2,cplcUFeFeAhL,cplcUFeFeAhR,     & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR, & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplcUFecFeHppmmL,cplcUFecFeHppmmR,sigR_l,sigL_l,         & 
& sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,           & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,            & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,sigR_d_SM,            & 
& sigL_d_SM,sigSR_d_SM,sigSL_d_SM,sigR_u_SM,sigL_u_SM,sigSR_u_SM,sigSL_u_SM,             & 
& sigR_l_SM,sigL_l_SM,sigSR_l_SM,sigSL_l_SM,kont)

sigR_l(1:3,1:3) = sigR_l(1:3,1:3) - sigR_l_SM
sigL_l(1:3,1:3) = sigL_l(1:3,1:3) - sigL_l_SM
sigSR_l(1:3,1:3) = sigSR_l(1:3,1:3) - sigSR_l_SM
sigSL_l(1:3,1:3) = sigSL_l(1:3,1:3) - sigSL_l_SM
sigR_d(1:3,1:3) = sigR_d(1:3,1:3) - sigR_d_SM
sigL_d(1:3,1:3) = sigL_d(1:3,1:3) - sigL_d_SM
sigSR_d(1:3,1:3) = sigSR_d(1:3,1:3) - sigSR_d_SM
sigSL_d(1:3,1:3) = sigSL_d(1:3,1:3) - sigSL_d_SM
sigR_u(1:3,1:3) = sigR_u(1:3,1:3) - sigR_u_SM
sigL_u(1:3,1:3) = sigL_u(1:3,1:3) - sigL_u_SM
sigSR_u(1:3,1:3) = sigSR_u(1:3,1:3) - sigSR_u_SM
sigSL_u(1:3,1:3) = sigSL_u(1:3,1:3) - sigSL_u_SM


If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(YL1,YL2,vHd,vHu,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,3
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(YQ1,YQ2,vHd,vHu,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,3
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(YQ1,YQ2,vHd,vHu,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,3
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas3(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If
Call Yukawas3(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If 
Call Yukawas3(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(YL1,YL2,vHd,vHu,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(YQ1,YQ2,vHd,vHu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(YQ1,YQ2,vHd,vHu,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_Q=YeSM
Yd_Q=YdSM
Yu_Q=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)

sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
gBL = Sqrt(2._dp/3._dp)*gBL 
! ----------------------- 
 
Call ParametersToG129(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,               & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,gMZ)

rMS_SM = 1._dp 
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas3(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(3,3)
Complex(dp),Intent(out)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invMass2,Ytemp
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
If (ReSum) Then
kont=0
Call chop(MassMatrix)
invMass2=MassMatrix
Call gaussj(kont,invMass2,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invMass2)-Transpose(SigL)-Matmul(MassMatrix,Matmul(SigR,invMass2))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Ytemp=Matmul(invf,mass)
Else
Ytemp=mass+SigS+Matmul(Transpose(SigL),MassMatrix)+Matmul(MassMatrix,SigR)
End If
Y=sqrt2*Ytemp(1:3,1:3)/vev
Call chop(y)
End Subroutine Yukawas3

End Subroutine BoundaryBSM 
 
Subroutine Match_and_Run(delta0,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,             & 
& LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,mGut,kont,WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: g_SM(62) 
Real(dp) :: delta0,deltaG0, gA(129), gB(129)
Real(dp) :: gC(133),  gD(133) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(4), lambda_SM, lambda_MZ 
Real(dp) :: comp(4), tanbQ, vev2 
Complex(dp) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),cplcFdFdUhhL(3,3,4),& 
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

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp) ::mass_new(29),mass_old(29),diff_m(29)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2, mh_SM 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Match_and_Run'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+3) = MHpm
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+1) = MHppmm
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Lambda_MZ = 0.1_dp 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
Call BoundarySM(j,Lambda_MZ,delta0,g_SM,kont)

g_SM_save = g_SM 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
g_SM(1) = Sqrt(5._dp/3._dp)*g_SM(1) 
Call odeint(g_SM,62,tz,0._dp,delta0,dt,0._dp,rge62_SM,kont)

g_SM(1) = Sqrt(3._dp/5._dp)*g_SM(1) 
If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundaryBSM(j,g_SM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
mGUT = 1._dp 
Call GToParameters129(gB,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,            & 
& LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12)


 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vR = vRIN 
 vL = vLIN 
 gBL = gBLIN 
 gR = gRIN 
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
End if
 
 ! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
gBL = Sqrt(3._dp/2._dp)*gBL 
! ----------------------- 
 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,             & 
& MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,               & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MHpm
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+1) = MHppmm
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (j.lt.niter) Then 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp 
g_SM(1)=g_SM(1)*sqrt(5._dp/3._dp) 
g_SM(4)=Mhh2(1)/g_SM(62)**2 
Call odeint(g_SM,62,0._dp,tz,delta0,dt,0._dp,rge62_SM,kont) 
g_SM(1)=g_SM(1)/sqrt(5._dp/3._dp) 
Lambda_MZ=g_SM(4) 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,             & 
& MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,               & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

If (((Calculate_mh_within_SM).and.(Mhh(2).gt.300._dp)).OR.(Force_mh_within_SM))Then
Write(*,*) "Calculate Higgs mass within effective SM " 
Call Get_mh_pole_SM(g_SM,mudim,delta0,Mhh2(1),mh_SM) 
Mhh2(1) = mh_SM**2 
Mhh(1) = mh_SM 
End if
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Match_and_Run
 
Subroutine FirstGuess(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,               & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,               & 
& g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,               & 
& LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,kont)

Implicit None 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,               & 
& LAM4,LAM2,LAM3,muLR2,MU22,MU12

Complex(dp),Intent(out) :: YDR(3,3),YL1(3,3),YQ1(3,3),YQ2(3,3),YDL(3,3),YL2(3,3)

Real(dp),Intent(out) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(out) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Integer,Intent(inout)::kont
Integer :: i1, i2
Real(dp),Intent(inout) :: vHd,vHu,vR,vL

Real(dp)::vev,vevs(2),vev2,mgut,mudim,mudimNew,sigma(2),cosW,cosW2,sinW2 
Complex(dp):: YeSM(3,3), YdSM(3,3), YuSM(3,3) 
Real(dp) :: k_fac, g1SM, g2SM, g3SM, vSM 
Real(dp), Parameter :: oo2pi=1._dp/(2._dp*pi),oo6pi=oo2pi/3._dp 
Real(dp):: gA(129), gB(129), Scale_Save 
Logical::TwoLoopRGE_save, UseFixedScale_save 
Iname=Iname+1 
NameOfUnit(Iname)="FirstGuess" 
If (HighScaleModel.eq."LOW") UseFixedGUTScale = .true. 

mW2=mZ2*(0.5_dp+Sqrt(0.25_dp-Alpha_Mz*pi/(sqrt2*G_F*mZ2)))
mW=Sqrt(mW2) 
cosW2=mw2/mZ2 
sinW2=1._dp-cosW2 
cosW=Sqrt(cosW2) 
 
g1SM=Sqrt(3._dp/5._dp)*Sqrt(20._dp*pi*alpha_mZ/(3._dp*(1._dp-sinW2))) 
g2SM=Sqrt(4._dp*pi*alpha_mZ/(sinW2)) 
g3SM=Sqrt(4._dp*pi*alphas_mZ) 
vSM=2._dp*mW/g2SM 
YeSM=0._dp 
YdSM=0._dp 
YuSM=0._dp 
Do i1=1,3 
  YeSM(i1,i1)=sqrt2*mf_L_mZ(i1)/vSM 
  If (i1.Eq.3) Then! top and bottom are special: 
  ! TanBeta Aufsummierung fehlt bei Yd!! 
  YuSM(i1,i1)=sqrt2*mf_U(i1)/vSM& 
    &*(1._dp-oo3pi*alphas_mZ*(5._dp+3._dp*Log(mZ2/mf_u2(3)))) 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/(vSM * (1._dp + 0.015*tanb)) 
Else 
  YuSM(i1,i1)=sqrt2*mf_U_mZ(i1)/vSM 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/vSM 
End If  
End Do 
If (GenerationMixing) Then 
  If (YukawaScheme.Eq.1) Then 
    YuSM=Matmul(Transpose(CKM),YuSM) 
  Else 
    YdSM=Matmul(Conjg(CKM),YdSM) 
  End If 
End If 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vHd,vHu,vR,              & 
& vL,gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,.False.)


 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vR = vRIN 
 vL = vLIN 
 gBL = gBLIN 
 gR = gRIN 
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
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,               & 
& ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,               & 
& MU22,MU12,vHd,vHu,vR,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,               & 
& UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vHd,vHu,vR,vL,gBL,g2,gR,              & 
& g3,RHO2,RHO4,RHO1,RHO3,BETA1,ALP3,ALP1,LAM1,ALP2,BETA2,BETA3,LAM4,LAM2,LAM3,           & 
& YDR,YL1,YQ1,YQ2,YDL,YL2,muLR2,MU22,MU12,GenerationMixing,kont)

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
Iname=Iname-1 
End subroutine FirstGuess 
End Module Boundaries_LRSM_freegR 

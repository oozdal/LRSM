(* Special Abbreviations for FormCalc *) 
 
 
Sq[gBL] ^=gBL2; 
Sq[g2] ^=g22; 
Sq[gR] ^=gR2; 
Sq[g3] ^=g32; 
Conjugate[YDR[a___]] ^= YDRC[a]; 
Conjugate[YDRC[a___]] ^= YDR[a]; 
Sq[YDR[a___]] ^=YDR2[a]; 
Conjugate[YL1[a___]] ^= YL1C[a]; 
Conjugate[YL1C[a___]] ^= YL1[a]; 
Sq[YL1[a___]] ^=YL12[a]; 
Conjugate[YQ1[a___]] ^= YQ1C[a]; 
Conjugate[YQ1C[a___]] ^= YQ1[a]; 
Sq[YQ1[a___]] ^=YQ12[a]; 
Conjugate[YQ2[a___]] ^= YQ2C[a]; 
Conjugate[YQ2C[a___]] ^= YQ2[a]; 
Sq[YQ2[a___]] ^=YQ22[a]; 
Conjugate[YDL[a___]] ^= YDLC[a]; 
Conjugate[YDLC[a___]] ^= YDL[a]; 
Sq[YDL[a___]] ^=YDL2[a]; 
Conjugate[YL2[a___]] ^= YL2C[a]; 
Conjugate[YL2C[a___]] ^= YL2[a]; 
Sq[YL2[a___]] ^=YL22[a]; 
Sq[muLR2] ^=muLR22; 
Sq[MU22] ^=MU222; 
Sq[MU12] ^=MU122; 
Sq[RHO2] ^=RHO22; 
Sq[RHO4] ^=RHO42; 
Sq[RHO1] ^=RHO12; 
Sq[RHO3] ^=RHO32; 
Sq[BETA1] ^=BETA12; 
Sq[ALP3] ^=ALP32; 
Sq[ALP1] ^=ALP12; 
Sq[LAM1] ^=LAM12; 
Sq[ALP2] ^=ALP22; 
Sq[BETA2] ^=BETA22; 
Sq[BETA3] ^=BETA32; 
Sq[LAM4] ^=LAM42; 
Sq[LAM2] ^=LAM22; 
Sq[LAM3] ^=LAM32; 
Sq[vHd] ^=vHd2; 
Sq[vHu] ^=vHu2; 
Sq[vR] ^=vR2; 
Sq[vL] ^=vL2; 
Conjugate[ZZ[a___]] ^= ZZC[a]; 
Conjugate[ZZC[a___]] ^= ZZ[a]; 
Sq[ZZ[a___]] ^=ZZ2[a]; 
Conjugate[ZW[a___]] ^= ZWC[a]; 
Conjugate[ZWC[a___]] ^= ZW[a]; 
Sq[ZW[a___]] ^=ZW2[a]; 
Sq[ZH[a___]] ^=ZH2[a]; 
Sq[UP[a___]] ^=UP2[a]; 
Sq[UC[a___]] ^=UC2[a]; 
Sq[UCC[a___]] ^=UCC2[a]; 
Conjugate[ZDL[a___]] ^= ZDLC[a]; 
Conjugate[ZDLC[a___]] ^= ZDL[a]; 
Sq[ZDL[a___]] ^=ZDL2[a]; 
Conjugate[ZDR[a___]] ^= ZDRC[a]; 
Conjugate[ZDRC[a___]] ^= ZDR[a]; 
Sq[ZDR[a___]] ^=ZDR2[a]; 
Conjugate[ZUL[a___]] ^= ZULC[a]; 
Conjugate[ZULC[a___]] ^= ZUL[a]; 
Sq[ZUL[a___]] ^=ZUL2[a]; 
Conjugate[ZUR[a___]] ^= ZURC[a]; 
Conjugate[ZURC[a___]] ^= ZUR[a]; 
Sq[ZUR[a___]] ^=ZUR2[a]; 
Conjugate[ZEL[a___]] ^= ZELC[a]; 
Conjugate[ZELC[a___]] ^= ZEL[a]; 
Sq[ZEL[a___]] ^=ZEL2[a]; 
Conjugate[ZER[a___]] ^= ZERC[a]; 
Conjugate[ZERC[a___]] ^= ZER[a]; 
Sq[ZER[a___]] ^=ZER2[a]; 
Conjugate[UV[a___]] ^= UVC[a]; 
Conjugate[UVC[a___]] ^= UV[a]; 
Sq[UV[a___]] ^=UV2[a]; 
Sq[el] ^=el2; 
Sq[TW] ^=TW2; 
Sq[PhiW] ^=PhiW2; 
Sq[aEWinv] ^=aEWinv2; 
Sq[aS] ^=aS2; 
Sq[Mvwlm] ^=Mvwlm2; 
Sq[Gf] ^=Gf2; 
Sq[Masshh[a___]] =Masshh2[a]; 
Sq[MassAh[a___]] =MassAh2[a]; 
Sq[MassHpm[a___]] =MassHpm2[a]; 
Sq[MassHppmm[a___]] =MassHppmm2[a]; 
Sq[MassFd[a___]] =MassFd2[a]; 
Sq[MassFu[a___]] =MassFu2[a]; 
Sq[MassFe[a___]] =MassFe2[a]; 
Sq[MassFv[a___]] =MassFv2[a]; 
Sq[MassVZ] =MassVZ2; 
Sq[MassVZR] =MassVZR2; 
Sq[MassVWLm] =MassVWLm2; 
Sq[MassVWRm] =MassVWRm2; 
Cos[ThetaW] ^= CW; 
Sin[ThetaW] ^= SW; 
A[x_]:=ToExpression["A"<>ToString[InputForm[x]]]; 
 
 
 (* Dependences *) 
 
Dependences = 
 {ZW[index1_Integer, index2_Integer] :> {{Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], -(Sin[PhiW]/Sqrt[2]), -(Sin[PhiW]/Sqrt[2])}, {((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Sin[PhiW])/Sqrt[2]}, {Sin[PhiW]/Sqrt[2], Sin[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2]}, {((-I)*Sin[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2]}}[[index1,index2]]}
 
DependencesOptional = 
 {g2 -> e*Csc[ThetaW]}
 
DependencesNum = 
 {e -> 2*Sqrt[aEWinv^(-1)]*Sqrt[Pi], g2 -> e*Csc[ThetaW], g3 -> 2*Sqrt[AlphaS]*Sqrt[Pi], vL -> 2001, vR -> 2000, Mass[VWLm] -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]]}
 
 
(* Masses *) 
 
MassesSARAH = { 
 MassVG[generation_] ->MassGiven[VG], 
MassgG[generation_] ->MassGiven[gG], 
MassVP[generation_] ->MassGiven[VP], 
MassVZ[generation_] ->MassGiven[VZ], 
MassVZR[generation_] ->MassRead[VZR], 
MassgP[generation_] ->MassGiven[gP], 
MassgZ[generation_] ->MassGiven[gZ], 
MassgZR[generation_] ->MassGiven[gZR], 
MassVWRm[generation_] ->MassRead[VWRm], 
MassgWLm[generation_] ->MassGiven[gWLm], 
MassgWLmC[generation_] ->MassGiven[gWLmC], 
MassgWRm[generation_] ->MassGiven[gWRm], 
MassgWRmC[generation_] ->MassGiven[gWRmC], 
Masshh[gen_][generation_] ->MassRead[hh[gen]], 
MassAh[1][generation_] ->MassGiven[Ah[1]], 
MassAh[2][generation_] ->MassGiven[Ah[2]], 
MassAh[3][generation_] ->MassRead[Ah[3]], 
MassAh[4][generation_] ->MassRead[Ah[4]], 
MassHpm[1][generation_] ->MassGiven[Hpm[1]], 
MassHpm[2][generation_] ->MassGiven[Hpm[2]], 
MassHpm[3][generation_] ->MassRead[Hpm[3]], 
MassHpm[4][generation_] ->MassRead[Hpm[4]], 
MassHppmm[gen_][generation_] ->MassRead[Hppmm[gen]], 
MassFd[1][generation_] ->MassGiven[Fd[1]], 
MassFd[2][generation_] ->MassGiven[Fd[2]], 
MassFd[3][generation_] ->MassGiven[Fd[3]], 
MassFd[1][generation_] ->MassGiven[Fd[1]], 
MassFd[2][generation_] ->MassGiven[Fd[2]], 
MassFd[3][generation_] ->MassGiven[Fd[3]], 
MassFu[1][generation_] ->MassGiven[Fu[1]], 
MassFu[2][generation_] ->MassGiven[Fu[2]], 
MassFu[3][generation_] ->MassGiven[Fu[3]], 
MassFu[1][generation_] ->MassGiven[Fu[1]], 
MassFu[2][generation_] ->MassGiven[Fu[2]], 
MassFu[3][generation_] ->MassGiven[Fu[3]], 
MassFe[1][generation_] ->MassGiven[Fe[1]], 
MassFe[2][generation_] ->MassGiven[Fe[2]], 
MassFe[3][generation_] ->MassGiven[Fe[3]], 
MassFe[1][generation_] ->MassGiven[Fe[1]], 
MassFe[2][generation_] ->MassGiven[Fe[2]], 
MassFe[3][generation_] ->MassGiven[Fe[3]], 
MassFv[1][generation_] ->MassRead[Fv[1]], 
MassFv[2][generation_] ->MassRead[Fv[2]], 
MassFv[3][generation_] ->MassRead[Fv[3]], 
MassFv[4][generation_] ->MassRead[Fv[4]], 
MassFv[5][generation_] ->MassRead[Fv[5]], 
MassFv[6][generation_] ->MassRead[Fv[6]]
}; 
 
 
(* NumericalValues *) 
 
NumericalValues = 
 {WidthGiven[VB] -> 0, MassGiven[VB] -> 0, WidthGiven[gB] -> 0, MassGiven[gB] -> 0, WidthGiven[VWL] -> 0, MassGiven[VWL] -> 0, WidthGiven[gWL] -> 0, MassGiven[gWL] -> 0, WidthGiven[VG] -> 0, MassGiven[VG] -> 0, WidthGiven[gG] -> 0, MassGiven[gG] -> 0, WidthGiven[H0] -> 0, WidthGiven[Hm] -> {0}, MassGiven[Hm] -> {0}, WidthGiven[Hp] -> {0}, MassGiven[Hp] -> {0}, WidthGiven[deltaR0] -> {0}, WidthGiven[deltaRp] -> {0}, WidthGiven[deltaRpp] -> {0}, MassGiven[deltaRpp] -> {0}, WidthGiven[deltaL0] -> {0}, WidthGiven[deltaLp] -> {0}, WidthGiven[deltaLpp] -> {0}, MassGiven[deltaLpp] -> {0}, WidthGiven[VG] -> 0, MassGiven[VG] -> 0, WidthGiven[gG] -> 0, MassGiven[gG] -> 0, WidthGiven[VP] -> 0, MassGiven[VP] -> 0, WidthGiven[VZ] -> 2.4952, MassGiven[VZ] -> 91.1876, WidthGiven[gP] -> 0, MassGiven[gP] -> 0, MassGiven[gZ] -> Mass[VZ], WidthGiven[gZR] -> 0, MassGiven[gZR] -> Mass[VZR], WidthGiven[VWLm] -> 2.141, MassGiven[gWLm] -> Mass[VWLm], MassGiven[gWLmC] -> Mass[VWLm], WidthGiven[gWRm] -> 0, MassGiven[gWRm] -> Mass[VWRm], WidthGiven[gWRmC] -> 0, MassGiven[gWRmC] -> Mass[VWRm], WidthGiven[Ah[1]] -> 0, WidthGiven[Ah[2]] -> 0, MassGiven[Ah[1]] -> 0, MassGiven[Ah[2]] -> 0, WidthGiven[Hpm[1]] -> 0, WidthGiven[Hpm[2]] -> 0, MassGiven[Hpm[1]] -> 0, MassGiven[Hpm[2]] -> 0, WidthGiven[Fd[1]] -> 0, WidthGiven[Fd[2]] -> 0, WidthGiven[Fd[3]] -> 0, MassGiven[Fd[1]] -> 0.0035, MassGiven[Fd[2]] -> 0.104, MassGiven[Fd[3]] -> 4.2, WidthGiven[Fd[1]] -> 0, WidthGiven[Fd[2]] -> 0, WidthGiven[Fd[3]] -> 0, MassGiven[Fd[1]] -> 0.0035, MassGiven[Fd[2]] -> 0.104, MassGiven[Fd[3]] -> 4.2, WidthGiven[Fu[1]] -> 0, WidthGiven[Fu[2]] -> 0, WidthGiven[Fu[3]] -> 1.51, MassGiven[Fu[1]] -> 0.0015, MassGiven[Fu[2]] -> 1.27, MassGiven[Fu[3]] -> 171.2, WidthGiven[Fu[1]] -> 0, WidthGiven[Fu[2]] -> 0, WidthGiven[Fu[3]] -> 1.51, MassGiven[Fu[1]] -> 0.0015, MassGiven[Fu[2]] -> 1.27, MassGiven[Fu[3]] -> 171.2, WidthGiven[Fe[1]] -> 0, WidthGiven[Fe[2]] -> 0, WidthGiven[Fe[3]] -> 0, MassGiven[Fe[1]] -> 0.000511, MassGiven[Fe[2]] -> 0.105, MassGiven[Fe[3]] -> 1.776, WidthGiven[Fe[1]] -> 0, WidthGiven[Fe[2]] -> 0, WidthGiven[Fe[3]] -> 0, MassGiven[Fe[1]] -> 0.000511, MassGiven[Fe[2]] -> 0.105, MassGiven[Fe[3]] -> 1.776, aEWinv -> 137.035999679, AlphaS -> 0.119, Gf -> 0.0000116639}
 
 

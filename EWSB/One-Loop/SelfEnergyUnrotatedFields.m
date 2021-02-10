{(-3*((2*p^2*rMS)/3 + 2*A0[0] + 4*p^2*B0[p^2, 0, 0] + 10*B00[p^2, 0, 0])*
    conj[Cp[VG, VG, VG]]*Cp[VG, VG, VG])/2 + 3*B00[p^2, Mass2[gG], Mass2[gG]]*
   conj[Cp[VG, bar[gG], gG]]*Cp[VG, bar[gG], gG] + 
  sum[gI1, 1, 3, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*
       Mass[Fd[{gI1}]]*Mass[Fd[{gI2}]]*
       Re[conj[Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[VG, bar[Fd[{gI1}]], Fd[{gI2}]][PR])]]/2 + 
  sum[gI1, 1, 3, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*
       Mass[Fu[{gI1}]]*Mass[Fu[{gI2}]]*
       Re[conj[Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*
       (conj[Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PL] + 
        conj[Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PR]]*
         Cp[VG, bar[Fu[{gI1}]], Fu[{gI2}]][PR])]]/2 - 
  (A0[0]*(4*Cp[VG, VG, VG, VG][1] + Cp[VG, VG, VG, VG][2] + 
     Cp[VG, VG, VG, VG][3]))/2, B00[p^2, Mass2[gWLm], Mass2[gWLm]]*
   conj[Cp[VP, bar[gWLm], gWLm]]*Cp[VP, bar[gWLm], gWLm] + 
  B00[p^2, Mass2[gWLmC], Mass2[gWLmC]]*conj[Cp[VP, bar[gWLmC], gWLmC]]*
   Cp[VP, bar[gWLmC], gWLmC] + 2*B00[p^2, Mass2[gWLm], Mass2[gWRm]]*
   conj[Cp[VP, bar[gWRm], gWLm]]*Cp[VP, bar[gWRm], gWLm] + 
  B00[p^2, Mass2[gWRm], Mass2[gWRm]]*conj[Cp[VP, bar[gWRm], gWRm]]*
   Cp[VP, bar[gWRm], gWRm] + 2*B00[p^2, Mass2[gWLmC], Mass2[gWRmC]]*
   conj[Cp[VP, bar[gWRmC], gWLmC]]*Cp[VP, bar[gWRmC], gWLmC] + 
  B00[p^2, Mass2[gWRmC], Mass2[gWRmC]]*conj[Cp[VP, bar[gWRmC], gWRmC]]*
   Cp[VP, bar[gWRmC], gWRmC] - conj[Cp[VP, conj[VWLm], VWLm]]*
   Cp[VP, conj[VWLm], VWLm]*(2*A0[Mass2[VWLm]] + 
    10*B00[p^2, Mass2[VWLm], Mass2[VWLm]] - 2*rMS*(-p^2/3 + 2*Mass2[VWLm]) + 
    B0[p^2, Mass2[VWLm], Mass2[VWLm]]*(4*p^2 + 2*Mass2[VWLm])) - 
  2*conj[Cp[VP, conj[VWRm], VWLm]]*Cp[VP, conj[VWRm], VWLm]*
   (A0[Mass2[VWLm]] + A0[Mass2[VWRm]] + 
    10*B00[p^2, Mass2[VWRm], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VWRm]) + 
    B0[p^2, Mass2[VWRm], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VWRm])) - 
  conj[Cp[VP, conj[VWRm], VWRm]]*Cp[VP, conj[VWRm], VWRm]*
   (2*A0[Mass2[VWRm]] + 10*B00[p^2, Mass2[VWRm], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + 2*Mass2[VWRm]) + B0[p^2, Mass2[VWRm], Mass2[VWRm]]*
     (4*p^2 + 2*Mass2[VWRm])) + sum[gI1, 1, 2, A0[Mass2[Hppmm[{gI1}]]]*
    Cp[VP, VP, conj[Hppmm[{gI1}]], Hppmm[{gI1}]]] - 
  4*sum[gI1, 1, 2, sum[gI2, 1, 2, B00[p^2, Mass2[Hppmm[{gI1}]], 
       Mass2[Hppmm[{gI2}]]]*conj[Cp[VP, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]*
      Cp[VP, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*Mass[Fd[{gI1}]]*
       Mass[Fd[{gI2}]]*Re[conj[Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[VP, bar[Fd[{gI1}]], Fd[{gI2}]][PR])]] + 
  sum[gI1, 1, 3, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      Mass[Fe[{gI1}]]*Mass[Fe[{gI2}]]*
      Re[conj[Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PR]] + 
     H0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      (conj[Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PL] + 
       conj[Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PR]]*
        Cp[VP, bar[Fe[{gI1}]], Fe[{gI2}]][PR])]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*Mass[Fu[{gI1}]]*
       Mass[Fu[{gI2}]]*Re[conj[Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*
       (conj[Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PL] + 
        conj[Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PR]]*
         Cp[VP, bar[Fu[{gI1}]], Fu[{gI2}]][PR])]] + 
  sum[gI1, 1, 4, A0[Mass2[Ah[{gI1}]]]*Cp[VP, VP, Ah[{gI1}], Ah[{gI1}]]]/2 + 
  sum[gI1, 1, 4, A0[Mass2[Hpm[{gI1}]]]*Cp[VP, VP, conj[Hpm[{gI1}]], 
     Hpm[{gI1}]]] + sum[gI1, 1, 4, A0[Mass2[hh[{gI1}]]]*
     Cp[VP, VP, hh[{gI1}], hh[{gI1}]]]/2 - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Hpm[{gI1}]], 
       Mass2[Hpm[{gI2}]]]*conj[Cp[VP, conj[Hpm[{gI1}]], Hpm[{gI2}]]]*
      Cp[VP, conj[Hpm[{gI1}]], Hpm[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Ah[{gI2}]], 
       Mass2[hh[{gI1}]]]*conj[Cp[VP, hh[{gI1}], Ah[{gI2}]]]*
      Cp[VP, hh[{gI1}], Ah[{gI2}]]]] + 
  sum[gI1, 1, 6, sum[gI2, 1, 6, 4*B0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       Mass[Fv[{gI1}]]*Mass[Fv[{gI2}]]*
       Re[conj[Cp[VP, Fv[{gI1}], Fv[{gI2}]][PL]]*Cp[VP, Fv[{gI1}], Fv[{gI2}]][
          PR]] + H0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       (conj[Cp[VP, Fv[{gI1}], Fv[{gI2}]][PL]]*Cp[VP, Fv[{gI1}], Fv[{gI2}]][
          PL] + conj[Cp[VP, Fv[{gI1}], Fv[{gI2}]][PR]]*
         Cp[VP, Fv[{gI1}], Fv[{gI2}]][PR])]]/2 + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZ], Mass2[hh[{gI2}]]]*
    conj[Cp[VP, VZ, hh[{gI2}]]]*Cp[VP, VZ, hh[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZR], Mass2[hh[{gI2}]]]*
    conj[Cp[VP, VZR, hh[{gI2}]]]*Cp[VP, VZR, hh[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VP, conj[VWLm], Hpm[{gI2}]]]*Cp[VP, conj[VWLm], Hpm[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VP, conj[VWRm], Hpm[{gI2}]]]*Cp[VP, conj[VWRm], Hpm[{gI2}]]] + 
  2*rMS*Mass2[VWLm]*Cp[VP, VP, conj[VWLm], VWLm][1] - 
  A0[Mass2[VWLm]]*(4*Cp[VP, VP, conj[VWLm], VWLm][1] + 
    Cp[VP, VP, conj[VWLm], VWLm][2] + Cp[VP, VP, conj[VWLm], VWLm][3]) + 
  2*rMS*Mass2[VWRm]*Cp[VP, VP, conj[VWRm], VWRm][1] - 
  A0[Mass2[VWRm]]*(4*Cp[VP, VP, conj[VWRm], VWRm][1] + 
    Cp[VP, VP, conj[VWRm], VWRm][2] + Cp[VP, VP, conj[VWRm], VWRm][3]), 
 B00[p^2, Mass2[gWLm], Mass2[gWLm]]*conj[Cp[VZ, bar[gWLm], gWLm]]*
   Cp[VZ, bar[gWLm], gWLm] + B00[p^2, Mass2[gWLmC], Mass2[gWLmC]]*
   conj[Cp[VZ, bar[gWLmC], gWLmC]]*Cp[VZ, bar[gWLmC], gWLmC] + 
  2*B00[p^2, Mass2[gWLm], Mass2[gWRm]]*conj[Cp[VZ, bar[gWRm], gWLm]]*
   Cp[VZ, bar[gWRm], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gWRm]]*
   conj[Cp[VZ, bar[gWRm], gWRm]]*Cp[VZ, bar[gWRm], gWRm] + 
  2*B00[p^2, Mass2[gWLmC], Mass2[gWRmC]]*conj[Cp[VZ, bar[gWRmC], gWLmC]]*
   Cp[VZ, bar[gWRmC], gWLmC] + B00[p^2, Mass2[gWRmC], Mass2[gWRmC]]*
   conj[Cp[VZ, bar[gWRmC], gWRmC]]*Cp[VZ, bar[gWRmC], gWRmC] - 
  conj[Cp[VZ, conj[VWLm], VWLm]]*Cp[VZ, conj[VWLm], VWLm]*
   (2*A0[Mass2[VWLm]] + 10*B00[p^2, Mass2[VWLm], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + 2*Mass2[VWLm]) + B0[p^2, Mass2[VWLm], Mass2[VWLm]]*
     (4*p^2 + 2*Mass2[VWLm])) - 2*conj[Cp[VZ, conj[VWRm], VWLm]]*
   Cp[VZ, conj[VWRm], VWLm]*(A0[Mass2[VWLm]] + A0[Mass2[VWRm]] + 
    10*B00[p^2, Mass2[VWRm], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VWRm]) + 
    B0[p^2, Mass2[VWRm], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VWRm])) - 
  conj[Cp[VZ, conj[VWRm], VWRm]]*Cp[VZ, conj[VWRm], VWRm]*
   (2*A0[Mass2[VWRm]] + 10*B00[p^2, Mass2[VWRm], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + 2*Mass2[VWRm]) + B0[p^2, Mass2[VWRm], Mass2[VWRm]]*
     (4*p^2 + 2*Mass2[VWRm])) + sum[gI1, 1, 2, A0[Mass2[Hppmm[{gI1}]]]*
    Cp[VZ, VZ, conj[Hppmm[{gI1}]], Hppmm[{gI1}]]] - 
  4*sum[gI1, 1, 2, sum[gI2, 1, 2, B00[p^2, Mass2[Hppmm[{gI1}]], 
       Mass2[Hppmm[{gI2}]]]*conj[Cp[VZ, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]*
      Cp[VZ, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*Mass[Fd[{gI1}]]*
       Mass[Fd[{gI2}]]*Re[conj[Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[VZ, bar[Fd[{gI1}]], Fd[{gI2}]][PR])]] + 
  sum[gI1, 1, 3, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      Mass[Fe[{gI1}]]*Mass[Fe[{gI2}]]*
      Re[conj[Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PR]] + 
     H0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      (conj[Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PL] + 
       conj[Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PR]]*
        Cp[VZ, bar[Fe[{gI1}]], Fe[{gI2}]][PR])]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*Mass[Fu[{gI1}]]*
       Mass[Fu[{gI2}]]*Re[conj[Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*
       (conj[Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PL] + 
        conj[Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PR]]*
         Cp[VZ, bar[Fu[{gI1}]], Fu[{gI2}]][PR])]] + 
  sum[gI1, 1, 4, A0[Mass2[Ah[{gI1}]]]*Cp[VZ, VZ, Ah[{gI1}], Ah[{gI1}]]]/2 + 
  sum[gI1, 1, 4, A0[Mass2[Hpm[{gI1}]]]*Cp[VZ, VZ, conj[Hpm[{gI1}]], 
     Hpm[{gI1}]]] + sum[gI1, 1, 4, A0[Mass2[hh[{gI1}]]]*
     Cp[VZ, VZ, hh[{gI1}], hh[{gI1}]]]/2 - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Hpm[{gI1}]], 
       Mass2[Hpm[{gI2}]]]*conj[Cp[VZ, conj[Hpm[{gI1}]], Hpm[{gI2}]]]*
      Cp[VZ, conj[Hpm[{gI1}]], Hpm[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Ah[{gI2}]], 
       Mass2[hh[{gI1}]]]*conj[Cp[VZ, hh[{gI1}], Ah[{gI2}]]]*
      Cp[VZ, hh[{gI1}], Ah[{gI2}]]]] + 
  sum[gI1, 1, 6, sum[gI2, 1, 6, 4*B0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       Mass[Fv[{gI1}]]*Mass[Fv[{gI2}]]*
       Re[conj[Cp[VZ, Fv[{gI1}], Fv[{gI2}]][PL]]*Cp[VZ, Fv[{gI1}], Fv[{gI2}]][
          PR]] + H0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       (conj[Cp[VZ, Fv[{gI1}], Fv[{gI2}]][PL]]*Cp[VZ, Fv[{gI1}], Fv[{gI2}]][
          PL] + conj[Cp[VZ, Fv[{gI1}], Fv[{gI2}]][PR]]*
         Cp[VZ, Fv[{gI1}], Fv[{gI2}]][PR])]]/2 + 
  sum[gI2, 1, 4, B0[p^2, 0, Mass2[hh[{gI2}]]]*conj[Cp[VZ, VP, hh[{gI2}]]]*
    Cp[VZ, VP, hh[{gI2}]]] + sum[gI2, 1, 4, 
   B0[p^2, Mass2[VZ], Mass2[hh[{gI2}]]]*conj[Cp[VZ, VZ, hh[{gI2}]]]*
    Cp[VZ, VZ, hh[{gI2}]]] + sum[gI2, 1, 4, 
   B0[p^2, Mass2[VZR], Mass2[hh[{gI2}]]]*conj[Cp[VZ, VZR, hh[{gI2}]]]*
    Cp[VZ, VZR, hh[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VZ, conj[VWLm], Hpm[{gI2}]]]*Cp[VZ, conj[VWLm], Hpm[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VZ, conj[VWRm], Hpm[{gI2}]]]*Cp[VZ, conj[VWRm], Hpm[{gI2}]]] + 
  2*rMS*Mass2[VWLm]*Cp[VZ, VZ, conj[VWLm], VWLm][1] - 
  A0[Mass2[VWLm]]*(4*Cp[VZ, VZ, conj[VWLm], VWLm][1] + 
    Cp[VZ, VZ, conj[VWLm], VWLm][2] + Cp[VZ, VZ, conj[VWLm], VWLm][3]) + 
  2*rMS*Mass2[VWRm]*Cp[VZ, VZ, conj[VWRm], VWRm][1] - 
  A0[Mass2[VWRm]]*(4*Cp[VZ, VZ, conj[VWRm], VWRm][1] + 
    Cp[VZ, VZ, conj[VWRm], VWRm][2] + Cp[VZ, VZ, conj[VWRm], VWRm][3]), 
 B00[p^2, Mass2[gWLm], Mass2[gWLm]]*conj[Cp[VZR, bar[gWLm], gWLm]]*
   Cp[VZR, bar[gWLm], gWLm] + B00[p^2, Mass2[gWLmC], Mass2[gWLmC]]*
   conj[Cp[VZR, bar[gWLmC], gWLmC]]*Cp[VZR, bar[gWLmC], gWLmC] + 
  2*B00[p^2, Mass2[gWLm], Mass2[gWRm]]*conj[Cp[VZR, bar[gWRm], gWLm]]*
   Cp[VZR, bar[gWRm], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gWRm]]*
   conj[Cp[VZR, bar[gWRm], gWRm]]*Cp[VZR, bar[gWRm], gWRm] + 
  2*B00[p^2, Mass2[gWLmC], Mass2[gWRmC]]*conj[Cp[VZR, bar[gWRmC], gWLmC]]*
   Cp[VZR, bar[gWRmC], gWLmC] + B00[p^2, Mass2[gWRmC], Mass2[gWRmC]]*
   conj[Cp[VZR, bar[gWRmC], gWRmC]]*Cp[VZR, bar[gWRmC], gWRmC] - 
  conj[Cp[VZR, conj[VWLm], VWLm]]*Cp[VZR, conj[VWLm], VWLm]*
   (2*A0[Mass2[VWLm]] + 10*B00[p^2, Mass2[VWLm], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + 2*Mass2[VWLm]) + B0[p^2, Mass2[VWLm], Mass2[VWLm]]*
     (4*p^2 + 2*Mass2[VWLm])) - 2*conj[Cp[VZR, conj[VWRm], VWLm]]*
   Cp[VZR, conj[VWRm], VWLm]*(A0[Mass2[VWLm]] + A0[Mass2[VWRm]] + 
    10*B00[p^2, Mass2[VWRm], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VWRm]) + 
    B0[p^2, Mass2[VWRm], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VWRm])) - 
  conj[Cp[VZR, conj[VWRm], VWRm]]*Cp[VZR, conj[VWRm], VWRm]*
   (2*A0[Mass2[VWRm]] + 10*B00[p^2, Mass2[VWRm], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + 2*Mass2[VWRm]) + B0[p^2, Mass2[VWRm], Mass2[VWRm]]*
     (4*p^2 + 2*Mass2[VWRm])) + sum[gI1, 1, 2, A0[Mass2[Hppmm[{gI1}]]]*
    Cp[VZR, VZR, conj[Hppmm[{gI1}]], Hppmm[{gI1}]]] - 
  4*sum[gI1, 1, 2, sum[gI2, 1, 2, B00[p^2, Mass2[Hppmm[{gI1}]], 
       Mass2[Hppmm[{gI2}]]]*conj[Cp[VZR, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]*
      Cp[VZR, conj[Hppmm[{gI1}]], Hppmm[{gI2}]]]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*Mass[Fd[{gI1}]]*
       Mass[Fd[{gI2}]]*Re[conj[Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fd[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[VZR, bar[Fd[{gI1}]], Fd[{gI2}]][PR])]] + 
  sum[gI1, 1, 3, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      Mass[Fe[{gI1}]]*Mass[Fe[{gI2}]]*
      Re[conj[Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PR]] + 
     H0[p^2, Mass2[Fe[{gI1}]], Mass2[Fe[{gI2}]]]*
      (conj[Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PL]]*
        Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PL] + 
       conj[Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PR]]*
        Cp[VZR, bar[Fe[{gI1}]], Fe[{gI2}]][PR])]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*Mass[Fu[{gI1}]]*
       Mass[Fu[{gI2}]]*Re[conj[Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fu[{gI2}]]]*
       (conj[Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PL]]*
         Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PL] + 
        conj[Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PR]]*
         Cp[VZR, bar[Fu[{gI1}]], Fu[{gI2}]][PR])]] + 
  sum[gI1, 1, 4, A0[Mass2[Ah[{gI1}]]]*Cp[VZR, VZR, Ah[{gI1}], Ah[{gI1}]]]/2 + 
  sum[gI1, 1, 4, A0[Mass2[Hpm[{gI1}]]]*Cp[VZR, VZR, conj[Hpm[{gI1}]], 
     Hpm[{gI1}]]] + sum[gI1, 1, 4, A0[Mass2[hh[{gI1}]]]*
     Cp[VZR, VZR, hh[{gI1}], hh[{gI1}]]]/2 - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Hpm[{gI1}]], 
       Mass2[Hpm[{gI2}]]]*conj[Cp[VZR, conj[Hpm[{gI1}]], Hpm[{gI2}]]]*
      Cp[VZR, conj[Hpm[{gI1}]], Hpm[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Ah[{gI2}]], 
       Mass2[hh[{gI1}]]]*conj[Cp[VZR, hh[{gI1}], Ah[{gI2}]]]*
      Cp[VZR, hh[{gI1}], Ah[{gI2}]]]] + 
  sum[gI1, 1, 6, sum[gI2, 1, 6, 4*B0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       Mass[Fv[{gI1}]]*Mass[Fv[{gI2}]]*
       Re[conj[Cp[VZR, Fv[{gI1}], Fv[{gI2}]][PL]]*
         Cp[VZR, Fv[{gI1}], Fv[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fv[{gI1}]], Mass2[Fv[{gI2}]]]*
       (conj[Cp[VZR, Fv[{gI1}], Fv[{gI2}]][PL]]*Cp[VZR, Fv[{gI1}], Fv[{gI2}]][
          PL] + conj[Cp[VZR, Fv[{gI1}], Fv[{gI2}]][PR]]*
         Cp[VZR, Fv[{gI1}], Fv[{gI2}]][PR])]]/2 + 
  sum[gI2, 1, 4, B0[p^2, 0, Mass2[hh[{gI2}]]]*conj[Cp[VZR, VP, hh[{gI2}]]]*
    Cp[VZR, VP, hh[{gI2}]]] + sum[gI2, 1, 4, 
   B0[p^2, Mass2[VZ], Mass2[hh[{gI2}]]]*conj[Cp[VZR, VZ, hh[{gI2}]]]*
    Cp[VZR, VZ, hh[{gI2}]]] + sum[gI2, 1, 4, 
   B0[p^2, Mass2[VZR], Mass2[hh[{gI2}]]]*conj[Cp[VZR, VZR, hh[{gI2}]]]*
    Cp[VZR, VZR, hh[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VZR, conj[VWLm], Hpm[{gI2}]]]*Cp[VZR, conj[VWLm], Hpm[{gI2}]]] + 
  2*sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[Hpm[{gI2}]]]*
     conj[Cp[VZR, conj[VWRm], Hpm[{gI2}]]]*Cp[VZR, conj[VWRm], Hpm[{gI2}]]] + 
  2*rMS*Mass2[VWLm]*Cp[VZR, VZR, conj[VWLm], VWLm][1] - 
  A0[Mass2[VWLm]]*(4*Cp[VZR, VZR, conj[VWLm], VWLm][1] + 
    Cp[VZR, VZR, conj[VWLm], VWLm][2] + Cp[VZR, VZR, conj[VWLm], VWLm][3]) + 
  2*rMS*Mass2[VWRm]*Cp[VZR, VZR, conj[VWRm], VWRm][1] - 
  A0[Mass2[VWRm]]*(4*Cp[VZR, VZR, conj[VWRm], VWRm][1] + 
    Cp[VZR, VZR, conj[VWRm], VWRm][2] + Cp[VZR, VZR, conj[VWRm], VWRm][3]), 
 B00[p^2, Mass2[gWLm], Mass2[gP]]*conj[Cp[conj[VWLm], bar[gP], gWLm]]*
   Cp[conj[VWLm], bar[gP], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gP]]*
   conj[Cp[conj[VWLm], bar[gP], gWRm]]*Cp[conj[VWLm], bar[gP], gWRm] + 
  B00[p^2, Mass2[gP], Mass2[gWLmC]]*conj[Cp[conj[VWLm], bar[gWLmC], gP]]*
   Cp[conj[VWLm], bar[gWLmC], gP] + B00[p^2, Mass2[gZ], Mass2[gWLmC]]*
   conj[Cp[conj[VWLm], bar[gWLmC], gZ]]*Cp[conj[VWLm], bar[gWLmC], gZ] + 
  B00[p^2, Mass2[gZR], Mass2[gWLmC]]*conj[Cp[conj[VWLm], bar[gWLmC], gZR]]*
   Cp[conj[VWLm], bar[gWLmC], gZR] + B00[p^2, Mass2[gP], Mass2[gWRmC]]*
   conj[Cp[conj[VWLm], bar[gWRmC], gP]]*Cp[conj[VWLm], bar[gWRmC], gP] + 
  B00[p^2, Mass2[gZ], Mass2[gWRmC]]*conj[Cp[conj[VWLm], bar[gWRmC], gZ]]*
   Cp[conj[VWLm], bar[gWRmC], gZ] + B00[p^2, Mass2[gZR], Mass2[gWRmC]]*
   conj[Cp[conj[VWLm], bar[gWRmC], gZR]]*Cp[conj[VWLm], bar[gWRmC], gZR] + 
  B00[p^2, Mass2[gWLm], Mass2[gZ]]*conj[Cp[conj[VWLm], bar[gZ], gWLm]]*
   Cp[conj[VWLm], bar[gZ], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gZ]]*
   conj[Cp[conj[VWLm], bar[gZ], gWRm]]*Cp[conj[VWLm], bar[gZ], gWRm] + 
  B00[p^2, Mass2[gWLm], Mass2[gZR]]*conj[Cp[conj[VWLm], bar[gZR], gWLm]]*
   Cp[conj[VWLm], bar[gZR], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gZR]]*
   conj[Cp[conj[VWLm], bar[gZR], gWRm]]*Cp[conj[VWLm], bar[gZR], gWRm] - 
  conj[Cp[conj[VWLm], VWLm, VP]]*Cp[conj[VWLm], VWLm, VP]*
   (A0[0] + A0[Mass2[VWLm]] + 10*B00[p^2, Mass2[VWLm], 0] - 
    2*rMS*(-p^2/3 + Mass2[VWLm]) + B0[p^2, Mass2[VWLm], 0]*
     (4*p^2 + Mass2[VWLm])) - conj[Cp[conj[VWLm], VWRm, VP]]*
   Cp[conj[VWLm], VWRm, VP]*(A0[0] + A0[Mass2[VWRm]] + 
    10*B00[p^2, Mass2[VWRm], 0] - 2*rMS*(-p^2/3 + Mass2[VWRm]) + 
    B0[p^2, Mass2[VWRm], 0]*(4*p^2 + Mass2[VWRm])) - 
  conj[Cp[conj[VWLm], VZ, VWLm]]*Cp[conj[VWLm], VZ, VWLm]*
   (A0[Mass2[VWLm]] + A0[Mass2[VZ]] + 10*B00[p^2, Mass2[VZ], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VZ]) + 
    B0[p^2, Mass2[VZ], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VZ])) - 
  conj[Cp[conj[VWLm], VZ, VWRm]]*Cp[conj[VWLm], VZ, VWRm]*
   (A0[Mass2[VWRm]] + A0[Mass2[VZ]] + 10*B00[p^2, Mass2[VZ], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + Mass2[VWRm] + Mass2[VZ]) + 
    B0[p^2, Mass2[VZ], Mass2[VWRm]]*(4*p^2 + Mass2[VWRm] + Mass2[VZ])) - 
  conj[Cp[conj[VWLm], VZR, VWLm]]*Cp[conj[VWLm], VZR, VWLm]*
   (A0[Mass2[VWLm]] + A0[Mass2[VZR]] + 10*B00[p^2, Mass2[VZR], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VZR]) + 
    B0[p^2, Mass2[VZR], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VZR])) - 
  conj[Cp[conj[VWLm], VZR, VWRm]]*Cp[conj[VWLm], VZR, VWRm]*
   (A0[Mass2[VWRm]] + A0[Mass2[VZR]] + 10*B00[p^2, Mass2[VZR], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + Mass2[VWRm] + Mass2[VZR]) + 
    B0[p^2, Mass2[VZR], Mass2[VWRm]]*(4*p^2 + Mass2[VWRm] + Mass2[VZR])) + 
  sum[gI1, 1, 2, A0[Mass2[Hppmm[{gI1}]]]*Cp[VWLm, conj[VWLm], 
     conj[Hppmm[{gI1}]], Hppmm[{gI1}]]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fd[{gI2}]]]*Mass[Fd[{gI2}]]*
       Mass[Fu[{gI1}]]*Re[conj[Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[conj[VWLm], bar[Fu[{gI1}]], Fd[{gI2}]][PR])]] + 
  sum[gI1, 1, 4, A0[Mass2[Ah[{gI1}]]]*Cp[VWLm, conj[VWLm], Ah[{gI1}], 
      Ah[{gI1}]]]/2 + sum[gI1, 1, 4, A0[Mass2[Hpm[{gI1}]]]*
    Cp[VWLm, conj[VWLm], conj[Hpm[{gI1}]], Hpm[{gI1}]]] + 
  sum[gI1, 1, 4, A0[Mass2[hh[{gI1}]]]*Cp[VWLm, conj[VWLm], hh[{gI1}], 
      hh[{gI1}]]]/2 - 4*sum[gI1, 1, 4, sum[gI2, 1, 2, 
     B00[p^2, Mass2[Hppmm[{gI2}]], Mass2[Hpm[{gI1}]]]*
      conj[Cp[conj[VWLm], conj[Hpm[{gI1}]], Hppmm[{gI2}]]]*
      Cp[conj[VWLm], conj[Hpm[{gI1}]], Hppmm[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Ah[{gI2}]], 
       Mass2[Hpm[{gI1}]]]*conj[Cp[conj[VWLm], Hpm[{gI1}], Ah[{gI2}]]]*
      Cp[conj[VWLm], Hpm[{gI1}], Ah[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[hh[{gI2}]], 
       Mass2[Hpm[{gI1}]]]*conj[Cp[conj[VWLm], Hpm[{gI1}], hh[{gI2}]]]*
      Cp[conj[VWLm], Hpm[{gI1}], hh[{gI2}]]]] + 
  sum[gI1, 1, 6, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fv[{gI1}]], Mass2[Fe[{gI2}]]]*
      Mass[Fe[{gI2}]]*Mass[Fv[{gI1}]]*
      Re[conj[Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PL]]*
        Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PR]] + 
     H0[p^2, Mass2[Fv[{gI1}]], Mass2[Fe[{gI2}]]]*
      (conj[Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PL]]*
        Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PL] + 
       conj[Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PR]]*
        Cp[conj[VWLm], Fv[{gI1}], Fe[{gI2}]][PR])]] + 
  sum[gI2, 1, 2, B0[p^2, Mass2[VWLm], Mass2[Hppmm[{gI2}]]]*
    conj[Cp[conj[VWLm], conj[VWLm], Hppmm[{gI2}]]]*
    Cp[conj[VWLm], conj[VWLm], Hppmm[{gI2}]]] + 
  sum[gI2, 1, 2, B0[p^2, Mass2[VWRm], Mass2[Hppmm[{gI2}]]]*
    conj[Cp[conj[VWLm], conj[VWRm], Hppmm[{gI2}]]]*
    Cp[conj[VWLm], conj[VWRm], Hppmm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, 0, Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWLm], VP, Hpm[{gI2}]]]*Cp[conj[VWLm], VP, Hpm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[hh[{gI2}]]]*
    conj[Cp[conj[VWLm], VWLm, hh[{gI2}]]]*Cp[conj[VWLm], VWLm, hh[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[Ah[{gI2}]]]*
    conj[Cp[conj[VWLm], VWRm, Ah[{gI2}]]]*Cp[conj[VWLm], VWRm, Ah[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[hh[{gI2}]]]*
    conj[Cp[conj[VWLm], VWRm, hh[{gI2}]]]*Cp[conj[VWLm], VWRm, hh[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZ], Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWLm], VZ, Hpm[{gI2}]]]*Cp[conj[VWLm], VZ, Hpm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZR], Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWLm], VZR, Hpm[{gI2}]]]*Cp[conj[VWLm], VZR, Hpm[{gI2}]]] - 
  (A0[0]*(4*Cp[VWLm, conj[VWLm], VP, VP][1] + Cp[VWLm, conj[VWLm], VP, VP][
      2] + Cp[VWLm, conj[VWLm], VP, VP][3]))/2 + 
  (2*rMS*Mass2[VZ]*Cp[VWLm, conj[VWLm], VZ, VZ][1] - 
    A0[Mass2[VZ]]*(4*Cp[VWLm, conj[VWLm], VZ, VZ][1] + 
      Cp[VWLm, conj[VWLm], VZ, VZ][2] + Cp[VWLm, conj[VWLm], VZ, VZ][3]))/2 + 
  (2*rMS*Mass2[VZR]*Cp[VWLm, conj[VWLm], VZR, VZR][1] - 
    A0[Mass2[VZR]]*(4*Cp[VWLm, conj[VWLm], VZR, VZR][1] + 
      Cp[VWLm, conj[VWLm], VZR, VZR][2] + Cp[VWLm, conj[VWLm], VZR, VZR][3]))/
   2 + 2*rMS*Mass2[VWLm]*Cp[VWLm, conj[VWLm], conj[VWLm], VWLm][1] - 
  A0[Mass2[VWLm]]*(4*Cp[VWLm, conj[VWLm], conj[VWLm], VWLm][1] + 
    Cp[VWLm, conj[VWLm], conj[VWLm], VWLm][2] + 
    Cp[VWLm, conj[VWLm], conj[VWLm], VWLm][3]) + 
  2*rMS*Mass2[VWRm]*Cp[VWLm, conj[VWLm], conj[VWRm], VWRm][1] - 
  A0[Mass2[VWRm]]*(4*Cp[VWLm, conj[VWLm], conj[VWRm], VWRm][1] + 
    Cp[VWLm, conj[VWLm], conj[VWRm], VWRm][2] + 
    Cp[VWLm, conj[VWLm], conj[VWRm], VWRm][3]), 
 B00[p^2, Mass2[gWLm], Mass2[gP]]*conj[Cp[conj[VWRm], bar[gP], gWLm]]*
   Cp[conj[VWRm], bar[gP], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gP]]*
   conj[Cp[conj[VWRm], bar[gP], gWRm]]*Cp[conj[VWRm], bar[gP], gWRm] + 
  B00[p^2, Mass2[gP], Mass2[gWLmC]]*conj[Cp[conj[VWRm], bar[gWLmC], gP]]*
   Cp[conj[VWRm], bar[gWLmC], gP] + B00[p^2, Mass2[gZ], Mass2[gWLmC]]*
   conj[Cp[conj[VWRm], bar[gWLmC], gZ]]*Cp[conj[VWRm], bar[gWLmC], gZ] + 
  B00[p^2, Mass2[gZR], Mass2[gWLmC]]*conj[Cp[conj[VWRm], bar[gWLmC], gZR]]*
   Cp[conj[VWRm], bar[gWLmC], gZR] + B00[p^2, Mass2[gP], Mass2[gWRmC]]*
   conj[Cp[conj[VWRm], bar[gWRmC], gP]]*Cp[conj[VWRm], bar[gWRmC], gP] + 
  B00[p^2, Mass2[gZ], Mass2[gWRmC]]*conj[Cp[conj[VWRm], bar[gWRmC], gZ]]*
   Cp[conj[VWRm], bar[gWRmC], gZ] + B00[p^2, Mass2[gZR], Mass2[gWRmC]]*
   conj[Cp[conj[VWRm], bar[gWRmC], gZR]]*Cp[conj[VWRm], bar[gWRmC], gZR] + 
  B00[p^2, Mass2[gWLm], Mass2[gZ]]*conj[Cp[conj[VWRm], bar[gZ], gWLm]]*
   Cp[conj[VWRm], bar[gZ], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gZ]]*
   conj[Cp[conj[VWRm], bar[gZ], gWRm]]*Cp[conj[VWRm], bar[gZ], gWRm] + 
  B00[p^2, Mass2[gWLm], Mass2[gZR]]*conj[Cp[conj[VWRm], bar[gZR], gWLm]]*
   Cp[conj[VWRm], bar[gZR], gWLm] + B00[p^2, Mass2[gWRm], Mass2[gZR]]*
   conj[Cp[conj[VWRm], bar[gZR], gWRm]]*Cp[conj[VWRm], bar[gZR], gWRm] - 
  conj[Cp[conj[VWRm], VWLm, VP]]*Cp[conj[VWRm], VWLm, VP]*
   (A0[0] + A0[Mass2[VWLm]] + 10*B00[p^2, Mass2[VWLm], 0] - 
    2*rMS*(-p^2/3 + Mass2[VWLm]) + B0[p^2, Mass2[VWLm], 0]*
     (4*p^2 + Mass2[VWLm])) - conj[Cp[conj[VWRm], VWRm, VP]]*
   Cp[conj[VWRm], VWRm, VP]*(A0[0] + A0[Mass2[VWRm]] + 
    10*B00[p^2, Mass2[VWRm], 0] - 2*rMS*(-p^2/3 + Mass2[VWRm]) + 
    B0[p^2, Mass2[VWRm], 0]*(4*p^2 + Mass2[VWRm])) - 
  conj[Cp[conj[VWRm], VZ, VWLm]]*Cp[conj[VWRm], VZ, VWLm]*
   (A0[Mass2[VWLm]] + A0[Mass2[VZ]] + 10*B00[p^2, Mass2[VZ], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VZ]) + 
    B0[p^2, Mass2[VZ], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VZ])) - 
  conj[Cp[conj[VWRm], VZ, VWRm]]*Cp[conj[VWRm], VZ, VWRm]*
   (A0[Mass2[VWRm]] + A0[Mass2[VZ]] + 10*B00[p^2, Mass2[VZ], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + Mass2[VWRm] + Mass2[VZ]) + 
    B0[p^2, Mass2[VZ], Mass2[VWRm]]*(4*p^2 + Mass2[VWRm] + Mass2[VZ])) - 
  conj[Cp[conj[VWRm], VZR, VWLm]]*Cp[conj[VWRm], VZR, VWLm]*
   (A0[Mass2[VWLm]] + A0[Mass2[VZR]] + 10*B00[p^2, Mass2[VZR], Mass2[VWLm]] - 
    2*rMS*(-p^2/3 + Mass2[VWLm] + Mass2[VZR]) + 
    B0[p^2, Mass2[VZR], Mass2[VWLm]]*(4*p^2 + Mass2[VWLm] + Mass2[VZR])) - 
  conj[Cp[conj[VWRm], VZR, VWRm]]*Cp[conj[VWRm], VZR, VWRm]*
   (A0[Mass2[VWRm]] + A0[Mass2[VZR]] + 10*B00[p^2, Mass2[VZR], Mass2[VWRm]] - 
    2*rMS*(-p^2/3 + Mass2[VWRm] + Mass2[VZR]) + 
    B0[p^2, Mass2[VZR], Mass2[VWRm]]*(4*p^2 + Mass2[VWRm] + Mass2[VZR])) + 
  sum[gI1, 1, 2, A0[Mass2[Hppmm[{gI1}]]]*Cp[VWRm, conj[VWRm], 
     conj[Hppmm[{gI1}]], Hppmm[{gI1}]]] + 
  3*sum[gI1, 1, 3, sum[gI2, 1, 3, 
     4*B0[p^2, Mass2[Fu[{gI1}]], Mass2[Fd[{gI2}]]]*Mass[Fd[{gI2}]]*
       Mass[Fu[{gI1}]]*Re[conj[Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PR]] + 
      H0[p^2, Mass2[Fu[{gI1}]], Mass2[Fd[{gI2}]]]*
       (conj[Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PL]]*
         Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PL] + 
        conj[Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PR]]*
         Cp[conj[VWRm], bar[Fu[{gI1}]], Fd[{gI2}]][PR])]] + 
  sum[gI1, 1, 4, A0[Mass2[Ah[{gI1}]]]*Cp[VWRm, conj[VWRm], Ah[{gI1}], 
      Ah[{gI1}]]]/2 + sum[gI1, 1, 4, A0[Mass2[Hpm[{gI1}]]]*
    Cp[VWRm, conj[VWRm], conj[Hpm[{gI1}]], Hpm[{gI1}]]] + 
  sum[gI1, 1, 4, A0[Mass2[hh[{gI1}]]]*Cp[VWRm, conj[VWRm], hh[{gI1}], 
      hh[{gI1}]]]/2 - 4*sum[gI1, 1, 4, sum[gI2, 1, 2, 
     B00[p^2, Mass2[Hppmm[{gI2}]], Mass2[Hpm[{gI1}]]]*
      conj[Cp[conj[VWRm], conj[Hpm[{gI1}]], Hppmm[{gI2}]]]*
      Cp[conj[VWRm], conj[Hpm[{gI1}]], Hppmm[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[Ah[{gI2}]], 
       Mass2[Hpm[{gI1}]]]*conj[Cp[conj[VWRm], Hpm[{gI1}], Ah[{gI2}]]]*
      Cp[conj[VWRm], Hpm[{gI1}], Ah[{gI2}]]]] - 
  4*sum[gI1, 1, 4, sum[gI2, 1, 4, B00[p^2, Mass2[hh[{gI2}]], 
       Mass2[Hpm[{gI1}]]]*conj[Cp[conj[VWRm], Hpm[{gI1}], hh[{gI2}]]]*
      Cp[conj[VWRm], Hpm[{gI1}], hh[{gI2}]]]] + 
  sum[gI1, 1, 6, sum[gI2, 1, 3, 4*B0[p^2, Mass2[Fv[{gI1}]], Mass2[Fe[{gI2}]]]*
      Mass[Fe[{gI2}]]*Mass[Fv[{gI1}]]*
      Re[conj[Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PL]]*
        Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PR]] + 
     H0[p^2, Mass2[Fv[{gI1}]], Mass2[Fe[{gI2}]]]*
      (conj[Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PL]]*
        Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PL] + 
       conj[Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PR]]*
        Cp[conj[VWRm], Fv[{gI1}], Fe[{gI2}]][PR])]] + 
  sum[gI2, 1, 2, B0[p^2, Mass2[VWLm], Mass2[Hppmm[{gI2}]]]*
    conj[Cp[conj[VWRm], conj[VWLm], Hppmm[{gI2}]]]*
    Cp[conj[VWRm], conj[VWLm], Hppmm[{gI2}]]] + 
  sum[gI2, 1, 2, B0[p^2, Mass2[VWRm], Mass2[Hppmm[{gI2}]]]*
    conj[Cp[conj[VWRm], conj[VWRm], Hppmm[{gI2}]]]*
    Cp[conj[VWRm], conj[VWRm], Hppmm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, 0, Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWRm], VP, Hpm[{gI2}]]]*Cp[conj[VWRm], VP, Hpm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[Ah[{gI2}]]]*
    conj[Cp[conj[VWRm], VWLm, Ah[{gI2}]]]*Cp[conj[VWRm], VWLm, Ah[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWLm], Mass2[hh[{gI2}]]]*
    conj[Cp[conj[VWRm], VWLm, hh[{gI2}]]]*Cp[conj[VWRm], VWLm, hh[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VWRm], Mass2[hh[{gI2}]]]*
    conj[Cp[conj[VWRm], VWRm, hh[{gI2}]]]*Cp[conj[VWRm], VWRm, hh[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZ], Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWRm], VZ, Hpm[{gI2}]]]*Cp[conj[VWRm], VZ, Hpm[{gI2}]]] + 
  sum[gI2, 1, 4, B0[p^2, Mass2[VZR], Mass2[Hpm[{gI2}]]]*
    conj[Cp[conj[VWRm], VZR, Hpm[{gI2}]]]*Cp[conj[VWRm], VZR, Hpm[{gI2}]]] - 
  (A0[0]*(4*Cp[VWRm, conj[VWRm], VP, VP][1] + Cp[VWRm, conj[VWRm], VP, VP][
      2] + Cp[VWRm, conj[VWRm], VP, VP][3]))/2 + 
  (2*rMS*Mass2[VZ]*Cp[VWRm, conj[VWRm], VZ, VZ][1] - 
    A0[Mass2[VZ]]*(4*Cp[VWRm, conj[VWRm], VZ, VZ][1] + 
      Cp[VWRm, conj[VWRm], VZ, VZ][2] + Cp[VWRm, conj[VWRm], VZ, VZ][3]))/2 + 
  (2*rMS*Mass2[VZR]*Cp[VWRm, conj[VWRm], VZR, VZR][1] - 
    A0[Mass2[VZR]]*(4*Cp[VWRm, conj[VWRm], VZR, VZR][1] + 
      Cp[VWRm, conj[VWRm], VZR, VZR][2] + Cp[VWRm, conj[VWRm], VZR, VZR][3]))/
   2 + 2*rMS*Mass2[VWLm]*Cp[VWRm, conj[VWRm], conj[VWLm], VWLm][1] - 
  A0[Mass2[VWLm]]*(4*Cp[VWRm, conj[VWRm], conj[VWLm], VWLm][1] + 
    Cp[VWRm, conj[VWRm], conj[VWLm], VWLm][2] + 
    Cp[VWRm, conj[VWRm], conj[VWLm], VWLm][3]) + 
  2*rMS*Mass2[VWRm]*Cp[VWRm, conj[VWRm], conj[VWRm], VWRm][1] - 
  A0[Mass2[VWRm]]*(4*Cp[VWRm, conj[VWRm], conj[VWRm], VWRm][1] + 
    Cp[VWRm, conj[VWRm], conj[VWRm], VWRm][2] + 
    Cp[VWRm, conj[VWRm], conj[VWRm], VWRm][3])}

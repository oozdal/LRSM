(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.13.0  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 0:21 on 10.2.2021  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[A2q]={
chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][gt2,gt1,gt3],coup1R -> Cp[bar[Fd], Fd, Ah][R][gt2,gt1,gt3]},}
(* Ah,Fd, Internal:bar[Fd]*) 
{{Ah,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1,i1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1,i1],coup2L -> Cp[bar[Fd], Fd, Ah][L][i3,i2,i1],coup2R -> Cp[bar[Fd], Fd, Ah][R][i3,i2,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mS1 -> M[Ah][i1],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* hh,Fd, Internal:bar[Fd]*) 
{{hh,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1,i1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1,i1],coup2L -> Cp[bar[Fd], Fd, hh][L][i3,i2,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][i3,i2,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mS1 -> M[hh][i1],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* VZ,Fd, Internal:bar[Fd]*) 
{{VZ,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mV1 -> M[VZ],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* VZR,Fd, Internal:bar[Fd]*) 
{{VZR,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZR][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZR][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZR][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, VZR][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mV1 -> M[VZR],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* bar[Fu],Hpm, Internal:bar[Fd]*) 
{{bar[Fu],Hpm,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i1,gt1,i2],coup1R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fu, Hpm][L][i3,i1,i2],coup2R -> Cp[bar[Fd], Fu, Hpm][R][i3,i1,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mF1 -> M[Fu][i1],mS1 -> M[Hpm][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* bar[Fu],VWLm, Internal:bar[Fd]*) 
{{bar[Fu],VWLm,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWLm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWLm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, VWLm][L][i3,i1],coup2R -> Cp[bar[Fd], Fu, VWLm][R][i3,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mF1 -> M[Fu][i1],mV1 -> M[VWLm],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* bar[Fu],VWRm, Internal:bar[Fd]*) 
{{bar[Fu],VWRm,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWRm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWRm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, VWRm][L][i3,i1],coup2R -> Cp[bar[Fd], Fu, VWRm][R][i3,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,gt3]},{mF1 -> M[Fu][i1],mV1 -> M[VWRm],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* Fd,Ah, Internal:Fd*) 
{{Fd,Ah,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fd], Fd, Ah][L][i1,i3,i2],coup2R -> Cp[bar[Fd], Fd, Ah][R][i1,i3,i2],coup1L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1,i2],coup1R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1,i2]},{mF1 -> M[Fd][i1],mS1 -> M[Ah][i2],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fd,hh, Internal:Fd*) 
{{Fd,hh,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fd], Fd, hh][L][i1,i3,i2],coup2R -> Cp[bar[Fd], Fd, hh][R][i1,i3,i2],coup1L -> Cp[bar[Fd], Fd, hh][L][gt2,i1,i2],coup1R -> Cp[bar[Fd], Fd, hh][R][gt2,i1,i2]},{mF1 -> M[Fd][i1],mS1 -> M[hh][i2],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fd,VZ, Internal:Fd*) 
{{Fd,VZ,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fd], Fd, VZ][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1]},{mF1 -> M[Fd][i1],mV1 -> M[VZ],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fd,VZR, Internal:Fd*) 
{{Fd,VZR,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fd], Fd, VZR][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, VZR][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, VZR][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, VZR][R][gt2,i1]},{mF1 -> M[Fd][i1],mV1 -> M[VZR],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Hpm,bar[Fu], Internal:Fd*) 
{{Hpm,bar[Fu],Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i2,i3,i1],coup2R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i2,i3,i1],coup1L -> Cp[bar[Fd], Fu, Hpm][L][gt2,i2,i1],coup1R -> Cp[bar[Fd], Fu, Hpm][R][gt2,i2,i1]},{mS1 -> M[Hpm][i1],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* VWLm,bar[Fu], Internal:Fd*) 
{{VWLm,bar[Fu],Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fu], Fd, conj[VWLm]][L][i2,i3],coup2R -> Cp[bar[Fu], Fd, conj[VWLm]][R][i2,i3],coup1L -> Cp[bar[Fd], Fu, VWLm][L][gt2,i2],coup1R -> Cp[bar[Fd], Fu, VWLm][R][gt2,i2]},{mV1 -> M[VWLm],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* VWRm,bar[Fu], Internal:Fd*) 
{{VWRm,bar[Fu],Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1,gt3],coup2L -> Cp[bar[Fu], Fd, conj[VWRm]][L][i2,i3],coup2R -> Cp[bar[Fu], Fd, conj[VWRm]][R][i2,i3],coup1L -> Cp[bar[Fd], Fu, VWRm][L][gt2,i2],coup1R -> Cp[bar[Fd], Fu, VWRm][R][gt2,i2]},{mV1 -> M[VWRm],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt2]}}
(* Ah,Fd,Fd*) 
{{Ah,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1,i1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1,i1],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3,i1],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2,gt3]},},
(* hh,Fd,Fd*) 
{{hh,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1,i1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1,i1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i3,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i3,i1],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2,gt3]},},
(* VZ,Fd,Fd*) 
{{VZ,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2,gt3]},},
(* VZR,Fd,Fd*) 
{{VZR,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZR][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZR][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZR][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, VZR][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2,gt3]},},
(* bar[Fd],hh,Ah*) 
{{bar[Fd],hh,Ah},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1,i2],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1,i3],coup3 -> Cp[Ah, Ah, hh][gt3,i3,i2]},},
(* bar[Fd],Ah,hh*) 
{{bar[Fd],Ah,hh},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i1,gt1,i2],coup1R -> Cp[bar[Fd], Fd, Ah][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1,i3],coup3 -> Cp[Ah, Ah, hh][gt3,i2,i3]},},
(* bar[Fd],VZ,hh*) 
{{bar[Fd],VZ,hh},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1,i3],coup3 -> Cp[Ah, hh, VZ][gt3,i3]},},
(* bar[Fd],VZR,hh*) 
{{bar[Fd],VZR,hh},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZR][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, VZR][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1,i3],coup3 -> Cp[Ah, hh, VZR][gt3,i3]},},
(* bar[Fd],hh,VZ*) 
{{bar[Fd],hh,VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1,i2],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1],coup3 -> Cp[Ah, hh, VZ][gt3,i2]},},
(* bar[Fd],hh,VZR*) 
{{bar[Fd],hh,VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1,i2],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fd, VZR][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, VZR][R][gt2,i1],coup3 -> Cp[Ah, hh, VZR][gt3,i2]},},
(* bar[Fu],Hpm,Hpm*) 
{{bar[Fu],Hpm,Hpm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i1,gt1,i2],coup1R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fu, Hpm][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fu, Hpm][R][gt2,i1,i3],coup3 -> Cp[Ah, Hpm, conj[Hpm]][gt3,i2,i3]},},
(* bar[Fu],VWLm,Hpm*) 
{{bar[Fu],VWLm,Hpm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWLm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWLm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, Hpm][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fu, Hpm][R][gt2,i1,i3],coup3 -> Cp[Ah, conj[Hpm], VWLm][gt3,i3]},},
(* bar[Fu],VWRm,Hpm*) 
{{bar[Fu],VWRm,Hpm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWRm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWRm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, Hpm][L][gt2,i1,i3],coup2R -> Cp[bar[Fd], Fu, Hpm][R][gt2,i1,i3],coup3 -> Cp[Ah, conj[Hpm], VWRm][gt3,i3]},},
(* bar[Fu],Hpm,VWLm*) 
{{bar[Fu],Hpm,VWLm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i1,gt1,i2],coup1R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fu, VWLm][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, VWLm][R][gt2,i1],coup3 -> Cp[Ah, Hpm, conj[VWLm]][gt3,i2]},},
(* bar[Fu],VWRm,VWLm*) 
{{bar[Fu],VWRm,VWLm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWRm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWRm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, VWLm][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, VWLm][R][gt2,i1],coup3 -> Cp[Ah, conj[VWLm], VWRm][gt3]},},
(* bar[Fu],Hpm,VWRm*) 
{{bar[Fu],Hpm,VWRm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i1,gt1,i2],coup1R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i1,gt1,i2],coup2L -> Cp[bar[Fd], Fu, VWRm][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, VWRm][R][gt2,i1],coup3 -> Cp[Ah, Hpm, conj[VWRm]][gt3,i2]},},
(* bar[Fu],VWLm,VWRm*) 
{{bar[Fu],VWLm,VWRm},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWLm]][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWLm]][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, VWRm][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, VWRm][R][gt2,i1],coup3 -> Cp[Ah, conj[VWRm], VWLm][gt3]},},
(* conj[Hpm],Fu,Fu*) 
{{conj[Hpm],Fu,Fu},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[Hpm]][L][i2,gt1,i1],coup1R -> Cp[bar[Fu], Fd, conj[Hpm]][R][i2,gt1,i1],coup2L -> Cp[bar[Fd], Fu, Hpm][L][gt2,i3,i1],coup2R -> Cp[bar[Fd], Fu, Hpm][R][gt2,i3,i1],coup3L -> Cp[bar[Fu], Fu, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fu], Fu, Ah][R][i3,i2,gt3]},},
(* conj[VWLm],Fu,Fu*) 
{{conj[VWLm],Fu,Fu},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWLm]][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWLm]][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, VWLm][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, VWLm][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fu], Fu, Ah][R][i3,i2,gt3]},},
(* conj[VWRm],Fu,Fu*) 
{{conj[VWRm],Fu,Fu},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, conj[VWRm]][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, conj[VWRm]][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, VWRm][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, VWRm][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, Ah][L][i3,i2,gt3],coup3R -> Cp[bar[Fu], Fu, Ah][R][i3,i2,gt3]},}
};
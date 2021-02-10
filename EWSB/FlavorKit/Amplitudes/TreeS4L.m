(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.13.0  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 0:15 on 10.2.2021  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[TreeS4L]={
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, hh][L][gt2,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, hh][R][gt2,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, hh][L][gt4,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, hh][R][gt4,gt3,iProp]},{MP -> M[hh][iProp]}  {TSO4lSLL,coup1L*coup2L*IMP2},   {TSO4lSRR,coup1R*coup2R*IMP2},   {TSO4lSRL,coup1R*coup2L*IMP2},   {TSO4lSLR,coup1L*coup2R*IMP2}   {TSO4lVRR,0}   {TSO4lVLL,0}   {TSO4lVRL,0}   {TSO4lVLR,0}   {TSO4lTLL,0}   {TSO4lTLR,0}   {TSO4lTRL,0}   {TSO4lTRR,0} }
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, Ah][L][gt2,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, Ah][R][gt2,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, Ah][L][gt4,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, Ah][R][gt4,gt3,iProp]},{MP -> M[Ah][iProp]}  {TSO4lSLL,coup1L*coup2L*IMP2},   {TSO4lSRR,coup1R*coup2R*IMP2},   {TSO4lSRL,coup1R*coup2L*IMP2},   {TSO4lSLR,coup1L*coup2R*IMP2}   {TSO4lVRR,0}   {TSO4lVLL,0}   {TSO4lVRL,0}   {TSO4lVLR,0}   {TSO4lTLL,0}   {TSO4lTLR,0}   {TSO4lTRL,0}   {TSO4lTRR,0} }
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[Fe, Fe, conj[Hppmm]][L][gt1,gt3,iProp],coup1R -> Cp[Fe, Fe, conj[Hppmm]][R][gt1,gt3,iProp],coup2L -> Cp[bar[Fe], bar[Fe], Hppmm][L][gt2,gt4,iProp],coup2R -> Cp[bar[Fe], bar[Fe], Hppmm][R][gt2,gt4,iProp]},{MP -> M[Hppmm][iProp]}  {TSO4lSLL,-(coup1L*coup2L*IMP2)/2},   {TSO4lSRR,-(coup1R*coup2R*IMP2)/2},   {TSO4lSRL,0},   {TSO4lSLR,0}   {TSO4lVRR,(coup1R*coup2L*IMP2)/2}   {TSO4lVLL,(coup1L*coup2R*IMP2)/2}   {TSO4lVRL,0}   {TSO4lVLR,0}   {TSO4lTLL,-(coup1L*coup2L*IMP2)/8}   {TSO4lTLR,0}   {TSO4lTRL,0}   {TSO4lTRR,-(coup1R*coup2R*IMP2)/8} }
};
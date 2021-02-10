(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.13.0  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 0:17 on 10.2.2021  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[TreeS4Lcross]={
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, hh][L][gt2,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, hh][R][gt2,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, hh][L][gt4,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, hh][R][gt4,gt3,iProp]},{MP -> M[hh][iProp]}  {TSO4lSLLcross,coup1L*coup2L*IMP2},   {TSO4lSRRcross,coup1R*coup2R*IMP2},   {TSO4lSRLcross,coup1R*coup2L*IMP2},   {TSO4lSLRcross,coup1L*coup2R*IMP2}   {TSO4lVRRcross,0}   {TSO4lVLLcross,0}   {TSO4lVRLcross,0}   {TSO4lVLRcross,0}   {TSO4lTLLcross,0}   {TSO4lTLRcross,0}   {TSO4lTRLcross,0}   {TSO4lTRRcross,0} },
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, hh][L][gt4,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, hh][R][gt4,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, hh][L][gt2,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, hh][R][gt2,gt3,iProp]},{MP -> M[hh][iProp]}  {TSO4lSLLcross,-(coup1L*coup2L*IMP2)/2},   {TSO4lSRRcross,-(coup1R*coup2R*IMP2)/2},   {TSO4lSRLcross,0},   {TSO4lSLRcross,0}   {TSO4lVRRcross,0}   {TSO4lVLLcross,0}   {TSO4lVRLcross,-(coup1R*coup2L*IMP2)/2}   {TSO4lVLRcross,-(coup1L*coup2R*IMP2)/2}   {TSO4lTLLcross,(coup1L*coup2L*IMP2)/8}   {TSO4lTLRcross,0}   {TSO4lTRLcross,0}   {TSO4lTRRcross,(coup1R*coup2R*IMP2)/8} }
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, Ah][L][gt2,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, Ah][R][gt2,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, Ah][L][gt4,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, Ah][R][gt4,gt3,iProp]},{MP -> M[Ah][iProp]}  {TSO4lSLLcross,coup1L*coup2L*IMP2},   {TSO4lSRRcross,coup1R*coup2R*IMP2},   {TSO4lSRLcross,coup1R*coup2L*IMP2},   {TSO4lSLRcross,coup1L*coup2R*IMP2}   {TSO4lVRRcross,0}   {TSO4lVLLcross,0}   {TSO4lVRLcross,0}   {TSO4lVLRcross,0}   {TSO4lTLLcross,0}   {TSO4lTLRcross,0}   {TSO4lTRLcross,0}   {TSO4lTRRcross,0} },
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, Ah][L][gt4,gt1,iProp],coup1R -> Cp[bar[Fe], Fe, Ah][R][gt4,gt1,iProp],coup2L -> Cp[bar[Fe], Fe, Ah][L][gt2,gt3,iProp],coup2R -> Cp[bar[Fe], Fe, Ah][R][gt2,gt3,iProp]},{MP -> M[Ah][iProp]}  {TSO4lSLLcross,-(coup1L*coup2L*IMP2)/2},   {TSO4lSRRcross,-(coup1R*coup2R*IMP2)/2},   {TSO4lSRLcross,0},   {TSO4lSLRcross,0}   {TSO4lVRRcross,0}   {TSO4lVLLcross,0}   {TSO4lVRLcross,-(coup1R*coup2L*IMP2)/2}   {TSO4lVLRcross,-(coup1L*coup2R*IMP2)/2}   {TSO4lTLLcross,(coup1L*coup2L*IMP2)/8}   {TSO4lTLRcross,0}   {TSO4lTRLcross,0}   {TSO4lTRRcross,(coup1R*coup2R*IMP2)/8} }
(*VZR*) 
{{VZR},chargefactor -> 1,{coup1L -> Cp[Fe, Fe, conj[Hppmm]][L][gt1,gt3,iProp],coup1R -> Cp[Fe, Fe, conj[Hppmm]][R][gt1,gt3,iProp],coup2L -> Cp[bar[Fe], bar[Fe], Hppmm][L][gt2,gt4,iProp],coup2R -> Cp[bar[Fe], bar[Fe], Hppmm][R][gt2,gt4,iProp]},{MP -> M[Hppmm][iProp]}  {TSO4lSLLcross,-(coup1L*coup2L*IMP2)/2},   {TSO4lSRRcross,-(coup1R*coup2R*IMP2)/2},   {TSO4lSRLcross,0},   {TSO4lSLRcross,0}   {TSO4lVRRcross,(coup1R*coup2L*IMP2)/2}   {TSO4lVLLcross,(coup1L*coup2R*IMP2)/2}   {TSO4lVRLcross,0}   {TSO4lVLRcross,0}   {TSO4lTLLcross,-(coup1L*coup2L*IMP2)/8}   {TSO4lTLRcross,0}   {TSO4lTRLcross,0}   {TSO4lTRRcross,-(coup1R*coup2R*IMP2)/8} }
};
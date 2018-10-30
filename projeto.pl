homem(princeCharming).
homem(baelfire).
homem(perterPan).
homem(henry).
homem(rumple).
homem(kingLeopold).
homem(robinHood).
homem(robin).
homem(gildeon).
homem(princeHenry).
homem(jonathan).
homem(neal).
homem(bealfire).

mulher(snowWhite).
mulher(emmaSwan).
mulher(evilQueen).
mulher(belle).
mulher(queenEva).
mulher(cora).
mulher(wickedWitchOfTheWest).

progenitor(snowWhite, emmaSwan).
progenitor(princeCharming, emmaSwan).
progenitor(snowWhite, neal).
progenitor(princeCharming, neal).
progenitor(emmaSwan, henry).
progenitor(bealfire, henry).
progenitor(cora, evilQueen).
progenitor(princeHenry, evilQueen).
progenitor(cora, wickedWitchOfTheWest).
progenitor(jonathan, wickedWitchOfTheWest).
progenitor(wickedWitchOfTheWest, robin).
progenitor(robinHood, robin).
progenitor(rumple, bealfire).
progenitor(rumple, gildeon).
progenitor(belle, gildeon).
progenitor(kingLeopold, snowWhite).
progenitor(queenEva, snowWhite).
filho_adotivo(henry, evilQueen).

pai(X,Y) :- progenitor(X,Y), homem(X).
mãe(X,Y) :- (progenitor(X,Y); mãe_adotiva(X,Y)), mulher(X).
mãe_adotiva(X,Y) :- filho_adotivo(Y,X).
filha(X,Y) :- (progenitor(Y,X); mãe_adotiva(Y,X)), mulher(X).
filho(X,Y) :- (progenitor(Y,X); mãe_adotiva(Y,X)), homem(X).
avô(X,Y) :- (progenitor(Z,Y) ; mãe_adotiva(Z,Y)) , progenitor(X,Z), homem(X).
avó(X,Y) :- (progenitor(Z,Y) ; mãe_adotiva(Z,Y)) , progenitor(X,Z), mulher(X).
irmão(X,Y) :- (progenitor(Z,X) ; mãe_adotiva(Z,X)), (progenitor(Z,Y) ; mãe_adotiva(Z,Y)), homem(X), X\=Y.
irmã(X,Y) :- (progenitor(Z,X) ; mãe_adotiva(Z,X)), (progenitor(Z,Y) ; mãe_adotiva(Z,Y)), mulher(X), X\=Y.
tio(X,Y) :- (irmão(Z,X); irmã(Z,X)), (progenitor(Z,Y); mãe_adotiva(Z,Y)), homem(X).
tia(X,Y) :- (irmã(Z,X); irmão(Z,X)), (progenitor(Z,Y); mãe_adotiva(Z,Y)), mulher(X).
primo(X,Y) :- (progenitor(Z,X) ; mãe_adotiva(Z,X)), (tia(Z,Y); tio(Z,Y)).
primo_segundo(X,Y) :- (progenitor(Z,X), primo(Z,Y)); (progenitor(Z,Y),primo(Z,X)).
alguem_possui_primo_segundo :- primo_segundo(_,_).
alguem_é_tix_e_avo :- (tio(_,_) , avô(_,_), homem(_)); (tia(_,_), avó(_,_), mulher(_)).

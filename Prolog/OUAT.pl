homem(princeCharming).
homem(baelfire).
homem(peterPan).
homem(henry).
homem(rumplestiltskin).
homem(kingLeopold).
homem(robinHood).
homem(robin).
homem(gildeon).
homem(princeHenry).
homem(jonathan).

mulher(snowWhite).
mulher(emmaSwan).
mulher(evilQueen).
mulher(belle).
mulher(queenEva).
mulher(wickedWitchOfTheWest).
mulher(cora).

progenitor(snowWhite, emmaSwan).
progenitor(princeCharming, emmaSwan).
progenitor(peterPan, rumplestiltskin).
progenitor(rumplestiltskin, baelfire).
progenitor(emmaSwan, henry).
progenitor(baelfire, henry).
progenitor(cora, evilQueen).
progenitor(cora, wickedWitchOfWest).
progenitor(kingLeopold, snowWhite).
progenitor(queenEva, snowWhite).
progenitor(belle, gildeon).
progenitor(rumplestiltskin, gildeon).
progenitor(robinHood, robin).
progenitor(wickedWitchOfWest, robin).
progenitor(princeHenry, evilQueen).
progenitor(jonathan, wickedWitchOfWest).
filho_adotivo(henry, evilQueen).

pai(X,Y) :- progenitor(X,Y), homem(X).
mãe(X,Y) :- progenitor(X,Y), mulher(X).
mãe_adotiva(X,Y) :- filho_adotivo(Y,X).
avô(X,Y) :- progenitor(X,Z), progenitor(Z,Y), homem(X).
avó(X,Y) :- progenitor(X,Z), progenitor(Z,Y), mulher(X).
neto(X,Y) :- progenitor(Z,X), progenitor(Y,Z), homem(X).
irmão(X,Y) :- progenitor(Z,X), progenitor(Z,Y), homem(X).
irmã(X,Y) :- progenitor(Z,X), progenitor(Z,Y), mulher(X).
/*tia(X,Y) :- progenitor(Z,X), progenitor(Z,T), progenitor(T,Y), mulher(X).*/
tia(X,Y) :- irmã(X,Z), progenitor(Z,Y) ;  mãe_adotiva(Z,Y), mulher(X).
tio(X,Y) :- irmão(X,Z), progenitor(Z,Y) ; mãe_adotiva(Z,Y), homem(X).
prima(X,Y) :- progenitor(Z,X) ; mãe_adotiva(Z,X), (tia(Z,Y); tio(Z,Y)), mulher(X).
primo(X,Y) :- progenitor(Z,X) ;  mãe_adotiva(Z,X), (tia(Z,Y); tio(Z,Y)), homem(X).
primo_segundo(X,Y) :- progenitor(Z,X), (prima(Z,Y); primo(Z,Y)).

alguem_é_tio_e_avô :- tio(_,_), avô(_,_), homem(_).
alguem_possui_primo_segundo :-  primo_segundo(_,_).
/*alguem_é_avô_e_neto :- avô(_,_), neto(_,_), homem(_).*/

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
m�e(X,Y) :- progenitor(X,Y), mulher(X).
m�e_adotiva(X,Y) :- filho_adotivo(Y,X).
av�(X,Y) :- progenitor(X,Z), progenitor(Z,Y), homem(X).
av�(X,Y) :- progenitor(X,Z), progenitor(Z,Y), mulher(X).
neto(X,Y) :- progenitor(Z,X), progenitor(Y,Z), homem(X).
irm�o(X,Y) :- progenitor(Z,X), progenitor(Z,Y), homem(X).
irm�(X,Y) :- progenitor(Z,X), progenitor(Z,Y), mulher(X).
/*tia(X,Y) :- progenitor(Z,X), progenitor(Z,T), progenitor(T,Y), mulher(X).*/
tia(X,Y) :- irm�(X,Z), progenitor(Z,Y) ;  m�e_adotiva(Z,Y), mulher(X).
tio(X,Y) :- irm�o(X,Z), progenitor(Z,Y) ; m�e_adotiva(Z,Y), homem(X).
prima(X,Y) :- progenitor(Z,X) ; m�e_adotiva(Z,X), (tia(Z,Y); tio(Z,Y)), mulher(X).
primo(X,Y) :- progenitor(Z,X) ;  m�e_adotiva(Z,X), (tia(Z,Y); tio(Z,Y)), homem(X).
primo_segundo(X,Y) :- progenitor(Z,X), (prima(Z,Y); primo(Z,Y)).

alguem_�_tio_e_av� :- tio(_,_), av�(_,_), homem(_).
alguem_possui_primo_segundo :-  primo_segundo(_,_).
/*alguem_�_av�_e_neto :- av�(_,_), neto(_,_), homem(_).*/

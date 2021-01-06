begin paup;

log file=parsimony.log start replace;

execute /Users/alexandria/Desktop/DATA/combined_multistate.nex;

set autoclose=yes;

set maxtrees=100 increase=auto;

set criterion=parsimony;

set root=outgroup;

set storebrlens=yes;

set increase=auto;

Pset msTaxa=polymorph;

outgroup Charadrius_vociferus Charadrius_wilsonia;

hsearch addseq=random nreps=10000 swap=tbr hold=1 Collapse=MaxBrlen ;

bootstrap nreps=1000 search=heuristic/ addseq=random nreps=100 swap=tbr hold=10;

showtrees;

describetrees 1/plot=phylogram brlens=yes;

pscores ALL/tl=yes ci=yes ri=yes rc=yes hi=yes;

savetrees file=heur_boot.tre format=altnex brlens=yes;

savetrees file=boot.tre from=1 to=1 savebootp=both maxdec=0 root=yes brlens=yes;

ConTree / strict=no majRule LE50;

savetrees file=heur_marule_1.tre format=altnex brlens=yes;

log stop;

end;

quit;
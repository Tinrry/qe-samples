module load mpi mkl qe &> /dev/null

dirname="$(pwd | rev | cut -d '/' -f1 | rev)"
date="$(date +'%m%d')"
pw.x <*.in &> $dirname-$date.out 

grep '!' *.out

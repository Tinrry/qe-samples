#!/bin/bash

template="CH4_base.in"
repstr="xxxx"

for val in {20..60..10}
do
  inp="CH4_${val}.in"
  sed "s/$repstr/$val/" $template > $inp
  pw.x < $inp &> ${inp%.*}.out
done

awk '/kinetic-energy/{ecut=$4}
     /!.*total/{etot=$5}
     /Total force/{totfor=$4}
     /total.*stress/{print ecut, etot, totfor, $6}' *out > reference.txt

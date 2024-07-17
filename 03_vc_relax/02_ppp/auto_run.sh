#!/bin/bash

rm -f e_v_theta.txt

for val in {20..40..5}
do
    inp="PPP_${val}.in"
    mpirun pw.x <$inp &> ${inp%.*}.out
    etot=`awk '/^!.*total/{print $5}' ${inp%.*}.out`
    echo "${val} ${etot}" >> e_v_theta.txt
done

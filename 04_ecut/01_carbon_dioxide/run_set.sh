#!/bin/bash

mpirun -np 9 pw.x < CO2_10.in > CO2_10.out
mpirun -np 9 pw.x < CO2_15.in > CO2_15.out
mpirun -np 9 pw.x < CO2_20.in > CO2_20.out  
mpirun -np 9 pw.x < CO2_25.in > CO2_25.out  
mpirun -np 9 pw.x < CO2_30.in > CO2_30.out  
mpirun -np 9 pw.x < CO2_35.in > CO2_35.out  
mpirun -np 9 pw.x < CO2_90.in > CO2_90.out  

#!/bin/bash

mpirun pw.x < 01_CD_scf.in &> 01_scf.out
ph.x -pd .true. < 02_CD_ph.in &> 02_ph.out
mpirun q2r.x < 03_CD_q2r.in &> 03_q2r.out
mpirun matdyn.x < 04_CD_matdyn-bands.in &> 04_matdyn.out



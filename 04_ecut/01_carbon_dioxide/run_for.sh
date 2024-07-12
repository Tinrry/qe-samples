#!/bin/bash

for input_file in $(ls *.in)
do
	    pw.x < "$input_file" &> "${input_file%.*}.out"
done

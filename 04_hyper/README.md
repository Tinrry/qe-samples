Lab 3: Plane-wave energy cut-off自洽循环收敛判断
============================================

## 例子一：01_carbon_dioxide
运行`bash run_for.sh`, 查看不同的ecutwfc对收敛结果的影响。
![ecutwfc](image.png)
## 分析
- 改变超参数 `ecutwfc`.
- Different systems will converge differently。
- Often pseudopotential files will suggest an energy cut-off.


```bash
#!/bin/bash

# Loop over files in the current directory with extension .in
for input_file in $(ls *.in)
   # For each file run pw.x and save output in file with same 
   # root name as input file but with .out extension
   do
      pw.x < "$input_file" &> "${input_file%.*}.out"
done
```

- 随着plane-wave energy cut-off 增大，total 能量越来越低
`grep '^!.*total energy' *out`


```bash
#!/bin/bash

# In all files ending with 'out', find line with 'kinetic-energy' 
# and save the fourth column/word into variable 'ecut'. 
# Then in the same file also find a line beginning with '!' and that contains
# the string 'total' and print the value stored in 'ecut' and the
# fifth column/word from this line.
awk '/kinetic-energy/{ecut=$4} /^!.*total/{print ecut, $5}' *out
```
![awk for plot](image-1.png)

typing `bash etot_v_ecut.sh > etot_v_ecut.dat`.


## 例子二： 02_methane
运行 `auto_run.sh`
This is in the `02_ecut/02_methane` directory.

The script is as follows:
```bash
#!/bin/bash

# Original filename
template="CH4_base.in"
# String to be replaced
repstr="xxxx"

# Loop from 10 to 50 in steps of 5. These are the values of the energy cut-off
for val in {10..50..5}
do
  # Define input file name. Assign at each file a specific name
  inp="CH4_${val}.in"
  # Substitute "xxxx" string in original file with the current energy cut-off value
  # and paste the result into new input file
  sed "s/$repstr/$val/" $template > $inp
  # Run pw.x on the current input file
  pw.x < $inp &> ${inp%.*}.out
done

# Extract for each output file the values of the energy cut-off
# and the final total energy
# Paste results in etot_v_ecut.dat file
awk '/kinetic-energy/{ecut=$4}
     /^!.*total/{print ecut, $5}' *out > etot_v_ecut.dat
```
使用[`sed`](../linuxcommands#sed) 生成输入文件.



Plotting with Gnuplot
---------------------
![plot dat](image-2.png)


使用以下命令：

`plot "etot_v_ecut.dat"`

`plot "etot_v_ecut.dat" with linespoints`, or `p "etot_v_ecut.dat" w lp`.

`eref=-100; p "etot_v_ecut.dat" u 1:($2-eref) w lp`
- 如果要使用logscale, 可以设置 `set logscale y` before you type the above command.

### 例子三： the distance between atoms 对能量的影响
`03_argon/01_lda` 
The script for LDA is as follows:
```bash
#!/bin/bash

# Original filename
template="Ar2_base.in"
# String to be replaced
repstr="xxxx"

# delete the file if it exists already (-f)
rm -f etot_v_r.dat

# Loop over bond lengths
for val in 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 4.0 4.2 4.5 5.0
do
  # Print message to output
  echo "Calculating Ar dimer with r=${val}"
  # Define input file with specific name
  inp="Ar2_r${val}.in"
  # Substitue 'xxxx' string with current bondlength value
  # and paste result in new input file
  sed "s/$repstr/$val/" $template > $inp
  # Run pw.x on the new input file and save results in 
  # output file with same rootname as input file
  pw.x < $inp &> ${inp%.*}.out
  # Save current bondlength value in etot_v_r.dat file
  echo -en "${val}\t" >> etot_v_r.dat
  # Extract cut-off and total energy and append to etot_v_r.dat file
  awk '/^!.*total/{print ecut, $5}' ${inp%.*}.out >> etot_v_r.dat
done
```


### 例子4：k-POINT 采样个数与convergence total energy关系
Run the script and plot the convergence of total energy with respect to
k-point sampling.

![alt text](image-3.png)
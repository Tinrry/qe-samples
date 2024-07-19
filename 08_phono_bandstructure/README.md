 
non Bandstructure of Carbon Diamond 声子 谱 结构计算
--------------------------------------
 ```bash
 ## Too few bands for required ndiag

  ph.x -pd .true. < 02_CD_ph.in &> 02_ph.out  
 ```
### 计算介绍

1. Perform self-consistent calculation of the density and wavefunction.
2. Calculate the dynamical matrix on a set of wavevectors. We'll call these
   **q-points** from here on, and use **k-points** to refer to electronic
   wavevectors.
3. Fourier transform our grid of dynamical matrices to obtain a set of
   real space force constants.
4. Perform an inverse Fourier transform of the real space force constants to
   obtain the dynamical matrix at an arbitrary q-point. This allows us
   calculate mode frequencies for a fairly dense set of points along lines
   between high-symmetry points in the same manner as for the electronic
   band structure.
5. Generate the plot.




### _Task_

```bash
bash ./auto_run.sh
```

### todo 绘图有错误。

- Finally we want to generate a plot of these frequencies. We could do that
  directly with the previous output: `CD-bands.freq.gp` is a multicolumn
  space separated list of the frequencies in cm-1.
    - It can be easier to use the `plotband.x` tool to help generate a plot.
    - Call this with `plotband.x CD-bands.freq`. This will then ask you for
      an Emin and Emax value - you should pick values equal to or below and
      above the numbers it suggests. Then it will ask you for an output file
      name. Pick "CD-bands-gpl.dat" here. You can then cancel further running
      of this code with `ctrl+c`. Note it has output the location of the
      high-symmetry points along its x-axis.
- Once you've done this, a gnuplot script `plotbands.gplt` has been provided
  that you can use to generate the band structure plot. This is very similar
  to the one used for the electronic band structure, but the location of
  the high-symmetry points along the x-axis has changed as has the name of
  the data file we're plotting. Run this with `gnuplot plotbands.gplt`.

------------------------------------------------------------------------------

Summary
-------

In this lab we have seen


    - How to use the `pw.x` code to calculate a converged density and
      wavefunction.
      计算SCF,电子密度和波函数。
    - How to use these with the `ph.x` code to calculate the phonon modes on
      a grid of wavevectors.
      计算声子。
    - How to transform these to obtain real-space force constants using the
      `q2r.x` code.
      计算力常数。
    - How to use the real-space force constants to obtain a phonon mode
      bandstructure along lines between high-symmetry points in the
      Brillouin zone.
      计算布里渊区中高对称点的声子谱结构
    - How to plot the bandstructure with gnuplot in a similar way to how we
      plot the electronic bandstructure in a previous lab.
      使用Gnuplot phonon bandstructure.

------------------------------------------------------------------------------



### Projected Density of States态密度计算
---------------------------



 ```bash
  pw.x < 01_C_diamond_scf.in &> 01_C_diamond_scf.out
  pw.x < 02_C_diamond_nscf.in &> 02_C_diamond_nscf.out
  projwfc.x < 03_C_diamond_projwfc.in &> 03_C_diamond_projwfc.out 
  ```
#### 分析
  Try looking at `pwscf.pdos_tot` first. You'll see
  this is a three column file, with energy, density of states, and the total of
  the various decomposed projected density of states. In principle column 2 and
  3 should be the same (and column 2 will reproduce the already calculated
		  density of states), but in practice it can be difficult to assign conduction
  band states accurately so there may be some small disagreement there.

  The additional files will the projected density of states for each atom in the
  unit cell and each orbital type (s, p, d etc) present. If you look, for
  example at the file `pwscf.pdos_atm#1(C)_wfc#1(s)`, you'll see we have three
  columns: energy, a column labelled `ldos` and a column labelled `pdos`. For
  s-orbitals we only have one value of the magnetic quantum number ml, so there
  is only one pdos column, and the ldos and pdos columns are equivalent. If you
  look at the file `pwscf.pdos_atm#1(C)_wfc#2(p)` you'll see we now have 5
  columns: energy, ldos, and 3 pdos columns. ldos gives the sum of the three
  pdos columns, and each pdos column is for a different value of ml (3 for a
		  p-orbital).

  绘图？

### todo

  - Calculate and plot, in whichever way you think best shows the important
    features and differences, the projected density of states for both silicon
      and aluminium.
      - How do these compare to each other, and the example diamond calculation?


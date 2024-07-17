
#  力的计算 methane
设置

In Quantum Espresso you can enable the calculation of forces and stresses by
setting `tprnfor = .true.` and `tstress = .true.` respectively in the
`CONTROL` section of the input file.

当收敛时，总的力应该为0.


```bash
awk '/kinetic-energy/{ecut=$4}
     /!.*total/{etot=$5}
     /Total force/{totfor=$4}
     /total.*stress/{print ecut, etot, totfor, $6}' *out
```

convergence 测试：

![energy-force-stress](image-1.png)

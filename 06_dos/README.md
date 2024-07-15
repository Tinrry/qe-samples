### 计算固体电子的DOS

运行 [`./run_all.sh`](04_densityofstates/01_diamond/run_all.sh).

生成的`pwscf.dos` 包含：

1. Energy (eV)
2. Density of States (states/eV)
3. Integrated Density of States (states)


费米能级在 `pwscf.dos`第一行

```
plot "pwscf.dos" using ($1-13.180):2 with lines
```
Where we have used 13.180 as the value of the Fermi energy. 

![](image-3.png)
```
set ytics nomirror
set y2tics
set xlabel "Energy (eV)"
set ylabel "Density of states"
set y2label "Integrated density of states"
set key top left
plot "pwscf.dos" using ($1-13.180):2 with lines title "Density of States", \
     "pwscf.dos" using ($1-13.180):3 axes x1y2 with lines title \
     "Integrated density of states"
pause mouse
```
脚本保存在plotdos.gplt

![alt text](image-5.png)

------------------------------------------------------------------------------

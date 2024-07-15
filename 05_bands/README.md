###  计算固体的能带结构

从KS状态计算电子密度`n^(i)`，使用电子密度生成KS势能，求解KS方程进行下一轮迭代生成新的KS势能。when `|n^(i+1) - n^(i)| < thr`结束收敛


 `gnuplot plotbands.gplt`

 ![alt text](image.png)

[`plotbands_shifted.gplt`](02_bandstructure/01_diamond/plotbands_shifted.gplt)


![alt text](image-2.png)



# TRAF6regulation

Paper title, authors

## TAK1IKKmodel
This mathematical model reproduces TAK1-IKK reactions in B cells. The model is based on and modified the previous model ([ref](https://github.com/kntrinoue/Shinohara2014Science)). The model is added MALT1 and TRAF6 regulations to TAK1 and IKK activation. The equation of the model is follows:

```math
\begin{align} 
 \frac{d[TAK1^*]}{dt} = k_{5z}[TAK1] - \frac{k_{6t}[TAK1^*]}{k_{6m}+[TAK1^*]} + \frac{(k_{5ta}\textcolor{red}{+MALT1+TRAF6})signal(t)[TAK1]}{k_{5ma}+[TAK1]} + \frac{k_{5tb2}[IKK2][TAK1]}{k_{5mb2}+[TAK1]} + \frac{k_{5tb3}[IKK3][TAK1]}{k_{5mb3}+[TAK1]} \qquad   (1)
\end{align}
```
```math
\begin{align}
 \frac{d[IKK2]}{dt} = \frac{(k_{1ta}\textcolor{red}{+TRAF6})[TAK1^*][IKK1]}{k_{1ma}+[IKK1]} - \frac{k_{1tb}[IKK2]}{k_{1mb}+[IKK2]} - \frac{k_{2ta}[IKK2]}{k_{2ma}+[IKK2]} - \frac{k_{2tb}[IKK2][IKK3]}{k_{2mb}+[IKK2]} +  \frac{k_{2tc}[IKK3]}{k_{2mc}+[IKK3]} \qquad (2)
\end{align}
```
```math
\begin{align}
 &\frac{d[IKK3]}{dt} = \frac{k_{2ta}[IKK2]}{k_{2ma}+[IKK2]} + \frac{k_{2tb}[IKK2][IKK3]}{k_{2mb}+[IKK2]} - \frac{k_{2tc}[IKK3]}{k_{2mc}+[IKK3]} -   \frac{k_{3t}[IKK3]}{k_{3m}+[IKK3]} \qquad (3)&
\end{align}
```
```math
\begin{align}
 \frac{d[IKK4]}{dt} =  \frac{k_{3t}[IKK3]}{k_{3m}+[IKK3]}  -  \frac{k_{4t}[IKK4]}{k_{4m}+[IKK4]} \qquad (4)
\end{align}
```
```math
\begin{align}
 TAK1_{TOTAL} = 1 = [TAK1] + [TAK1^*] \qquad (5)
\end{align}
```
```math
\begin{align}
 IKK_{TOTAL} = 1 = [IKK1] + [IKK2] + [IKK3] + [IKK4] \qquad (6)
\end{align}
```


```math
\begin{align}
 &signal(t) = 
\begin{cases}
s_{base} \qquad  (if  \quad t \leq t_{delay})\\
\frac{s_{input}-s_{base}}{t_{raise}}(t-t_{delay})+s_{base}  \qquad (if \quad  t_{delay} < t \leq t_{raise}+t_{delay})\\
s_{input}  \qquad  (if \quad  t_{raise}+t_{delay} < t \leq t_{pulse}+t_{raise}+t_{delay})\\
(s_{input}-s_{late})exp(-\frac{t-t_{pulse}-t_{raise}-t_{delay}}{t_{decay}})+s_{late}  \qquad (otherwise)\\
\end{cases}
\end{align}
```

The parameter values in TAK1 and IKK reactions are in the file ([getParam.m](https://github.com/kntrinoue/TRAF6regulation/blob/main/TAK1IKKmodel/getParam.m)). The parameter values in signal are in ([getSimulation.m](https://github.com/kntrinoue/TRAF6regulation/blob/main/TAK1IKKmodel/getSimulation.m)).


## CBmodel
This mathematical model reproduces the degree of CARMA1-Bcl10 interaction in B cells. C is CARMA1. B is Bcl10. Tr6I is a TRAF6-mediated inhibitor to CARMA1-Bcl10 interaction. The equation of the model is follows:


```math
\begin{align}
 \frac{d[C]}{dt} =  - k_{1} \cdot signal \cdot [C] \cdot [B] +  k_{2} \cdot Tr6I \cdot [CB] \qquad (1)
\end{align}
```
```math
\begin{align}
 \frac{d[B]}{dt} =  - k_{1} \cdot signal \cdot [C] \cdot [B] +  k_{2} \cdot Tr6I \cdot [CB] \qquad (2)
\end{align}
```
```math
\begin{align}
 \frac{d[CB]}{dt} =  k_{1} \cdot signal \cdot [C] \cdot [B] -  k_{2} \cdot Tr6I \cdot [CB] \qquad (3)
\end{align}
```

The parameter values  are in the file ([getParam.m](https://github.com/kntrinoue/TRAF6regulation/blob/main/CBmodel/getParam.m)). The signal and Tr6I are used step function ([diffeq.m](https://github.com/kntrinoue/TRAF6regulation/blob/main/CBmodel/diffeq.m)).

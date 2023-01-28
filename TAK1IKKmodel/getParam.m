function getParam()

global param;

param.pTAK.TRAF6=0.4*1e+3;

param.pTAK.MALT1=0.7*1e+3;

param.pTAK.k6t=4.31*1e3;
param.pTAK.k6m=1.43;
param.pTAK.k5ta=1.75*1e+3 - param.pTAK.MALT1 - param.pTAK.TRAF6;
param.pTAK.k5ma=5.52*1e-2;
param.pTAK.k5tb2=9.36*1e2;
param.pTAK.k5mb2=1.02*1e-3;
param.pTAK.k5tb3=2.76*1e3;
param.pTAK.k5mb3=1.02*1e-2;
param.pTAK.k5z=4.15*1e2;

param.pIKK1.TRAF6=7.00*1e-1;

param.pIKK1.k1ta=9.61*1e-1 - param.pIKK1.TRAF6;
param.pIKK1.k1ma=9.86*1e-1;
param.pIKK1.k1tb=2.59*1e-1;
param.pIKK1.k1mb=2.02*1e-1;
param.pIKK2.k2ta=1.12*1e-6;
param.pIKK2.k2ma=3.56;
param.pIKK2.k2tb=3.49*1e1;
param.pIKK2.k2mb=1.56;
param.pIKK2.k2tc=6.41;
param.pIKK2.k2mc=1.76;

param.pIKK3.k3t=3.01*1e-1;
param.pIKK3.k3m=4.50*1e-1;

param.pIKK3.k4t=1.14*1e-1;
param.pIKK3.k4m=2.60;


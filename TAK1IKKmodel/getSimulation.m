function [T, Y] = getSimulation(tspan)

global param totalTAK totalIKK;

getParam;

totalTAK=1;
totalIKK=1;


%********** INITIAL VALUES
y0(1) = 0;      % pTAK
y0(2) = 0;      % pIKK
y0(3) = 0;     % ppIKK
y0(4) = 0;     % pppIKK
%%


global term;

%input parameter
global sinput tpulse traise tdecay sbase tdelay slate;
global celltype;
sinput2 =  1.0;  sinput=sinput2;
sbase2 = 0.1;    sbase=sbase2;
tpulse2 = 0.075; tpulse=tpulse2;
traise2 = 1.0;   traise=traise2;
tdecay2 = 1.5;   tdecay=tdecay2;
slate2 = 0.27;   slate=slate2;
    
tdelay2 = 2;     tdelay=tdelay2;

if celltype==1
    tdecay2 = 1.5;   tdecay=tdecay2;
    slate2 = 0.27;   slate=slate2;
elseif celltype==2
    param.pTAK.TRAF6=0;
    param.pIKK1.TRAF6=0;
elseif celltype==3
    param.pTAK.MALT1=0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Time course

options = odeset('RelTol',1e-8,'AbsTol',1e-8);

%pre-process for steady-state value
term=0;
[T1, Y1] = ode15s(@diffeq,[0 5000],y0,options);

%Simulation for dynamics
term=1;
[T2, Y2] = ode15s(@diffeq,tspan,Y1(end,:),options);
T=T2;Y=Y2;
clear T1 T2 Y1 Y2

function [T, Y] = getSimulation(tspan)

global term;

getParam;

%********** INITIAL VALUES
y0(1) = 1;      % CARMA1
y0(2) = 1;      % BCL10
y0(3) = 0;     % CARMA1:BCL10
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Time course

options = odeset('RelTol',1e-9,'AbsTol',1e-9);

%pre-process for steady-state value
term=0;
[T1, Y1] = ode15s(@diffeq,[0 5000],y0,options);

%Simulation for dynamics
term=1;
[T2, Y2] = ode15s(@diffeq,tspan,Y1(end,:),options);
T=T2;Y=Y2;
clear T1 T2 Y1 Y2

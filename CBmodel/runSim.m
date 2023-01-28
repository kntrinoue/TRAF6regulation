%Dynamic simulation
close all
clear all

global celltype model;

tspan=[0 9];

%signal-independent
model=1;

% Wildtype cell
celltype=1;
[T1, Y1] = getSimulation(tspan);

% TRAF6 NM cell
celltype=2;
[T2, Y2] = getSimulation(tspan);

figure;
hold on
plot(T1, Y1(:,3), 'k-','LineWidth',2);
plot(T2, Y2(:,3), 'r-','LineWidth',2);
set(gca,'LineWidth',2,'FontSize',16,'FontName','Arial');
xlabel('Time[min]','FontName','Arial','FontSize',18);
ylabel('CARMA1-Bcl10 interaction','FontName','Arial','FontSize',18);
xlim([0 9]);
ylim([0 1]);
legend({'WT','Traf6^-^/^-'},'Location','north', 'FontSize', 16);
box on
hold off
saveas(gcf, 'signalindependentCB.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%signal-dependent
model=2;

% Wildtype cell
celltype=1;
[T1, Y1] = getSimulation(tspan);

% TRAF6 NM cell
celltype=2;
[T2, Y2] = getSimulation(tspan);

figure;
hold on
plot(T1, Y1(:,3), 'k-','LineWidth',2);
plot(T2, Y2(:,3), 'r-','LineWidth',2);
set(gca,'LineWidth',2,'FontSize',16,'FontName','Arial');
xlabel('Time[min]','FontName','Arial','FontSize',18);
ylabel('CARMA1-Bcl10 interaction','FontName','Arial','FontSize',18);
xlim([0 9]);
ylim([0 1]);
%legend({'WT','Traf6^-^/^-'},'Location','Best');
box on
hold off
saveas(gcf, 'signaldependentCB.png');



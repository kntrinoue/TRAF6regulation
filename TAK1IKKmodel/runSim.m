%Dynamic simulation
close all
clear all

global celltype;

tspan=[0 120];


celltype=1;
[T1, Y1] = getSimulation(tspan);
%parameter scaling
Yf1(:,1)=114.6315.*Y1(:,1);
Yf1(:,2)=102.4261.*Y1(:,2);
Yf1(:,3)=305.*Y1(:,3);
Yf1(:,4)=Yf1(:,2)+Yf1(:,3);


celltype=2;
[T2, Y2] = getSimulation(tspan);
Yf2(:,1)=114.6315.*Y2(:,1);
Yf2(:,2)=102.4261.*Y2(:,2);
Yf2(:,3)=305.*Y2(:,3);
Yf2(:,4)=Yf2(:,2)+Yf2(:,3);


celltype=3;
[T3, Y3] = getSimulation(tspan);
Yf3(:,1)=114.6315.*Y3(:,1);
Yf3(:,2)=102.4261.*Y3(:,2);
Yf3(:,3)=305.*Y3(:,3);
Yf3(:,4)=Yf3(:,2)+Yf3(:,3);



figure;
hold on
plot(T1-2, Yf1(:,1), 'k-','LineWidth',2);
plot(T2-2, Yf2(:,1), 'r-','LineWidth',2);
plot(T3-2, Yf3(:,1), 'b-','LineWidth',2);
set(gca,'LineWidth',2,'FontSize',16,'FontName','Arial');
xlabel('Time [min]','FontName','Arial','FontSize',18);
ylabel('TAK1 activity','FontName','Arial','FontSize',18);
xlim([-0.5 9.5]);
ylim([0 125]);
%legend({'WT','TRAF6^-^/^-','MALT1^-^/^-'},'Location','Best');
box on
hold off
saveas(gcf, 'TAK1.png');

figure;
hold on
plot(T1-2, Yf1(:,4), 'k-','LineWidth',2);
plot(T2-2, Yf2(:,4), 'r-','LineWidth',2);
plot(T3-2, Yf3(:,4), 'b-','LineWidth',2);
set(gca,'LineWidth',2,'FontSize',16,'FontName','Arial');
xlabel('Time [min]','FontName','Arial','FontSize',18);
ylabel('IKK activity','FontName','Arial','FontSize',18);
xlim([-0.5 9.5]);
ylim([0 125]);
legend({'WT','TRAF6^-^/^-','MALT1^-^/^-'},'Location','Best', 'FontSize', 16);
box on
hold off
saveas(gcf, 'IKK.png');


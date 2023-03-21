%%% Stability diagram for the May-Leonard with mutations
%--------------------------
% This m-file plots figure 3 in May-Leonard Paper
% Locus of fold bifurcations found using AUTO07, 



clear; clc; close all

% From AUTO07

foldR050 = csvread('Data/Foldmu_beta_0_5_R.csv'); 
foldTR050 = csvread('Data/Foldmu_beta_0_5_TR.csv'); 
foldTL050 = csvread('Data/Foldmu_beta_0_5_TL.csv'); 

foldR150 = csvread('Data/Foldmu_beta_1_5_R.csv'); 
foldTR150 = csvread('Data/Foldmu_beta_1_5_TR.csv'); 
foldTL150 = csvread('Data/Foldmu_beta_1_5_TL.csv'); 

%%% Plots

fs = 22;

figure(1)
plot(foldR050(:,2),foldR050(:,1),'b','LineWidth',2)
set(gca, 'FontSize', 16)
hold on
plot(foldTR050(:,2),foldTR050(:,1),'b','LineWidth',2)
plot(foldTL050(:,2),foldTL050(:,1),'b','LineWidth',2)
plot(linspace(0,1,100),ones(100,1)*(1/0.5), 'k-.')
xline(0.03,':')
hold off
xlabel('\mu')
ylab1 = ylabel('\alpha','rotation',0);

axis([0 1 0 4])
annotation('textbox',[0.2054 0.7476 0.0464 0.0609],...
    'String',{'2'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.6455 0.2519 0.0590 0.0632],...
    'String',{'2'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.4964 0.6547 0.0590 0.0632],...
    'String',{'3'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.2436 0.3433 0.0591 0.0632],...
    'String',{'3'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');

ylab1.Position(1) = ylab1.Position(1) - 0.03;  % move the label to the left



figure(2)
plot(foldR150(:,2),foldR150(:,1),'b','LineWidth',2)
set(gca, 'FontSize', 16)
hold on
plot(foldTR150(:,2),foldTR150(:,1),'b','LineWidth',2)
plot(foldTL150(:,2),foldTL150(:,1),'b','LineWidth',2)
plot(linspace(0,1,100),ones(100,1)*(1/1.5), 'k-.')
xline(0.03,':')
hold off
xlabel('\mu')
ylab2 = ylabel('\alpha','rotation',0);
axis([0 1 0 4])

annotation('textbox',[0.1197 0.4681 0.0580 0.0643],...
    'String',{'1'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.2357 0.6442 0.0580 0.0643],...
    'String',{'2'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.6750 0.1799 0.0580 0.0643],...
    'String',{'2'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.6071 0.5561 0.0580 0.0643],...
    'String',{'3'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');
annotation('textbox',[0.2786 0.1871 0.0580 0.0643],...
    'String',{'3'},'FontSize',fs,'EdgeColor','none','FontWeight','bold');

ylab2.Position(1) = ylab2.Position(1) - 0.03;  % move the label to the left

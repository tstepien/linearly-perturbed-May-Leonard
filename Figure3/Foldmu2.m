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


figure(1)
plot(foldR050(:,2),foldR050(:,1),'b','LineWidth',2)
set(gca, 'FontSize', 16)
hold on
plot(foldTR050(:,2),foldTR050(:,1),'b','LineWidth',2)
plot(foldTL050(:,2),foldTL050(:,1),'b','LineWidth',2)
plot(linspace(0,1,100),ones(100,1)*(1/0.5), 'k-.')
hold off
xlabel('\mu')
ylabel('\alpha','rotation',0)
axis([0 1 0 4])


figure(2)
plot(foldR150(:,2),foldR150(:,1),'b','LineWidth',2)
set(gca, 'FontSize', 16)
hold on
plot(foldTR150(:,2),foldTR150(:,1),'b','LineWidth',2)
plot(foldTL150(:,2),foldTL150(:,1),'b','LineWidth',2)
plot(linspace(0,1,100),ones(100,1)*(1/1.5), 'k-.')
hold off
xlabel('\mu')
ylabel('\alpha','rotation',0)
axis([0 1 0 4])



%%% Locus of Bifurcations for the May-Leonard with mutations
%--------------------------

clear; clc; close all

mu = 0.03;
a = (0:0.05:3);
b = (-6*mu-2)/(6*mu-1)-a;

par_cusp = csvread('Cusp.csv');  % From AUTO file in folder Figure2/mlm_cusp_RegionB
par_cusp2= csvread('Cusp2.csv'); %From Autoo file in folder mlm_Cusp2_RegionA
par_cusp3= csvread('Cusp3.csv');

figure(1)
plot(par_cusp(:,1),par_cusp(:,2),'b--','LineWidth',2)
set(gca,'FontSize',16)

hold on
plot(a,b,'k','LineWidth',2)
plot(par_cusp2(:,1),par_cusp2(:,2),'b--','LineWidth',2)
plot(par_cusp3(:,1),par_cusp3(:,2),'b--','LineWidth',2)

hold off
axis([0 4 0 4])
xlabel('\alpha')
ylabel('\beta','rotation',0)


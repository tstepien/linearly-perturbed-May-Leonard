%%% Stability diagram for the May-Leonard with mutations
%--------------------------
% This m-file plots figure 2 in May-Leonard Paper
% Hopf line can be calculated analytically, see Region A paper.
% Locus of fold bifurcations found using AUTO07, see folder
% mlm_cusp_RegionB. 


clear; clc; close all

mu = 0.03;
a = (0:0.05:3);
b = (-6*mu-2)/(6*mu-1)-a;

% From auto

par_cusp = csvread('Cusp.csv'); % from auto file in folder mlm_cusp_RegionB


figure(1)
plot(par_cusp(:,1),par_cusp(:,2),'LineWidth',2)
set(gca, 'FontSize', 16)
hold on
plot(a,b,'LineWidth',2)
hold off
xlabel('\alpha')
ylabel('\beta','rotation',0)
axis([0 4 0 4])

%%% Equilibria emerging from fold bifurcation for the May-Leonard with mutations

clear; clc; close all

%From expansions fixed beta and mu, vary alpha
a = (1.5:0.1:6-0.1);
b = 2;
m=0.03;
[E1,E2,E3] = Expansions(a,b,m);
[F1,F2,F3] = Expansion2Pop(a,b,m);


%From Auto fixed beta and mu, vary alpha
eq = csvread('Alpha2.csv');


figure(1)

plot(a, E1,'b-.','LineWidth',2)
set(gca,'FontSize',16)
hold on
plot(a, E2,'b-.','LineWidth',2)
plot(a, E3,'b-.','LineWidth',2)
plot(a, F1,'r--','LineWidth',2)
plot(a, F2,'r--','LineWidth',2)
plot(a, F3,'r--','LineWidth',2)
plot(eq(1:end-70,1), eq(1:end-70,2),'k')
hold off
xlabel('\alpha')
ylabel('$m_i$','rotation',0, 'Interpreter', 'latex')
yticks([0 0.2 0.4 0.6 0.8 1])


figure(2)
plot(a, E1,'b-.','LineWidth',2)
set(gca,'FontSize',16)
hold on
plot(a, E2,'b-.','LineWidth',2)
plot(a, E3,'b-.','LineWidth',2)
plot(a, F1,'r--','LineWidth',2)
plot(a, F2,'r--','LineWidth',2)
plot(a, F3,'r--','LineWidth',2)
plot(eq(1:end-70,1), eq(1:end-70,2),'k')
hold off
axis([1 6.5 0 0.1 ])
xlabel('\alpha')
ylabel('$m_i$','rotation',0,'Interpreter','latex')
yticks([0 0.02 0.04 0.06 0.08 0.1])


% May Leonard trajectories in Region D
%--------------------------------
% 


clear; clc; close all

%Parameters
alpha = 1.3;
beta = alpha;
mu = 0.03;

%Guess for the equilibrium that bifurcates from double
M0 =[0.4,0.209,0.05];
options = optimoptions(@fsolve,'TolFun',1.0e-15);
M_d = fsolve(@(M)mayleonard(M, alpha,beta, mu),M0, options);

%Guess for the equilibrium that bifurcates from corner
M0 =[1,0,0];
M_c = fsolve(@(M)mayleonard(M, alpha,beta, mu),M0, options);

% Guess for equal parts equilibrium
M0 =[1/2,1/2,1/2];
M_e = fsolve(@(M)mayleonard(M, alpha,beta, mu),M0, options);

% Calculating a trajectory
[t,M_sol] =ode45(@(t,M)mayleonardode(t, M, alpha, beta, mu),[0,1000],[0.01,0.8,0.7]);


%%%Plotting

figure(1)
plot3(M_d(1),M_d(2),M_d(3),'*r','LineWidth',1)
set(gca, 'FontSize',16)
hold on
plot3(M_d(2),M_d(3),M_d(1),'*r','LineWidth',1)
plot3(M_d(3),M_d(1),M_d(2),'*r','LineWidth',1)
plot3(M_c(1),M_c(2),M_c(3),'ob','LineWidth',1)
plot3(M_c(2),M_c(3),M_c(1),'ob','LineWidth',1)
plot3(M_c(3),M_c(1),M_c(2),'ob','LineWidth',1)
plot3(M_e(1),M_e(2),M_e(3),'ob','LineWidth',1)
plot3(M_sol(:,1),M_sol(:,2),M_sol(:,3),'LineWidth',1)
hold off
view([0,90])
xlabel('$m_1$','Interpreter','latex')
label_y = ylabel('$m_2$','rotation',0,'Interpreter','latex');
label_y.Position(2) = 0.42;
zlabel('$m_3$')

figure(2)
plot(t,M_sol(:,1),'LineWidth',2)
set(gca, 'FontSize',16)
xlabel('time')
ylabel('$m_1$','rotation',0,'Interpreter','latex')

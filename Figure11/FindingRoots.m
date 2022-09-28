% May Leonard Region B
%--------------------------------


clear; clc ; close all

alpha = 1.322422;
beta =1.60177;
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
[t,M_sol] =ode45(@(t,M)mayleonardode(t, M, alpha, beta, mu),[0,4500],M_e+[0.1,0,0]);

%%%Plotting
al_str = num2str(alpha);
be_str = num2str(beta);
fig_title = strcat('\alpha =' , al_str,' ,', '\beta = ', be_str);


figure(1)
plot3(M_d(1),M_d(2),M_d(3),'*r','LineWidth',1)
set(gca, 'FontSize',16)
hold on
plot3(M_d(2),M_d(3),M_d(1),'*r','LineWidth',1)
plot3(M_d(3),M_d(1),M_d(2),'*r','LineWidth',1)
plot3(M_c(1),M_c(2),M_c(3),'ob','LineWidth',1)
plot3(M_c(2),M_c(3),M_c(1),'ob','LineWidth',1)
plot3(M_c(3),M_c(1),M_c(2),'ob','LineWidth',1)
plot3(M_e(1),M_e(2),M_e(3),'ok','LineWidth',1)
plot3(M_sol(:,1),M_sol(:,2),M_sol(:,3),'LineWidth',1)
hold off
view([0,90])
xlabel('$m_1$','Interpreter','latex')
label_y = ylabel('$m_2$','rotation',0,'Interpreter','latex');
label_y.Position(2) = 0.33;
zlabel('$m_3$','Interpreter','latex')

figure(2)
plot(t,M_sol(:,1),'LineWidth',2)
set(gca, 'FontSize',16)
xlabel('time')
label_y = ylabel('$m_1$','rotation',0,'Interpreter','latex');
label_y.Position(2) = 0.33;
yticks([0 0.1 0.2 0.3 0.4 0.5])

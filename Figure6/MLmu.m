clear all;	clc;

% Run MayLeonard + mutation
mu = 0.03;
%a = 1.3; b = -a +(6*mu+2)/(1-6*mu);
a = 1.2; b = -a +(6*mu+2)/(1-6*mu);

m0 = [0.5 0.4 0.1];


opts = odeset('RelTol', 1e-5, 'MaxStep', 1);
[t,m] = ode45(@(t,m)derivMLmu(t,m,a,b,mu), [0 2000], m0, opts);

figure; hold on;
plot(t,m(:,1), 'LineWidth',1);
plot(t,m(:,2), '--', 'LineWidth',1);
plot(t,m(:,3), ':', 'LineWidth',1);
ylim([0 0.6])
legend('$m_1$', '$m_2$', '$m_3$', 'interpreter','latex', 'Fontsize', 12);
xlabel('$t$','interpreter','latex','Fontsize', 16)
ylabel('$m_i$','interpreter','latex','Rotation', 0, 'Fontsize', 16)
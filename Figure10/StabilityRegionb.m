%Stability of fixed poinst in Region b 

%From Auto fixed beta and mu, vary alpha
clear; clc; close all
mu = 0.03;
beta = 2;

eq = csvread('Alpha2.csv');
S = size(eq);

Equi = eq(1:4:end-70,2:end);
alpha = eq(1:4:end-70,1);
Eig = zeros(length(alpha),3);
Stab = zeros(length(alpha),1);
for ii =1:length(alpha)
    M = Equi(ii,:);
    J = Jacobian(M, alpha(ii), beta, mu);
    eigenv = eig(J);
    aux = 0;
    
    for k =1:3
        
        if real(eigenv(k))< 0 
            aux= aux +1;
        else
            aux = aux;
        end
    end
    Stab(ii)= aux;
    Eig(ii,:) = eigenv';
end

   
ind = find(Stab ==2);
ind2 = find(Stab==3);

figure(1)
plot(eq(:,1),eq(:,2),'k','LineWidth',1)
set(gca, 'FontSize',16)
hold on 
plot(alpha(ind), Equi(ind,1),'r*','LineWidth',1)
plot(alpha(ind2), Equi(ind2,1),'bo','LineWidth',1)
hold off
xlabel('\alpha')
ylabel('$m_i$','rotation',0,'Interpreter','latex')
yticks([0 0.2 0.4 0.6 0.8 1])

figure(2)
plot(eq(:,1),eq(:,2),'k','LineWidth',1)
set(gca, 'FontSize',16)
hold on 
plot(alpha(ind), Equi(ind,1),'r*','LineWidth',1)
plot(alpha(ind2), Equi(ind2,1),'bo','LineWidth',1)
hold off
xlabel('\alpha')
ylabel('m_i','rotation',0,'Interpreter','latex')
axis([1 7 0 0.1])
yticks([0 0.02 0.04 0.06 0.08 0.1])


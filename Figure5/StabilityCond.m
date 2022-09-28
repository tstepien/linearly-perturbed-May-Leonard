% condition alpha + beta < (6mu+2)/(1-6mu)
alpha = 0:0.1:6;
mu = 0:0.03:0.12;
LineS = {'-', '--', ':', '-.', '-'};
figure; 

for k = 1:length(mu)
   beta = -alpha + (6*mu(k)+2)/(1-6*mu(k));
   p = plot(alpha,beta);
   p.LineWidth = 2;
   p.LineStyle = LineS{k};
   hold on;
end

xlabel('\alpha', 'FontSize', 16);
ylabel('\beta', 'Rotation', 0, 'FontSize', 16);
legend({strcat('\mu=', num2str(mu(1),'%d')), ...
    strcat('\mu=', num2str(mu(2),'%.2f')), ...
    strcat('\mu=', num2str(mu(3),'%.2f')), ...
    strcat('\mu=', num2str(mu(4),'%.2f')), ...
    strcat('\mu=', num2str(mu(5),'%.2f')), ...
	},'Location','southeast', 'Fontsize', 12)
axis equal; 
xlim([0 6]);    ylim([0 6]);

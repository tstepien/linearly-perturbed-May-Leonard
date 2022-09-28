%% choose grayscale or color figure by commenting out the correct lines
%%% grayscale figure
% colorleft = [0.5,0.5,0.5];
% colorright = [0,0,0];

%%% color figure
colorleft = [0, 0.4470, 0.7410];
colorright = [0.9290, 0.6940, 0.1250];

%% plot
fstitle = 22;
fslabelx = 24;
fslabely = 18;
fsticks = 16;
fslegend = 16;

figure

colororder([colorleft;colorright]);
set(gca,'FontSize',fsticks)

yyaxis right
plot(T,theta,'-','LineWidth',1.5,'Color',colorright)
label_degree = ylabel('$(^{\circ})$','Interpreter','latex','FontSize',fslabely,'Rotation',0);
ylim([-60,10])

yyaxis left
plot(T,R,'--',T,Z,':','LineWidth',1.5,'Color',colorleft)

xlabel('$t$','Interpreter','latex','FontSize',fslabelx)

legend('$R$','$Z$','$\theta$','Interpreter','latex','FontSize',fslegend,...
    'Location','east')

label_degree.Position(1) = 546;
label_degree.Position(2) = -22;
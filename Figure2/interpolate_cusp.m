cusp = dlmread('Cusp.csv');
ind = find((diff(cusp(:,1))>0),1,'first');

bound_left = 1.267435;
bound_right = 1.4;

querypts = linspace(bound_left,bound_right,10000)';
interppts_bottom = interp1(cusp(1:ind,1),cusp(1:ind,2),querypts);
interppts_top = interp1(cusp(ind:end,1),cusp(ind:end,2),querypts);

figure
hold on
scatter(querypts,interppts_bottom)
scatter(querypts,interppts_top)

x = linspace(1.26,bound_right,100);
y = -x + (6*0.03+2)/(1-6*0.03);
plot(x,y)
hold off

cusp_bottom = [querypts , interppts_bottom];
cusp_top = [querypts , interppts_top];

%%% uncomment the next line to save the variables to a .mat file
% save('Cusp_interp.mat','cusp_bottom','cusp_top','-mat');
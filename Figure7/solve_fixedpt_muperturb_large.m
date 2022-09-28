clear variables;
clc;

%% parameters
param.beta = 2;
param.alpha = param.beta;
param.muperturb = 0.005;
param.mu = (param.alpha+param.beta-2) / (6*(1+param.alpha+param.beta)) ...
    + param.muperturb;

%% initial condition
R0 = 0.1666;
theta0 = -pi/3+0.01;
Z0 = 0.11075;
t0 = 0;
tf = 500;

%% solve ODE with ode23s
% options = odeset('MaxStep',5e-4);
[T,X] = ode23s(@(t,x) MLcylindricalperturb(t,x,param),[t0,tf],...
    [R0,theta0,Z0]);%,options);

R = X(:,1);
theta = wrapTo180(rad2deg(X(:,2))); % convert from radians to degrees between [-180,180]
Z = X(:,3);

%% figures: same axes
plots_same_axes

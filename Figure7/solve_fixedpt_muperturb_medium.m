clear variables;
clc;

%% parameters
param.beta = 2;
param.alpha = param.beta;
param.muperturb = 0.003;
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

%% compare analytic and numerical fixed points
Rplus = param.beta/(6*(1 + param.beta)) - (1 + 2*param.beta)*param.mu/(3*(1 + param.beta)) ...
    + sqrt((param.beta - 1)*(2 + param.beta)^2*(8*param.mu^2 - 1 + param.beta*(1 - 4*param.mu)^2))...
    /(6*(param.beta^2 - 1));
Rminus = param.beta/(6*(1 + param.beta)) - (1 + 2*param.beta)*param.mu/(3*(1 + param.beta)) ...
    - sqrt((param.beta - 1)*(2 + param.beta)^2*(8*param.mu^2 - 1 + param.beta*(1 - 4*param.mu)^2))...
    /(6*(param.beta^2 - 1));
Zplus = (param.beta - 1)/((2 + param.beta)*(1 + 2*param.beta)) ...
    - 3*param.mu/(2 + param.beta) + (param.beta - 1)/(2 + param.beta)*Rplus;
Zminus = (param.beta - 1)/((2 + param.beta)*(1 + 2*param.beta)) ...
    - 3*param.mu/(2 + param.beta) + (param.beta - 1)/(2 + param.beta)*Rminus;

Method = {'Numerical';'Analytical (-)';'Analytical (+)'};
Rstar = [R(end) ; Rminus ; Rplus];
Zstar = [Z(end) ; Zminus ; Zplus];

table(Method,Rstar,Zstar)

%% figures: same axes
plots_same_axes

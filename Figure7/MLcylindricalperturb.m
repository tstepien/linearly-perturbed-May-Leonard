function dRtZ = MLcylindricalperturb(t,RtZ,param)
% dRtZ = MLcylindricalperturb(t,RtZ,param)
%
% right hand side of linearly perturbed May-Leonard equations in 
% generalized cylindrical coordinates from Phillipson, Schuster, and 
% Johnston (1985)
%
% inputs:
%   RtZ   = [R,theta,Z] = cylindrical coodinates
%   param = [alpha,beta] = parameters
%
% output:
%   dRtZ = [dR,dtheta,dZ]

R = RtZ(1);
theta = RtZ(2);
Z = RtZ(3);

alpha = param.alpha;
beta = param.beta;
mu = param.mu;

sigma = alpha+beta+1;
lambda = ((alpha+beta)/2 - 1)/sigma;
omega = sqrt(3)*(beta-alpha)/(2*sigma);

dR = (lambda-3*mu)*R - sigma*R^2 * ( omega*sin(3*theta) - lambda*cos(3*theta) ) ...
    - (sigma+3)/2 * R*Z;
dtheta = omega - sigma*R * ( omega*cos(3*theta) + lambda*sin(3*theta) ) ...
    + sigma*omega*Z;
dZ = -Z - sigma*Z^2 + 2*lambda*sigma*R^2;

dRtZ = [dR ; dtheta ; dZ];
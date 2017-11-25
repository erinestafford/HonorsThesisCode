function [grad] = grad_fdm_ODE(X,func,mord,atol, obj_fn)
% finite difference approximation of the gradient of func at X
%
% input:
% X is an n dimensional column vector
% func is the function handle mapping R^n to R^1
% mord =+1 one-sided forward differences
%      =-1 one-sided backward differences
%      =+2 second-order central differences
%      note mord=2 takes twice as many function values
% atol = estimate of the accuracy of func *** not used yet ******
%
% output:
% grad is the n dimensional column vector of partial derivatives
% e.g.  grad = [f_x; f_y; f_z; ...]
nx = length(X);
dx = 1.e-3; % dimensional delta X, use atol to set
xdiff=X;
grad = NaN(length(X), 1);
 % centered differences
for ix=1:nx
    xdiff(ix) = X(ix)+ dx;
    fp = obj_fn(xdiff);
    xdiff(ix)=X(ix)-dx;
    fm = obj_fn(xdiff);
    grad(ix)=(fp-fm)/(2.0*dx);
    xdiff(ix)=X(ix);
end
    
end
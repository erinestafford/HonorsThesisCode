function [hess] = hess_fdm_ODE(X,func, obj_fn)
% finite difference approximation of the hessian of func at X
% **** this routine needs to be fully debugged and optimized for fewer function evaluaitons****

% input:
% X is an n dimensional column vector
% func is the function handle mapping R^n to R^1
% mord = 2 second order is all that is currently available
% atol = estimate of the accuracy of func
% ****** note mord and atol not implimented yet ******
%
% output:
% hess is the nxn dimensional matrix of partial derivatives
% e.g. in 2 dimensions hess = [f_xx fxy ; f_yx fyy]

nx = length(X);
hess = NaN(nx,nx);
dx = 1.e-3; % dimensional delta X
xdiff=X;

for ix=1:nx
    xdiff(ix) = X(ix)+ dx;
    [gradp] = grad_fdm_ODE(xdiff,func,2,eps, obj_fn);
    xdiff(ix)=X(ix)-dx;
    [gradm] = grad_fdm_ODE(xdiff,func,2,eps, obj_fn);
    hess(:,ix)=(gradp-gradm)/(2*dx);
    xdiff(ix)=X(ix);
end



end
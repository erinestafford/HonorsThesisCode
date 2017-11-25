function eval = fnEvalODE(params, fn, array_names, init_cond, obj_fn)
%% get gradient & hessian 
tspan = [0:1:100];
evalfn = @(p)fn(tspan, init_cond, p);
obj = @(p)obj_fn(evalfn, p);
gradient = grad_fdm_ODE(struct2array(params,array_names), evalfn,2,[], obj)
hessian = hess_fdm_ODE(struct2array(params,array_names), evalfn, obj)
[eigenvectors,eigenvalues] = eig(hessian)
% testSVD(hessian)
%% plotting
[a, b] = meshgrid([-5:1:5], [-5:1:5]);
how_many = numel(a);
for i = 1:how_many
    params1 = params;
    params1.a = a(i);
    params1.b = b(i);
    z(i) = obj(params1);
    
end

z = reshape(z,size(a));
figure()
contour(a,b,z,40);
xlabel('a values');
ylabel('b values');
hold on
d = diag(eigenvalues);
e1 = eigenvectors(:,1);
e2 = eigenvectors(:,2);
solution = [params.a, params.b];
plot1 = quiver(solution(1),solution(2),solution(1)*e1(1)+e1(1),solution(2)*e1(2)+e1(2),2);
plot2 = quiver(solution(1),solution(2),solution(1)*e2(1)+e2(1),solution(2)*e2(2)+e2(2),2);
% plot1=plot(e1);
% plot2=plot(e2);
legend([plot1,plot2],num2str(d(1)), num2str(d(2)))
plot(solution(1),solution(2), 'bo')
end
function eval = fnEval(params, fn, array_names)
%% plot
if numel(struct2array(params,array_names)) <= 2
    [X,Y] = meshgrid(linspace(-5,5),linspace(-5,5));
    params2 = params;
    params2.x = X;
    params2.y = Y;
    Z = fn(params2);
    figure()
    %subplot(1,2,1)
    contour(X,Y,Z, 40);
    xlabel('X') 
    ylabel('Y') 
    hold on
    %subplot(1,2,2)
    %surf(X,Y,Z)
    %plot3(X,Y,Z)
end
if numel(struct2array(params,array_names)) == 3
    [X,Y] = meshgrid(linspace(-50,50),linspace(-50,50));
    [X,Z] = meshgrid(linspace(-50,50),linspace(-50,50));
    params2 = params;
    params2.x = X;
    params2.y = Y;
    params2.z = Z;
    W = fn(params2);
    figure()
    subplot(1,2,1)
    contour(X,Y,W, 40);
    subplot(1,2,2)
    contour(X,Z,W, 40);
    %surf(X,Y,Z)
    %plot3(X,Y,Z)
end
%% find solution
lb = struct2array(params,array_names);
ub = struct2array(params,array_names);
for i = 1:length(array_names)
    name = array_names{i};
    [lb, ub] = range(lb, ub, name, -5, 5, array_names);
end
init_parray = (ub-lb)/2;
% syms x y;
% hessian(fn([x,y]), [x,y])
% gradient(fn([x,y]), [x,y])
% e = eig(h)
solution = fminsearch(fn, init_parray)
gradient = grad_fdm(solution, fn, 2)'
hessian = hess_fdm(solution, fn)'
[eigenvectors,eigenvalues] = eig(hessian)
d = diag(eigenvalues);
x = [0 5];
e1 = eigenvectors(:,1)
e2 = eigenvectors(:,2)

plot1 = quiver(solution(1),solution(2),solution(1)*e1(1)+e1(1),solution(2)*e1(2)+e1(2),0);
plot2 = quiver(solution(1),solution(2),solution(1)*e2(1)+e2(1),solution(2)*e2(2)+e2(2),2);
% plot1=plot(e1);
% plot2=plot(e2);
legend([plot1,plot2],num2str(d(1)), num2str(d(2)))
plot(solution(1),solution(2), 'bo')
%[parray, ~, ~,~,~,grad, hes] = fmincon(fn, solution, [],[],[],[], lb,ub )
%testSVD(hessian)

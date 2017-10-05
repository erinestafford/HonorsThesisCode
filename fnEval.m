function eval = fnEval(params, fn, array_names)
%% plot
if numel(struct2array(params,array_names)) <= 2
    [X,Y] = meshgrid(linspace(-50,50),linspace(-50,50));
    params2 = params;
    params2.x = X;
    params2.y = Y;
    Z = fn(params2);
    figure()
    subplot(1,2,1)
    contour(X,Y,Z);
    subplot(1,2,2)
    surf(X,Y,Z)
    %plot3(X,Y,Z)
end
%% find solution
lb = struct2array(params,array_names);
ub = struct2array(params,array_names);
for i = 1:length(array_names)
    name = array_names{i};
    [lb, ub] = range(lb, ub, name, -5, 5, array_names);
end
init_parray = (ub+lb)/2;
syms x y;
h = hessian(fn([x,y]), [x,y])
g = gradient(fn([x,y]), [x,y])
e = eig(h)
solution = fminsearch(fn, init_parray);
%[parray, ~, ~,~,~,grad, hes] = fmincon(fn, solution, [],[],[],[], lb,ub )

function eval = fnEval(params, fn, array_names)
%% find solution
lb = struct2array(params,array_names);
ub = struct2array(params,array_names);
[lb, ub] = range(lb, ub, 'x', -50, 50, array_names);
[lb, ub] = range(lb, ub, 'y', -50, 50, array_names);
init_parray = (ub+lb)/2;
[parray, ~, ~,~,~,grad, hes] = fmincon(fn, init_parray, [],[],[],[], lb,ub )
end
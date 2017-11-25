function val = obj_fn_spring(base_val,fn, params)
 val = (1/2)*sum(abs((base_val - fn(params))).^2);
end
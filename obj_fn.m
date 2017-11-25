function val = obj_fn(base_val,fn, params)
val = sum((base_val - fn(params)).^2);
end
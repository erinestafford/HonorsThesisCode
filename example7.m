function out = example7(param_array,array_names)
if isstruct(param_array) ~= true
    params = array2struct(param_array, array_names); 
else
    params = param_array;
end
out= (1-params.x)^2 + (2-params.y)^2 + (3-params.z)^2;
end
function out = example10(param_array,array_names)
if isstruct(param_array) ~= true
    params = array2struct(param_array, array_names); 
else
    params = param_array;
end
out= (params.x*params.y)^2 + params.z^2 ;
end
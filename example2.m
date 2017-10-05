function y = example2(param_array,array_names)
if isstruct(param_array) ~= true
    params = array2struct(param_array, array_names); 
else
    params = param_array;
end
y= ((params.x)+ (params.y)).^3;
end
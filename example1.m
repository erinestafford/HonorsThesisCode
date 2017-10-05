function y = example1(param_array,array_names)
if isstruct(param_array) ~= true
    params = array2struct(param_array, array_names); 
else
    params = param_array;
end
y= (params.x).^2 + (params.y).^2;
end
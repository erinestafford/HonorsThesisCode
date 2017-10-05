function y = example6(param_array,array_names)
if isstruct(param_array) ~= true
    params = array2struct(param_array, array_names); 
else
    params = param_array;
end
y= (params.z).^2 + (params.x- params.y).^3 ;
end
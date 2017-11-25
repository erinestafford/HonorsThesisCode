function out = ODEexample3(t, init, params, array_names)
if isstruct(params) ~= true
    params = array2struct(params, array_names); 
end

y= init;
out = (params.a + 2*params.b)*y;
end
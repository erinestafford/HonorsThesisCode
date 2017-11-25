function y = ODEexample1(t, init, params, array_names)
if isstruct(params) ~= true
    params = array2struct(params, array_names); 
end
y = zeros(size(init));
s= init(1);
i= init(2);

lambda = params.beta*params.c*(i/(s+i));

y(1)= -lambda*s;

y(2)= lambda*s;
end
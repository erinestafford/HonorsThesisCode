function y = example2(param_array,array_names)
params = array2struct(param_array, array_names); 
[X,Y] = meshgrid(linspace(-5,5),linspace(-5,5));
params2 = params;
params2.x = X;
params2.y = Y;
Z = ((params2.x)+(params2.y)).^3;
contour(X,Y,Z);
plot3(X,Y,Z)
y= ((params.x)+ (params.y)).^3;
end
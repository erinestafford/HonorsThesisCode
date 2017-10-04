function y = example1(param_array,array_names)
params = array2struct(param_array, array_names); 
[X,Y] = meshgrid(linspace(-5,5),linspace(-5,5));
params2 = params;
params2.x = X;
params2.y = Y;
Z = (params2.x).^2 + (params2.y).^2;
contour(X,Y,Z);
plot3(X,Y,Z)
y= (params.x).^2 + (params.y).^2;
end
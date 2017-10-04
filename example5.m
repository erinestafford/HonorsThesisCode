function y = example5(param_array,array_names)
params = array2struct(param_array, array_names); 
[X,Y] = meshgrid(linspace(-50,50),linspace(-50,50));
params2 = params;
params2.x = X;
params2.y = Y;
Z = (params2.x).^3 + (params2.y).^3 ;
figure()
subplot(1,2,1)
contour(X,Y,Z);
subplot(1,2,2)
plot3(X,Y,Z)
y= (params.x).^3 + (params.y).^3 ;
end
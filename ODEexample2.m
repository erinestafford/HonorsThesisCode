function out = ODEexample2(t, Y, params, array_names)
if isstruct(params) ~= true
    params = array2struct(params, array_names); 
end
%spring_ODE defines the ODEs for Spring Model
    %call using spring_ODE(t,Y,flag,m,mu,k), 
    %where 'flag' denotes the location where parameters are set
    %INPUT parameters:
            %t is time
            %Y is the initial position and velocity array
            %m is the mass of the object
            %mu is the damping coefficient 
            %k is the spring constant
    %OUTPUT:
            %out is the position and velocity array
out = zeros(size(Y));
y= Y(1);
v= Y(2);
mu_n = params.mu/params.m; %Adjusted coefficients
k_n = params.k/params.m;

out(1)= v;
%size(out(1))
out(2)= - mu_n*v - k_n*y; 
%size(out(2))
end
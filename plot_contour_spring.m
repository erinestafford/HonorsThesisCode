function [] = plot_contour_spring(params, fn, obj_fn)
[mu1, k1] = meshgrid([0:.01:5], [0:.01:5]);
[mu2, m1] = meshgrid([0:.01:5], [0:.01:5]);
[m2, k2] = meshgrid([0:.01:5], [0:.01:5]);
how_many = numel(mu1);
for i = 1:how_many
    params1 = params;
    params1.mu = mu1(i);
    params1.k = k1(i);
    z1(i) = obj_fn(fn(params), fn, params1);
    
end
z1 = reshape(z1,size(mu1));
figure()
%subplot(1,3,1)
contour(mu1,k1,z1,40);
xlabel('\mu values');
ylabel('k values');
colorbar

for i = 1:how_many
    params2 = params;
    params2.mu = mu2(i);
    params2.m = m1(i);
    z2(i) = obj_fn(fn(params), fn, params2);
    
end
z2 = reshape(z2,size(mu2));
figure()
%subplot(1,3,2)
contour(m1, mu2,z2,40);
xlabel('m values');
ylabel('\mu values');
colorbar

for i = 1:how_many
    params3 = params;
    params3.m = m2(i);
    params3.k = k2(i);
    z3(i) = obj_fn(fn(params), fn, params3);
    
end
z3 = reshape(z3,size(m2));
figure()
%subplot(1,3,3)
contour(m2,k2,z3,40);
xlabel('m values');
ylabel('k values');
colorbar
end
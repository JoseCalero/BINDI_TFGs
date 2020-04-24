function Window_feature_plot(features, GSRsignal, windows, n)

init = windows(n);
finish = windows(n+1);
number_points = finish - init +1;

hold on

figure (1)
i = length (features);
j = 1;
k = 1;
subplot (i,j,k),plot (init:finish,GSRsignal);
k = k+1;

for p = 1: length(features) 
    y(p) = linspace (features(p), features(p), number_points);
    subplot (i,j,k),
    plot (init:finish, y(p));
    
    k = k+1;
end
    
end


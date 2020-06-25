function std_HRV = desviacion_HRV(HRV_mean, HRV)

i = 1:length(HRV);

%for i = 1:length(HRV)
    std_HRV = sqrt(sum((abs(HRV(i) - HRV_mean)).^2)/length(HRV)); 
%end

%std_HRV = mean(std_HRV1);
%std_HRV_comprobacion = std(HRV);

end
function std_HRV = desviacion_HRV(HRV_mean, HRV)

i = 1:length(HRV);

std_HRV = sqrt(sum((abs(HRV(i) - HRV_mean)).^2)/length(HRV)); 
%std_HRV_comprobacion = std(HRV);

end
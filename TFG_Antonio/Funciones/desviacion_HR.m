function std_HR = desviacion_HR(mean_HR, HR)

i = 1:length(HR);

std_HR = sqrt((sum((abs(HR(i) - mean_HR)).^2))/length(HR));
%std_HR_comprobacion = std(HR);

end
function std_HR = desviacion_HR(mean_HR, HR)

i = 1:length(HR);

%for i = 1:length(HR)
    std_HR = sqrt((sum((abs(HR(i) - mean_HR)).^2))/length(HR));
%end

%std_HR = mean(std_HR1);
%std_HR_comprobacion = std(HR);

end
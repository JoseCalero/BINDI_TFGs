function rms_HRV = rms_HRV(HRV)

i = 2:length(HRV);

rms_HRV = sqrt((sum((HRV(i)).^2))/length(HRV));
%rms_comprobacion = rms(HRV);

end
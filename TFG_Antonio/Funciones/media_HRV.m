function [mean_HRV, HRV, vector_pos] = media_HRV(pulsos_totales, numero_de_pulso)

for i = 2:pulsos_totales
    IBIs(i-1) = (1/64)*numero_de_pulso(i) - (1/64)*numero_de_pulso(i-1);
end

for i = 2:length(IBIs)
    HRV(i-1) = abs(IBIs(i) - IBIs(i-1));
end

%Valor en s

%vector_pos = zeros(512, 1);

n = 1;
N = 1;

vector_pos = numero_de_pulso(1:end-2);

%for i = numero_de_pulso(1):numero_de_pulso(end-2)
 %   if(numero_de_pulso(N) == i)
  %      vector_pos(n) = i;
   %     N = N + 1;
    %end
    %n = n + 1;
%end

mean_HRV = sum(HRV)/length(HRV);
%media_HRV_comprobacion = mean(HRV);

end
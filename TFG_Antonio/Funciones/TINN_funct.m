% Funci�n que calcula el TINN

function TINN = TINN_funct(pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

z = 1;
for i = 2:pulsos_totales
    matriz_HRV(z) = (1/64)*numero_de_pulso(i)-(1/64)*numero_de_pulso(i-1);
    z = z + 1;
end

matriz_HRV = matriz_HRV.*100;
matriz_HRV = round(matriz_HRV);

max_HRV = max(matriz_HRV);
min_HRV = min(matriz_HRV);

N = 1;
for n = min_HRV:max_HRV
    aux = find(matriz_HRV==n);
    if ~isempty(aux)
        vector_repeticiones(N) = length(aux);
        tiempos(N) = n;
        N = N + 1;
    end
end

auxiliar = find(vector_repeticiones == 1);

TINN_v = tiempos(1):tiempos(auxiliar(1));

TINN = (TINN_v(end)-TINN_v(1))*10 % En ms

end
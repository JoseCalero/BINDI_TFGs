% Función que calcula el TINN

function TINN = TINN_funct(pulsos_totales, numero_de_pulso)
    
i = 2:pulsos_totales;

for i = 2:pulsos_totales
    IBIs(i-1) = (1/64)*numero_de_pulso(i) - (1/64)*numero_de_pulso(i-1);
end

for i = 2:length(IBIs)
    matriz_HRV1(i-1) = abs(IBIs(i) - IBIs(i-1));
end

matriz_HRV = matriz_HRV1.*100; % Aproximación al segundo decimal
matriz_HRV = round(matriz_HRV);

max_HRV = max(matriz_HRV);
min_HRV = min(matriz_HRV);

N = 1;
for n = min_HRV:max_HRV
    aux = find(matriz_HRV == n);
    if ~isempty(aux)
        vector_repeticiones(N) = length(aux);
        tiempos(N) = n;
        for aproximacion = 1:3
            aux_aproxUP = n + aproximacion;
            up = find(matriz_HRV == aux_aproxUP);
            aux_aproxDOWN = n - aproximacion;
            down = find(matriz_HRV == aux_aproxDOWN);
            if ~isempty(up)
                vector_repeticiones(N) = vector_repeticiones(N) + length(up);
                if ~isempty(down)
                    vector_repeticiones(N) = vector_repeticiones(N) + length(down);
                end
            elseif ~isempty(down)
                vector_repeticiones(N) = vector_repeticiones(N) + length(down);
            end
        end
        N = N + 1;
    end
end

% Minimum square difference para hallar el triángulo - las ventanas de 16
% segundos siempre tienen valores mínimos de 1 repetición, por lo que éste
% ha sido el corte en nuestra función para hallar el triángulo

F = 2;
triangulo_encontrado = 0;

for n = 2:length(vector_repeticiones)
    if (vector_repeticiones(n) ~= 1) 
        triangulo_encontrado(F-1) = tiempos(n-1);
        triangulo_encontrado(F) = tiempos(n);
        F = F + 1;
        if n < length(tiempos)
            triangulo_encontrado(F+1) = tiempos(n+1);
        end
    end
end

TINN = (triangulo_encontrado(end)-triangulo_encontrado(1))*10; % En ms

end
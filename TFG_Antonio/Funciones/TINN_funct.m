% Función que calcula el TINN

function TINN = TINN_funct(pulsos_totales, numero_de_pulso)
    
i = 2:pulsos_totales;

z = 1;
for i = 2:pulsos_totales
    matriz_HRV1(z) = (1/64)*numero_de_pulso(i)-(1/64)*numero_de_pulso(i-1);
    z = z + 1;
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

F = 2;
%C = 1;
%a = 1;
%triangulo_encontrado_tiempos(F; C) = 0;
triangulo_encontrado = 0;

for n = 2:length(vector_repeticiones)
    if (vector_repeticiones(n) ~= 1) 
        %triangulo_encontrado_tiempos(F;C) = tiempos(n);
        %triangulo_encontrado_repes(F;C) = vector_repeticiones(n);
        triangulo_encontrado(F-1) = tiempos(n-1);
        triangulo_encontrado(F) = tiempos(n);
        F = F + 1;
        if n < length(tiempos)
            triangulo_encontrado(F+1) = tiempos(n+1);
        end
     %elseif (vector_repeticiones(n) ~= 1) && (a ~= length(triangulo_encontrado_tiempos(1)))
     %   C = C + 1;
      %  F = 1;
       % triangulo_encontrado_tiempos(F;C) = tiempos(n);
        %triangulo_encontrado_repes(F;C) = vector_repeticiones(n);
        %F =  F + 1;
    %elseif (vector_repeticiones(n)) == 1 && (aux == tiempos(n))
        %triangulo_encontrado(F) = tiempos(n);
        %n = length(vector_repeticiones);
    end
end

TINN = (triangulo_encontrado(end)-triangulo_encontrado(1))*10; % En ms
%if (TINN == 0)
%    TINN = 10; % Mínimo valor de TINN
%end

end
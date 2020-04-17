% FUNCION QUE PERMITE RECOGER LA PRIMERA PARTE DE LA GRAFICA DE LA
% TRANSFORMADA DE FOURIER
%

function [fft_BVP, vector_frecuencia_single] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia)
%% DIVIDIMOS EL VECTOR DE LA TRANSFORMADA A LA MITAD DE SU LONGITUD
%
%
aux = round(length(fft_BVP_imagen)/2);
fft_BVP = fft_BVP_imagen(1:aux); 

%% DIVIDIMOS EL VECTOR DE FRECUENCIAS A LA MITAD DE SU LONGITUD
%
%
aux = round(length(vector_frecuencia)/2);
vector_frecuencia_single = vector_frecuencia(1:aux); 

end
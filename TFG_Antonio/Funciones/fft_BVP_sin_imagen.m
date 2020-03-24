% FUNCION QUE PERMITE RECOGER LA PRIMERA PARTE DE LA GRAFICA DE LA
% TRANSFORMADA DE FOURIER
%

function [fft_BVP, vector_frecuencia_single] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia)
%% DIVIDIMOS EL VECTOR DE TRANSFORMADAS A LA MITAD DE SU LONGITUD
%
%
fft_BVP = fft_BVP_imagen(1:length(fft_BVP_imagen)/2); 

%% DIVIDIMOS EL VECTOR DE FRECUENCIAS A LA MITAD DE SU LONGITUD
%
%
vector_frecuencia_single = vector_frecuencia(1:length(vector_frecuencia)/2); 

end
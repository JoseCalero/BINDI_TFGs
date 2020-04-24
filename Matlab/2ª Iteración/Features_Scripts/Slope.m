%Pendiente de la función

y_line = transpose(signal.wrist.EDA); 

x_line = linspace (1, 25972, 25972);

coefficients = polyfit (x_line, y_line, 1) ;

slope = coefficients (1) ;
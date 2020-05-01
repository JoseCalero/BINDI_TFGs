function slope = Signal_feat_slope(Signal)

y_line = Signal'; 

x_line = linspace (1, length(Signal), length(Signal));

coefficients = polyfit (x_line, y_line, 1);

slope = coefficients (1);

end


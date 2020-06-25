clear
clc

for s = 1:15

    load('datos_amusement.mat');
  
    % Fea = features - SxFxP

    Fea = data{s}.features(:,1:25);
    Fea(:,:,2) = data{s}.features(:,1:25);

    % Lab = labels - Sx1xP

    Lab = data{s}.features(:,26);
    Lab(:,:,2) = data{s}.features(:,26);

    results_amusement(s) = trainModels(Fea, Lab, 'database', 3, 'model', 0);

 end

for s = 1:15

    load('datos_stress.mat')
    
    % Fea = features - SxFxP

    Fea = data{s}.features(:,1:25);
    Fea(:,:,2) = data{s}.features(:,1:25);

    % Lab = labels - Sx1xP

    Lab = data{s}.features(:,26);
    Lab(:,:,2) = data{s}.features(:,26);

    results_stress(s) = trainModels(Fea, Lab, 'database', 3, 'model', 0);

end
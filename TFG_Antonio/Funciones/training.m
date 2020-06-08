
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrenando el modelo
% ...trainModels function
% - S: Sample number (The samples come from different or the same window)
% - F: Feature number
% - P: Patient number
% labels is a tridimensional matrix Sx1xP. Must be cell type
% - S: Sample number (The samples come from different or the same window)
% - 1: One column
% - P: Patient number
% Samples and patients must be the same amount
% varargin:
% - database : it specifies the open data based used. Number of patients,
%              trials differ form each other.
%              - 1: DEAP
%              - 2: MAHNOB
%              - 3: WESAD
% - model : it specifies the subject model
%              - 0: Subject-dependent
%              - 1: Subject-independent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

load('data16.mat');

% Convertimos nuestros datos a matrices tridimensionales

n = 1;
  
% Fea = features - SxFxP

Fea = data{1,n}.features(:,1:25);
Fea(:,:,2) = data{1,n}.features(:,1:25);
    
% Las últimas columnas de data.features representan
% 26: self-reports
% 27: estados inducidos

% Lab = labels - Sx1xP

Lab = data{1,n}.features(:,26);
Lab(:,:,2) = data{1,n}.features(:,26);

result = trainModels(Fea, Lab, 'database', 3, 'model', 0);

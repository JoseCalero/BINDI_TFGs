% <function name>(<arg1>,<agr2>,...) - <Brief Description>
%
% Usage:
%   >> <Out> = <function name>(<arg1>) 
%   >> <Out> = <function name>(<arg1>,<arg2>)
%   >>
%
% Inputs:
%   <arg1> - <description>
%   <arg2> - <description>
%
% Optional inputs: ...
%                
%        
% Outputs:
%   <Out>   - description
%
% Author: <Author name>
%
% Note: <description>.
% 
% <Aditional information>
% 
% Copyright (C) 2019 <author name>, <email>
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
%%

% If you want to create a function, establish the outputs and uncomment 
% the following line and the end function line
% <Outs> = function_template_main(<arg1>,...)
clc
clear
close all

% Indicate where is the folder containing all the patient's files
% replace thee following line by the location where you saved the mat files
WESAD_path = '</path/>';

files_physio = dir([WESAD_path '*_wesad.mat']);

% Declare the research-emotions
dEmotion = {'baseline','amusement','stress','mediI','mediII'};

% Declare, if needed, the emotions based on arousal and valence
%dArousal = 
%dValence = 

% Declare auxiliar variables
ctr_w = 1;
window_hist = [];
for i = 1:length(files_physio)
    
    fprintf('loading file %s\n',files_physio(i).name);
    s = strsplit(files_physio(i).name ,'_');
	%Indexes based on the name of the file i.e. These
	% indexes are valid for:
	% --> s01_t01_wesad.mat (trial 1 for patient 1)
	% --> s01_t02_wesad.mat (trial 2 for patient 1)
	% --> etc
    subj_id = str2double(s{1}(2:3));
    trial_id = str2double(s{2}(2:3));    
    wesad_file = sprintf('%s%s',WESAD_path,files_physio(i).name);
	
    %loading the file
    bulk = load(wesad_file);
    bulk_cpy = bulk;
    
    %loading feedbacks
    %load feedback from extracted bulk
	%feedback = bulk.feedback;
	
	%Divide label based on 4 quadrants
	%Modify this part based on the labels wanted
    if feedback.felt_arousal>=5 && feedback.felt_valence<5
     label=2;
    elseif feedback.felt_arousal<5 && feedback.felt_valence<5
     label=3;
    elseif feedback.felt_arousal<5 && feedback.felt_valence>=5
     label=4;
    else
     label=1;
    end
    
    %Define max windows
    window_max = 3;
	%Define overlapping amount
    overlap_per = 0.5;
    %Creating windows
	% In this case we are taking the length and samprate of GSR bacause all signals
	% use the same samprate and have the same length. In case there are multiple
	% signals and they do not have the same samprate, modify this part of code
    total_time = fix(length(bulk.GSR.raw)/bulk.GSR.samprate);
    window_time = total_time/window_max;
    window_total = window_max/overlap_per - 1;
    total_size = length(bulk.GSR.raw);
    partial_size = round(total_size/window_max);
    overlap_window_size= round(partial_size*overlap_per);
    window_hist(i,subj_id) = window_total;
	
	%Main loop for extracting features from the different windows
    for window = 1:window_total
	
       fprintf('extracting all the features for window %d subject %d epoch %d\n',window,subj_id, trial_id);
       if window == 1
         start = (((window-1)*partial_size)+1);
         stop  = (partial_size*window);
       else
         start = (((window-1)*partial_size)+1) - overlap_window_size*(window-1)-1;
         stop  = (partial_size*window) - overlap_window_size*(window-1)-1;
       end
	   
	   %Copy chunk of singal referred to window duration to extract features
       bulk_cpy.GSR.raw=bulk.GSR.raw(start:stop);
       bulk_cpy.BVP.raw=bulk.BVP.raw(start:stop);
       
       features(window,subj_id,trial_id).feedback = feedback;
       
       %extracting BVP features --> Example
       [features(window,subj_id,trial_id).BVP_feats, features(window,subj_id,trial_id).BVP_feats_names] = ...
           BVP_feat_extr(bulk_cpy);
       
       %extracting GSR features --> Example
       [features(window,subj_id,trial_id).GSR_feats, features(window,subj_id,trial_id).GSR_feats_names] = ...
           GSR_feat_extr(bulk_cpy);
       
       labels(ctr_w,1,subj_id) = label;
       ctr_w = ctr_w+1;
        
     end
    fprintf('extracted all the features for subject %d trial %d\n',subj_id, trial_id);
	%In case Baseline, Amusement and Stress have been reached, i.e. 3
	% trials, all files from current patient have been treated
     if trial_id == 3
       fprintf('------------------------------------------------\n');
       fprintf('extracted all the features for subject %d\n',subj_id);
       fprintf('------------------------------------------------\n');
       ctr_3w = 1;
     end
    
end
%correct the following path to where you want your features to be saved
%save('template_features.mat','features');


fprintf('Done! Successfully extracted the feaures\n');

% End function 
% end


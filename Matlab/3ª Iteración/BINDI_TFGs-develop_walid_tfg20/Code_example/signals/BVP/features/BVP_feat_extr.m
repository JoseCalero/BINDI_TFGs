%This file is part of TEAP.
%
%TEAP is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%
%TEAP is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with TEAP.  If not, see <http://www.gnu.org/licenses/>.
% 
%> @file BVP_feat_extr.m
%> @brief Computes @b BVP features
%> @param  BVPsignal: the BVP signal.
%> @param  varargin: you can choose which features to extract (see featureSelector)
%>
%>            the list of available features is:
%>           - mean_: averaged BVP - ralated to blood pressure
%>           - HRV: heart rate variability calculated based on the standard
%>           deviation IBI differences
%>           - meanIBI: mean heart rate (beat per minute)
%>           - MSE: Multi-Scale Entropy at 5 levels 1-5
%>           - sp0001: spectral power in 0.0-0.1Hz band
%>           - sp0102: spectral power in 0.1-2.1Hz band
%>           - sp0203: spectral power in 0.2-3.1Hz band
%>           - sp0304: spectral power in 0.3-4.1Hz band
%>           - sp_energyRatio: spectral power ratio between 0.0-0.08Hz and
%>           0.15-0.5Hz bands
%>           - tachogram_LF: Tachogram's low freqneucy spectral content
%>           <0.08Hz
%>           - tachogram_MF: Tachogram's medium freqneucy spectral content
%>           0.08Hz> and <0.15Hz
%>           - tachogram_HF: Tachogram's high freqneucy spectral content
%>           0.15Hz> and <0.5Hz
%>           - tachogram_energy_ratio: energu ratio tachogram_MFSP/(tachogram_HSP+tachogram_LFSP)
% 
%> @retval  BVP_feats: list of features values
%> @retval  BVP_feats_names: names of the computed features (it is good pratice to
%>                   check this vector since the order of requested features
%>                   can be different than the requested one)
%> @retval  Bulk: if the input to the function is a Bulk than the Bulk is returned
%>        with the updated BVP signal, including IBI. Otherwise NaN is
%>        returned
% 
%> @author Copyright Guillaume Chanel 2013
%> @author Copyright Frank Villaro-Dixon, 2014
function [BVP_feats, BVP_feats_names, Bulk] = BVP_feat_extr(BVPSignal,varargin)

% Check inputs and define unknown values
narginchk(1, Inf);

%Make sure we have an BVP signal
[BVPSignal, Bulk] = BVP__assert_type(BVPSignal);
if(nargout < 3) %No bulk requested -> do not need to keep it
	Bulk = [];
end

% Define full feature list and get features selected by user
featuresNames = {'mean_', 'HRV', 'rmsHRV', 'meanIBI',  ...
	'sp0001', 'sp0102', 'sp0203', 'sp0304', 'sp_energyRatio', ...
	'tachogram_LF', 'tachogram_MF', 'tachogram_HF', 'tachogram_energy_ratio','dfa_bvp','dfa_ibi','rrate','det','lmax','ent','lam','tt','corDim'};
featuresNamesIBI = {'mean_', 'HRV', 'meanIBI', 'tachogram_LF', 'tachogram_MF', 'tachogram_HF', 'tachogram_energy_ratio'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% featuresNames = {'mean_', 'HRV', 'meanIBI', 'MSE',  ...
% 	'sp0001', 'sp0102', 'sp0203', 'sp0304', 'sp_energyRatio', ...
% 	'tachogram_LF', 'tachogram_MF', 'tachogram_HF', 'tachogram_energy_ratio'};
% featuresNamesIBI = {'mean_', 'HRV', 'meanIBI', 'tachogram_LF', 'tachogram_MF', 'tachogram_HF', 'tachogram_energy_ratio'};
BVP_feats_names = featuresSelector(featuresNames,varargin{:});

%If some features are selected
if(~isempty(BVP_feats_names))

	%Compute the results

	%First compute IBI if needed by the requested features
	if(any(ismember(featuresNamesIBI,BVP_feats_names)))
		%Compute IBI
		BVPSignal = BVP__compute_IBI( BVPSignal );
		IBI = Signal__get_raw(BVPSignal.IBI);
		IBI_sp = Signal__get_samprate(BVPSignal.IBI);

		%Update the Bulk with the new BVP signal
		if(~isempty(Bulk))
			Bulk = Bulk_update_signal(Bulk, Signal__get_signame(BVPSignal), BVPSignal);
		end
	end

	%Get the raw signals
	rawSignal = Signal__get_raw(BVPSignal);
	samprate = Signal__get_samprate(BVPSignal);
	%averaged BVP - ralated to blood pressure

	if any(strcmp('mean_',BVP_feats_names))
		mean_ = mean(rawSignal);
	end

	if any(strcmp('meanIBI',BVP_feats_names)) || any(strcmp('HRV',BVP_feats_names))
		HRV = std(IBI);
        rmsHRV = rms(IBI);
		meanIBI = mean(IBI);
	end
	if any(strncmp('MSE',BVP_feats_names,3))
		%multi-scale entropy for 5 scales on hrv
		[MSE] = multiScaleEntropy(IBI,5); %FIXME: this is applied on a 4Hz signal -> but probably the features were originally computed on an IBI sequence
    end
   
    %EMPATIA
%     welch_window_size_BVP = samprate*10;
    %TEAP-DEAP-MAHNOB
	%welch_window_size_BVP = samprate*20;
    welch_window_size_BVP = floor(length(rawSignal)-samprate);
	%welch_window_size_IBI = IBI_sp*20;
    welch_window_size_IBI = floor(length(IBI)/2);
	if length(rawSignal)< welch_window_size_BVP +samprate
		warning('Signal is too short for this welch window size');
	end
	if length(rawSignal)< welch_window_size_BVP +1
		warning('Signal is too short for this welch window size and the PSD features cannot be calculated');
		sp0001 = NaN;sp0102 = NaN;sp0203 = NaN; sp0304 = NaN;sp_energyRatio = NaN;

	else

		if any(strncmp('sp',BVP_feats_names,2))
			%[P, f] = pwelch(rawSignal, welch_window_size_BVP, [], [], samprate);
            [P, f] = pwelch(rawSignal-detrend(rawSignal), welch_window_size_BVP, [], [], samprate);
            P=P/sum(P);
			%power spectral featyres
			sp0001 = log(sum(P(f>0.0 & f<=0.1))+eps);
			sp0102 = log(sum(P(f>0.1 & f<=0.2))+eps);
			sp0203 = log(sum(P(f>0.2 & f<=0.3))+eps);
			sp0304 = log(sum(P(f>0.3 & f<=0.4))+eps);
			sp_energyRatio = log(sum(P(f<0.08))/sum(P(f>0.15 & f<0.5))+eps);
		end
	end
	if length(IBI)< welch_window_size_IBI +IBI_sp
 		warning('Signal is too short for this welch window size');
	end
	if length(IBI)< welch_window_size_IBI +1
 		warning('Signal is too short for this welch window size and the PSD features cannot be calculated');
		tachogram_LF = NaN;tachogram_MF = NaN;tachogram_HF = NaN;
		tachogram_energy_ratio = NaN;
	else
		%tachogram features; psd features on inter beat intervals
		%R. McCraty, M. Atkinson, W. Tiller, G. Rein, and A. Watkins, "The
		%effects of emotions on short-term power spectrum analysis of
		%heart rate variability," The American Journal of Cardiology, vol. 76,
		%no. 14, pp. 1089 -1093, 1995
		if any(strcmp('tachogram_LF',BVP_feats_names)) ...
				|| any(strcmp('tachogram_MF',BVP_feats_names)) ||  any(strcmp('tachogram_HF',BVP_feats_names)) ...
				|| any(strcmp('tachogram_energy_ratio',BVP_feats_names))
			[Pt, ft] = pwelch(IBI, welch_window_size_IBI, [], [], IBI_sp);
            %[Pt, ft] = pwelch(IBI, [], [], [], IBI_sp);
			clear tachogram %TODO: delete ? Why is it useful ?
			%WARN: check that this is possible with the IBI sampling rate
			%WARN: these values are sometimes negative because of the log, doesn't it appear as strange for a user ?
			tachogram_LF = log(sum(Pt(ft>0.01 & ft<=0.08))+eps);
			tachogram_MF = log(sum(Pt(ft>0.08 & ft<=0.15))+eps);
			tachogram_HF = log(sum(Pt(ft>0.15 & ft<=0.5))+eps);
			tachogram_energy_ratio = tachogram_MF/(tachogram_LF+tachogram_HF);
		end
    end
    
     %dfa - Detrended Fluctuation Analysis
    if any(strcmp('dfa_bvp',BVP_feats_names))
     pts = round(length(rawSignal)/10):10:length(rawSignal);
	 [dfa_out,~] = DFA_fun(rawSignal,pts);
     dfa_bvp = dfa_out(1);
     pts = round(length(IBI)/10):10:length(IBI);
     [dfa_out,~] = DFA_fun(IBI,pts);
     dfa_ibi = dfa_out(1);
    end
    
    %rqa_stat - RQA statistics - [recrate DET LMAX ENT TND LAM TT]
    if any(strcmp('rrate',BVP_feats_names))
      %Determining embedding dimension m and time lag (delay time) t
      [y,eLag,eDim]=phaseSpaceReconstruction(IBI,'MaxLag',1,'MaxDim',3);
      
      % phase space plot
      %y = phasespace(IBI,3,10);
%       figure('Position',[100 400 460 360]);
%       plot3(y(:,1),y(:,2),y(:,3),'-','LineWidth',1);
%       title('GSR time-delay embedding - state space plot','FontSize',10,'FontWeight','bold');
%       grid on;
%       set(gca,'CameraPosition',[25.919 27.36 13.854]);
%       xlabel('x(t)','FontSize',10,'FontWeight','bold');
%       ylabel('x(t+\tau)','FontSize',10,'FontWeight','bold');
%       zlabel('x(t+2\tau)','FontSize',10,'FontWeight','bold');
%       set(gca,'LineWidth',2,'FontSize',10,'FontWeight','bold');

      % color recurrence plot
      %cerecurr_y(y);
      recurdata = cerecurr_y(y);
      
      %S. Schinkel, O. Dimigen, and N. Marwan, �Selection of Recurrence
      %Threshold for Signal Detection,� The European Physical J.-Special
      %Topics, vol. 164, no. 1, pp. 45-53, 2008
      e_thr=0.1*mean(mean(recurdata))*2;

      % black-white recurrence plot
      %tdrecurr_y(recurdata,e_thr);
      recurrpt = tdrecurr_y(recurdata,e_thr);

      %Recurrence quantification analysis
      % rqa_stat - RQA statistics - [recrate DET LMAX ENT LAM TT]
      rqa = recurrqa_y(recurrpt);
      %[rrate,det,lmax,ent,lam,tt]
      rrate=rqa(1);
      det=rqa(2);
      lmax=rqa(3);
      ent=rqa(4);
      lam=rqa(5);
      tt=rqa(6);
      
      %Correlation Dimension to calculate D 2.
      %(Note: it is the measure of chaotic signal complexity in multidimensional 
      % phase space and is the slope of the correlation integral versus 
      % the range of radius of similarity)
      corDim=correlationDimension(rawSignal,eLag,eDim,'NumPoints',100);
    end

	%Write the values to the final vector output
	BVP_feats = [];
	for (i = 1:length(BVP_feats_names))
		eval(['BVP_feats = cat(2, BVP_feats, ' BVP_feats_names{i} ');']);
	end

	else %no features selected
		BVP_feats = [];
	end
end

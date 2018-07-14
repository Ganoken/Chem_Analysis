%Normalize the Phasemean result
%temp made for one time use
%% Load result

FileIndex = [50 60 70 80 90 100 110 120 0]; % if off does not work use 0

 numArrays = 9;
 BI = cell(numArrays,1);
 for n = 1:numArrays
     FileName = ['I:/ch0618/PM/chem_' num2str(FileIndex(n)) '_mean_f.mat']; % need to change 
     BI{n} = load(FileName);
 end

 %% find max value and index
 Max_Value_Phase = zeros(1,32);
 Max_Value = zeros(1,n);
 Index_Phase =zeros(1,n);
 for n = 1:numArrays
    for j =1:32 
        Max_Value_Phase(j) =(max(max(BI{n}.MeanImage(:,:,j))));
    end
    [Max_Value(n), Index_Phase(n)] = max(Max_Value_Phase);
 end
 
 [Grand_Max, Index] = max(Max_Value);
 FileName = ['I:\ch0618\PM\Index_Phase.mat']; % output file name
 save(FileName,'Index_Phase'); 
 
 %% Normalize
 PhaseMeanImage = zeros(501,501,32);
 for n = 1:numArrays
     PhaseMeanImage =(BI{n}.MeanImage(:,:,:))/Grand_Max;
     FileName = ['I:/ch0618/PM/chem_' num2str(FileIndex(n)) '_mean_nor.mat'];
     save(FileName,'PhaseMeanImage'); 
 end
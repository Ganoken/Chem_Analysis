%Normalize the Phasemean result

%% Load result

FileIndex = [50 60 70 80 90 100 110 120 off]; % if off does not work use 0

 numArrays = 10;
 BI = cell(numArrays,1);
 for n = 1:numArrays
     FileName = ['I:/ch0618/mat/chem_' num2str(n,'%03u') '.mat']; % need to change 
     BI{n} = load(FileName);
 end

 Max_Value =　max(max(max(BI)));
% 20180529 Sujoy
% just to obtain a mean image

%Initialize
close all; clear MeanImage;


%Set parameters
X_Pixels = 768;
Y_Pixels = 768;
Number_Image = 20000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
BatchSize = 100; % # of image to process @one time determine based on memory size
N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
Number_File = 9; % # of file to analyze 

%prepare output matrix
MeanImage = zeros(X_Pixels,Y_Pixels,Number_File);

% input file
file='chem_03_cor.dat'; 

%main loop
for j = 1:(Number_Image/BatchSize)
    
    Image = reshape(fread(fileID,'uint16'),[X_Pixels,Y_Pixels,Number_Image]);
    RawImage = permute(Image,[2 1 3]);;
    fclose(fileID);

    

end

MeanImage(:,:,n) = mean(RawImage,3); 
FileName = ['chem_mean.mat']; % output file name
save(FileName,'MeanImage'); 


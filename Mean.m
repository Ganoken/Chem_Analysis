% 20180529 Sujoy
% just to obtain a mean image

%Initialize
close all; clear MeanImage;


%Set parameters
X_Pixels = 768;
Y_Pixels = 768;
Number_Image = 20000; %# of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
N = [X_Pixels Y_Pixels Number_Image]; % structure of data
Number_File = 9; % # of file to analyze 

%prepare output matrix
MeanImage = zeros(X_Pixels,Y_Pixels,Number_File);

%input file
file='chem_0%s.dat'; 

%main loop
for n = 1:Number_File
    filename = sprintf(file,n);
    fileID = fopen(filename,'r');
    Image = reshape(fread(fileID,'uint16'),[X_Pixels,Y_Pixels,Number_Image]);
    RawImage = permute(Image,[2 1 3]);;
    fclose(fileID);

    MeanImage(:,:,n) = mean(RawImage,3); 

end

FileName = ['chem_mean.mat']; % output file name
save(FileName,'MeanImage'); 


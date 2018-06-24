%Code to convert .dat to .matfor movie.
%Sujoy  created 2018/06

%Initialize
close all; clear RawImage;

%Load Data 
file = 'I:/ch0618/ch_13_cor.dat';  %input file

%Set parameters
X_Pixels = 768; % Based on camera
Y_Pixels = 768;
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
N = [X_Pixels Y_Pixels]; % structure of data
BatchSize = 2000;
cut_Y = 100:600;
cut_X = 100:600;

%Generate needed matrix
I=zeros(Pixels,1,'uint16'); % Pre make the matrix to hold the image
%CutImage = zeros(size(cut_Y,2),size(cut_X,2),2000); % Pre make output matrix

%Set up loop parameters


%main loop
for l=1:10 % Each loop will proccess 2000 images 
    %s=1; % ID for store
    Image = reshape(loaddat(file,(l-1)*BatchSize*Pixels*2,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]);
    RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]);
    FileName = ['I:/ch0618/mat/chem_100' num2str(l,'%03u') '.mat']; % output file name
    save(FileName,'RawImage');  
end

%finish up
clear Image;
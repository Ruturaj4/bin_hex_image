close all;

%user prompt - to get the path or name of the image to be converted
prompt = 'Please enter a image to be converted: ';
str = input(prompt,'s');

%Now get the image dimentions from the user
prompt = 'Please enter Horizontal dimentions:';
hori = input(prompt);
prompt = 'Please enter Horizontal dimentions:';
vert = input(prompt);

%Open the bin file inputed by the user
fid = fopen(str);

B = fread(fid, '*uint8');

%Close the file
fclose(fid);

%Collecting the length of the file
l = length(B);

%Get rid of 24 elements
%l = l - 24;

B = B(25:l);

%Calculated total size
dim = hori * vert;

B = reshape(B, [8, dim]);

B = B(1,:);

C=reshape(B, vert, hori);

J = imrotate(C, 90);
J = flip(J);

%Show the image to the user
imshow(J);
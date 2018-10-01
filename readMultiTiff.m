% function stack = readMultiTiff(img, z)
% 
% Read a multipage TIFF file into a 3D matrix
% img: the image to be read
% z: number of images in the stack

function stack = readMultiTiff(img, z)
    % don't know the image width and height so have to read in one image
    first = imread(img);
    stack = zeros(size(first,1),size(first,2),z);
    for i = 1:z
        stack(:,:,i) = imread(img,i);
    end    
return;
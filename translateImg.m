% function translated = translateImg(I, x, y)
% 
% REQUIRES: the Matlab Image Processing Toolbox
% translate images by the specified pixels

function translated = translateImg(I, x, y)
se = translate(strel(1), [x y]);
translated = imdilate(I,se);
return;
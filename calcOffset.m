% function offset = calcOffset(obs, msk)
% 
% REQUIRES: normxcorr2() from the Matlab Image Processing Toolbox
% calculate offset between observed and projected images 
% using normalized cross-correlation
% !!! IMPORTANT: assume images are of the same size

function offset = calcOffset(obs, msk)
o = normxcorr2(obs, msk);
[max_c, imax] = max(abs(o(:)));
[ypeak, xpeak] = ind2sub(size(o),imax(1));
offset = [(xpeak - size(msk, 2)) (ypeak - size(msk, 1))];

return;

% function result = warpProjective3(im,A,sz)
%
% im: input image (must be type double)
% A: 3x3 projective transform matrix
% sz: A 2x1 vector of the size of result, such as sz=[768,1024]
% interpMethod: Optional interpolation method, one of {'nearest','linear','spline','cubic'}
% result: output image
%
% If a transformed point is outside of the volume, NaN is used

function result = warpProjective3(im,A,sz,interpMethod)

sz=double(sz);

if ~exist('interpMethod','var')
   interpMethod='linear'; 
end

% Compute coordinates corresponding to input 
% and transformed coordinates for result

[xo,yo]=meshgrid(1:size(im,2),1:size(im,1));
[x,y]=meshgrid(1:sz(2),1:sz(1));
coords=[x(:)'; y(:)'];
homogeneousCoords=[coords; ones(1,prod(sz))];
warpedCoords=A*homogeneousCoords;
xprime=warpedCoords(1,:)./warpedCoords(3,:);
yprime=warpedCoords(2,:)./warpedCoords(3,:);

result = interp2(xo,yo,im,xprime,yprime, interpMethod);
result = reshape(result,sz);

return;
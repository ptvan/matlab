% function msk = makeMask(input, tform, writeFile=T)
%
% REQUIRES: warpProjective3.m
% input: input camera image
% tform: 3x3 projective transform matrix

function msk = makeMask(input, tform)
	% if nargin < 3, writeFile = 1; end
    input = im2double(input);	
	input = input * (1 / max(max(input)));
	msk = 1 - input;
	msk = warpProjective3(im2double(msk), tform.tdata.T',[768,1024], 'cubic');
	% original masking 
    % msk = msk > 0.48, increase number to mask earlier
    msk = msk > 0.48;
    %if (writeFile)
	%	imwrite(msk, 'mask.bmp', 'bmp');
    %end
 return;
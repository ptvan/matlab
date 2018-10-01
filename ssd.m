% Normalized sum of squared differences between two image windows
function s = ssd(w1, w2, delta)

if nargin < 3
    delta = [];
end

% Pixel-by-pixel difference
d = (w1 - w2) .^2;
d = d(:);

% If the window is at the image boundary, it may contain NaN values.
% Do not count those
d = d(find(~isnan(d)));

% Sum of squared differences, per pixel
if length(d) > 0
    s = sum(d) / length(d);
else
    s = Inf;    % Empty windows are maximally dissimilar
end

% This normalization is conceptually unnecessary, but prevents big numbers
% in the output. It is equivalent to normalizing images down from 0:255 to
% 0:1
s = s / 255 ^ 2;
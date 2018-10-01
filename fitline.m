function [p,perr] = fitline(x,y)

%  [P,PERR] = FITLINE(X,Y)  Fitting straight line trough datapoints
%       specified by vectors X and Y.
%       Simplified and slightly changed version of POLYFIT
%       Returns parameters of the fit and their estimated errors
%       instead of Cholesky factor matrix

%  Kirill Pankratov,  kirill@plume.mit.edu
%  Jan. 5, 1994,  April 25, 1994

x = x(:); y = y(:);   % Make input column vectors

% Construct Vandermonde matrix.
n = 1;
V(:,n+1) = ones(length(x),1);
for j = n:-1:1
    V(:,j) = x.*V(:,j+1);
end

% Solve least squares problem.
R = V'*V;
p = V\y;
r = y - V*p; % Residuals
p = p';      % Polynomial coefficients are row vectors by convention.

perr = norm(r)*diag(inv(R))'/2;    % Errors of the fit
perr(1) = perr(1)*length(y)*2/pi;

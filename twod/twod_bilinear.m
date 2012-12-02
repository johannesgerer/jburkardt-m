function M = twod_bilinear( kernel, phi, test, w_g )
%-----------------------------------------------------------------------
%  twod_bilinear.m - routine to compute \int{ kernel*phi*test }
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    M = twod_bilinear(kernel, phi, test, w_g)
%
%  Variables:     kernel
%                        Kernel function in the integral evaluated
%                        at the Gauss points
%
%                 phi
%                        matrix of element test functions evaluated
%                        at the Gauss points (dim: n_gauss, n_dof)
%
%                 test
%                        matrix of test functions evaluated at the
%                        Gauss points (dim: n_gauss, n_dof)
%
%                 w_g
%                        Row vector of Gauss weights
%-----------------------------------------------------------------------
%   [n_gauss,n_row] = size(test);
%   [n_g1   ,n_col] = size(phi );
% 
%   M = zeros(n_row,n_col);
%   for i=1:n_row
%     for j=1:n_col
%       M(i,j) = ( w_g'    .* test(:,i)' ) * ( kernel .* phi(:,j) );
%     end
%   end

  M = test'*diag( w_g.*kernel )*phi;
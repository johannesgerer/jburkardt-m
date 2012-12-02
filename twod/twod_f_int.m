function F = twod_f_int( Ff, test, w_g )
%-----------------------------------------------------------------------
%  twod_f_int.m - routine to compute \int{ f*test }
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    F = twod_f_int( Ff, test, w_g )
%
%  Variables:     Ff    
%                        Function values at the Gauss points
%
%                 test
%                        matrix of test functions evaluated at the
%                        Gauss points (dim: n_gauss, n_dof)
%
%                 w_g
%                        Row vector of Gauss weights
%-----------------------------------------------------------------------
% [n_gauss,n_dof] = size(test);
% 
% F = zeros(n_dof,1);
% for j=1:n_dof
%   F(j) = test(:,j)' * ( w_g .* Ff );
% end

 F = sum(test'*(w_g.*Ff),2);

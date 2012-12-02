function y = a_cdt(x,params)
%a_cdt     matrix-vector product for convection-diffusion operator
%   y = a_cdt(x,params)
%   input
%          x            operand for matrix-vector product
%          params       structure defining coefficient matrix
%   output
%          y            result of matrix-vector product
%
%   IFISS function: HCE; 1 April 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage
y = params.A * x;

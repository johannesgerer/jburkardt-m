function [x_it]=m_amgt(x_it,aparams,mparams)
%m_amgt    AMG preconditioner for convection-diffusion operator
%   x_it = m_amgt(x_it,aparams,mparams);
%   input
%          x_it         operand for preconditioning operator
%          aparams      not used
%          mparams      not used
%   output
%          x_it         result of MG preconditioning operation
%
%   Information needed for preconditioning passed via global variable AMGLOB
%   calls FEMLAB function amgsol 
%   IFISS function: DJS, HCE; 16 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

global AMGLOB

% action of inv(M)
x_it=amgsol(x_it,AMGLOB);

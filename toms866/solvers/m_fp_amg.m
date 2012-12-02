function y = m_fp_amg(x_it,aparams,qparams)
%m_fp_amg     AMG iterated pressure convection-diffusion preconditioner
%   y = m_fp_amg(x_it,aparams,qparams);
%   input
%          x_it         operand for preconditioning operator
%          aparams      structure defining coefficient matrix
%          mparams      structure defining preconditioning matrix
%   output
%          y            result of preconditioning operation
%
%   calls FEMLAB function amgsol 
%   Global array variables AMGLOBA and AMGLOBF define the
%   amg data for amgsol for Ap and F respectively
%
%   IFISS function: DJS; 23 April 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

global AMGLOBA
global AMGLOBF

nv = length(aparams.F);
nu = nv/2;
np = size(aparams.B,1);

rv=x_it(1:nv); rp=x_it(nv+1:nv+np);

%% pressure solve
nv = length(aparams.F);
nu = nv/2;
np = size(aparams.B,1);

rv=x_it(1:nv); rp=x_it(nv+1:nv+np);
%% pressure solve
if qparams.domain==1,
   n_null = qparams.n_null;
   minor = [1:n_null-1,n_null+1:np]';
   yp = zeros(np,1);
   yp(minor) =  amgsol(rp(minor),AMGLOBA);
   zp = -qparams.Mp\(qparams.Fp*yp);
else
   zp = -(qparams.Mp)\((qparams.Fp)*((qparams.Ap)\rp));
end

%% velocity solve
rv = rv-(aparams.B')*zp;
zv = amgsol(rv,AMGLOBF);
y = [zv;zp];

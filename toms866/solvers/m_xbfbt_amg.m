function y = m_xbfbt_amg(x_it,aparams,qparams)
%m_xbfbt_amg   AMG iterated least squares commutator preconditioner
%   y = m_xbfbt_amg(x_it,aparams,qparams)
%   input
%          x_it         operand for preconditioning operator
%          aparams      structure defining coefficient matrix (F, B)
%          qparams      structure defining preconditioning operator
%                       (domain and Gdiag=diagonal of velocity mass matrix)
%   output
%          y            result of preconditioning operation
%
%   calls FEMLAB function amgsol 
%   Global array variables AMGLOBA and AMGLOBF define the
%   amg data for amgsol for Poisson operator and F respectively
%   IFISS function: DJS; 23 April 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

global AMGLOBA
global AMGLOBF
nv = length(aparams.F);
nu = nv/2;
np = size(aparams.B,1);

rv=x_it(1:nv); rp=x_it(nv+1:nv+np);

%% pressure solve
xB = (qparams.Gdiag\aparams.B')';
   
if qparams.domain==1,
   n_null = qparams.n_null;
   minor = [1:n_null-1,n_null+1:np]';
   rp1 = zeros(np,1);
   rp1(minor) = amgsol(rp(minor),AMGLOBA);
   rp2 =  xB*(aparams.F*(xB'*rp1));
   zp = zeros(np,1);
   zp(minor) =  - amgsol(rp2(minor),AMGLOBA);
else  
   rp1 = amgsol(rp,AMGLOBA);
   rp2 =  xB*(aparams.F*(xB'*rp1));
   zp =  - amgsol(rp2,AMGLOBA);
end

%% velocity solve
rv = rv-(aparams.B')*zp;
zv = amgsol(rv,AMGLOBF);
y = [zv;zp];

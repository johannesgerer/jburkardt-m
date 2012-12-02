function y = m_xbfbt_mg(x_it,aparams,mparams)
%m_xbfbt_mg   GMG iterated least squares commutator preconditioner
%   y = m_xbfbt_mg(x_it,aparams,mparams);
%   input
%          x_it         operand for preconditioning operator
%          aparams      structure defining coefficient matrix
%          mparams      structure defining preconditioning matrix
%                       including B diag(G)\B' and mgdata
%   output
%          y            result of preconditioning operation
%
%   IFISS function: HCE; 12 April 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

nv = length(aparams.F);
nu = nv/2;
np = size(aparams.B,1);

Gdiag=spdiags(diag(mparams.G),0,nv,nv);
xB = (Gdiag\aparams.B')';
%BBt = aparams.B*xB';

rv=x_it(1:nv); rp=x_it(nv+1:nv+np);

domain = mparams.domain;

%% pressure solve
mg_mat = 1;
   
%zp = -BBt \ (xB*(aparams.F*(xB'*(BBt\rp))));
nc = size(mparams.mgdata_diff,2);
BGiBt = mparams.mgdata_diff(nc).matrix;
rp1 = mg_ns(BGiBt,rp, domain,mg_mat,mparams.mgdata_diff);
rp2 =  xB*(aparams.F*(xB'*rp1));
%zp = - BBt\rp2;
zp = - mg_ns(BGiBt,rp2, domain,mg_mat,mparams.mgdata_diff);

%% velocity solve
mg_mat = 2;
rv = rv-(aparams.B')*zp;
%zvx = (aparams.F(1:nu,1:nu))\rv(1:nu);  
zvx = mg_ns(aparams.F(1:nu,1:nu),rv(1:nu), domain,mg_mat,mparams.mgdata_cd);   
%zvy = (aparams.F(1:nu,1:nu))\rv(nu+1:nv);
zvy = mg_ns(aparams.F(1:nu,1:nu),rv(nu+1:nv), domain,mg_mat,mparams.mgdata_cd); 

y = [zvx;zvy;zp]; 

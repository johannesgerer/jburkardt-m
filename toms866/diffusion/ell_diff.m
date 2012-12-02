%ell_diff   solve Poisson problem in L-shaped domain 
%   IFISS scriptfile: DJS; 4 March 2005. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
clear 
%% define geometry
pde=1; domain=2;
global viscosity
viscosity=1;
ell_domain
load ell_grid
%
%% set up matrices
qmethod=default('Q1/Q2 approximation 1/2? (default Q1)',1);
if qmethod ==2, 
   [x,y,xy] = q2grid(x,y,xy,mv,bound);
   [A,M,f] = femq2_diff(xy,mv); 
else
   [ev,ebound] = q1grid(xy,mv,bound,mbound);
   [A,M,f] = femq1_diff(xy,ev);
end 
%
%% boundary conditions
[Agal,fgal] = nonzerobc(A,f,xy,bound);
%
%% save resulting system
fprintf('system saved in ell_diff.mat ...\n')
gohome
cd datafiles
save ell_diff qmethod Agal M  fgal  xy x y 
%% compute solution
tic, fprintf('solving linear system ...  ')
x_gal=Agal\fgal;
fprintf('done\n')
etoc=toc; fprintf('Galerkin system solved in  %8.3e seconds\n\n',etoc) 
save ell_diff x_gal  -append 
% plot solution
if qmethod ==2 
solplotl(x_gal,xy,x,y,12);
title(['Q',int2str(qmethod),' solution'])
drawnow
end
%
%% compute a posteriori error estimate
if qmethod == 1
   [jmp,els] = q1fluxjmps(x_gal,xy,ev,ebound);
   [rhsq,hlsq] = q1res_diff(xy,ev);
   [elerror,fez,aez] = diffpost_p(jmp,els,xy,ev);
   [error_p,elerror_p] = diffpost_bc(aez,fez,elerror,xy,ev,ebound);
   save ell_diff  elerror_p ev -append 
   errplotl(x_gal,elerror_p,ev,xy,x,y,11)
end

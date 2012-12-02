%quad_diff   solve Poisson problem in quadrilateral domain 
%   IFISS scriptfile: DJS; 4 March 2005. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
clear 
%% define geometry
pde=1; domain=8;
global viscosity
viscosity=1;
quad_domain
load quad_grid
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
fprintf('system saved in quad_diff.mat ...\n')
gohome
cd datafiles
save quad_diff qmethod Agal M  fgal  xy x y 
%% compute solution
fprintf('solving linear system ...  ')
x_gal=Agal\fgal;
fprintf('done\n')
save quad_diff x_gal  -append
% plot solution
if qmethod > 0 
   solplot(x_gal,xy,x,y,10);
   title(['Q',int2str(qmethod),' solution'])
   drawnow
end

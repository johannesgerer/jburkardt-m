%ref_cd   set up problem in reference square domain 
%   IFISS scriptfile: DJS; 5 March 2005. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 

%% define geometry
pde=2; domain=1;
ref_domain(sn)
load ref_grid
%
%% set up matrices
qmethod=1;
[ev,ebound] = q1grid(xy,mv,bound,mbound);
[A,N,Q,epe,eph,epw] = femq1_cd(xy,ev);
%
%% save resulting system
fprintf('system matrices saved in square_cd_nobc.mat ...\n')
gohome
cd datafiles
save square_cd_nobc qmethod grid_type A N Q xy ev epe eph epw ebound bound outbc x y

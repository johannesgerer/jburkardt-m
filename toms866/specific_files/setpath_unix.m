%setpath   sets IFISS search path (Unix version)
%   IFISS scriptfile: DJS, HCE; 16 April 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 

% fix UMFPACK bug
if strncmp(version,'6.5',3) | strncmp(version,'7.0',3), 
   spparms('default'),spparms('piv_tol',1), end
% initilises matlab path for ./ifiss/ directories
gohome, home=pwd;
P=path;
path(P,[home]);
P=path;
path(P,[home,'/datafiles']);
P=path;
path(P,[home,'/grids']);
P=path;
path(P,[home,'/graphs']);
P=path;
path(P,[home,'/diffusion']);
P=path;
path(P,[home,'/diffusion/test_problems']);
P=path;
path(P,[home,'/convection']);
P=path;
path(P,[home,'/convection/test_problems']);
P=path;
path(P,[home,'/stokes_flow']);
P=path;
path(P,[home,'/stokes_flow/test_problems']);
P=path;
path(P,[home,'/navier_flow']);
P=path;
path(P,[home,'/navier_flow/test_problems']);
P=path;
path(P,[home,'/solvers']);
P=path;
path(P,[home,'/solvers/ch4_code']);
if exist('djs') == 7
   P=path; path(P,[home,'/djs']);
end
if exist('hce') == 7
   P=path; path(P,[home,'/hce']);
end
if exist('ar') == 7
   P=path; path(P,[home,'/ar']);
end
%
% fix iterapp bug (affects pcg & minres)
if strncmp(version,'7.0.4',5), 
   P=path; path([home,'/matlab704'],P);
end
clear P

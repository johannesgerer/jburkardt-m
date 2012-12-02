%install_unix   sets up IFISS on UNIX computer
%   IFISS scriptfile: DJS, HCE; 24 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage (see readme.m)

if strncmp(computer,'MAC2',4)
   fprintf('\nInstalling MAC-OS specific files must be done manually:\n')
%
else
   gohome;
%
   fprintf('\nInstalling unix specific files.\n')
   !/bin/cp ./specific_files/setpath_unix.m ./setpath.m
   setpath
%
   !/bin/rm ./diffusion/test_problems/diff_testproblem.m
   !/bin/cp ./specific_files/diff_testproblem_unix.m ./diffusion/test_problems/diff_testproblem.m
%
   !/bin/rm ./convection/test_problems/cd_testproblem.m
   !/bin/cp ./specific_files/cd_testproblem_unix.m ./convection/test_problems/cd_testproblem.m
%
   !/bin/rm ./stokes_flow/test_problems/stokes_testproblem.m
   !/bin/cp ./specific_files/stokes_testproblem_unix.m ./stokes_flow/test_problems/stokes_testproblem.m
%
   !/bin/rm ./navier_flow/test_problems/navier_testproblem.m
   !/bin/cp ./specific_files/navier_testproblem_unix.m ./navier_flow/test_problems/navier_testproblem.m
%
  fprintf('\nDone.\n')
end

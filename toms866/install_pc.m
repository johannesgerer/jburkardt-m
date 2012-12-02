%install_pc  sets up IFISS on non-UNIX computer
%   IFISS scriptfile: DJS, HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage (see readme.m)

if strncmp(computer,'MAC2',4)
   fprintf('\nInstalling MAC-OS specific files must be done manually:\n')
%
elseif strncmp(computer,'PCWIN',3)
   gohome;
%
   fprintf('\nInstalling PC-OS specific files.\n')
   !copy .\specific_files\setpath_pc.m .\setpath.m
   setpath
%
   delete .\diffusion\test_problems\diff_testproblem.m
   !copy .\specific_files\diff_testproblem_pc.m .\diffusion\test_problems\diff_testproblem.m
%
   delete .\convection\test_problems\cd_testproblem.m
   !copy .\specific_files\cd_testproblem_pc.m .\convection\test_problems\cd_testproblem.m
%
   delete .\stokes_flow\test_problems\stokes_testproblem.m
   !copy .\specific_files\stokes_testproblem_pc.m .\stokes_flow\test_problems\stokes_testproblem.m
%
   delete .\navier_flow\test_problems\navier_testproblem.m
   !copy .\specific_files\navier_testproblem_pc.m .\navier_flow\test_problems\navier_testproblem.m
%
else
  fprintf('\nAll installed!\n')
end

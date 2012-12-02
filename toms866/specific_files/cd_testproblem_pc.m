%cd_testproblem    sets up Reference Examples 3.1 to 3.4 
%   IFISS scriptfile: DJS, HCE; 18 March 2005, PC version. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
gohome
clear 
fprintf('\nspecification of reference convection-diffusion problem.\n')
fprintf('\nchoose specific example');
fprintf('\n     1  Constant vertical wind')
fprintf('\n     2  Vertical wind, characteristic layers')
fprintf('\n     3  Constant wind @ 30 degree angle')
fprintf('\n     4  Recirculating wind\n');
sn = default('',1);

if sn==3 
   !copy .\convection\test_problems\constant_wind.m .\convection\specific_wind.m
   !copy .\convection\test_problems\test_bc.m .\diffusion\specific_bc.m
   square_cd, solve_cd
elseif sn==4
   !copy .\convection\test_problems\circular_wind.m .\convection\specific_wind.m
   !copy .\convection\test_problems\hotwall_bc.m .\diffusion\specific_bc.m
   square_cd, solve_cd
elseif sn==1
   !copy .\convection\test_problems\vertical_wind.m .\convection\specific_wind.m
   !copy .\convection\test_problems\solution1_bc.m .\diffusion\specific_bc.m
   ref_cd, solve_cd
elseif sn==2
   !copy .\convection\test_problems\ref_wind.m .\convection\specific_wind.m
   !copy .\convection\test_problems\ref_bc.m .\diffusion\specific_bc.m
   ref_cd, solve_cd
else
   error('reference problem datafile not found!')
end

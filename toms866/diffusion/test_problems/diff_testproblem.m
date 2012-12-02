%diff_testproblem    sets up Reference Examples 1.1 to 1.4
%   IFISS scriptfile: DJS; 4 March 2005. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
gohome
clear 
fprintf('\nspecification of reference Poisson problem.')
fprintf('\nchoose specific example');
fprintf('\n     1  Square domain, constant source')
fprintf('\n     2  L-shaped domain, constant source')
fprintf('\n     3  Square domain, analytic solution')
fprintf('\n     4  L-shaped domain, analytic solution\n');
sn = default('',1);
%
if sn==1
   !/bin/cp ./diffusion/test_problems/unit_rhs.m ./diffusion/specific_rhs.m
   !/bin/cp ./diffusion/test_problems/zero_bc.m ./diffusion/specific_bc.m
   square_diff
elseif sn==2
   !/bin/cp ./diffusion/test_problems/unit_rhs.m ./diffusion/specific_rhs.m
   !/bin/cp ./diffusion/test_problems/zero_bc.m ./diffusion/specific_bc.m
   ell_diff
elseif sn==3
   !/bin/cp ./diffusion/test_problems/zero_rhs.m ./diffusion/specific_rhs.m
   !/bin/cp ./diffusion/test_problems/solution3_bc.m ./diffusion/specific_bc.m
   square_diff
elseif sn==4
   !/bin/cp ./diffusion/test_problems/zero_rhs.m ./diffusion/specific_rhs.m
   !/bin/cp ./diffusion/test_problems/solution4_bc.m ./diffusion/specific_bc.m
   ell_diff
else
   error('reference problem datafile not found!')
end

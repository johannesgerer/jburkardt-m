%helpme_navier   Navier-Stokes flow problem interactive help 
%   IFISS scriptfile: DJS; 9 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 

fprintf(' \n');
fprintf(' To generate boundary and source term datafiles for the Navier-Stokes\n'); 
fprintf(' flow test problems, simply run the driver: navier_testproblem\n');
fprintf(' Newton and Picard linearization is used with a direct linear solver\n');
fprintf(' \n');
fprintf(' Nonzero boundary conditions are set in the function\n');
fprintf(' /stokes_flow/specific_flow.m\n');
fprintf(' Streamfunction boundary conditions are set in the function\n');
fprintf('/diffusion/specific_bc.m\n');
fprintf(' \n');

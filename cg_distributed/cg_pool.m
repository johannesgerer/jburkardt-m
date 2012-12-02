%% CG_POOL uses the MATLABPOOL command to run the CG code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_POOL\n' );
  fprintf ( 1, '  Run the distributed conjugate gradient example.\n' );

  matlabpool open local 4

  tic
  [ zeta, x ] = cg_fun ( );
  wtime = toc;

  matlabpool close

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated eigenvalue = %f\n', zeta );
  fprintf ( 1, '  Elapsed wallclock time = %f\n', wtime );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_POOL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

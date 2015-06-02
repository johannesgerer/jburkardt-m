function templates_test ( )

%*****************************************************************************80
%
%% TEMPLATES_TEST tests the TEMPLATES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEMPLATES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEMPLATES library.\n' );

  bicg_test ( );
  bicgstab_test ( );
  cg_test ( );
  cgs_test ( );
  cheby_test ( );
  gmres_test ( );
  gs_test ( );
  jacobi_test ( );
  lehmer_test ( );
  mm_to_msm_test ( );
  poisson_test ( );
  qmr_test;
  sor_test ( );
  wathen_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEMPLATES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end




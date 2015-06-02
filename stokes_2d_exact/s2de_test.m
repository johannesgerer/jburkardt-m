function s2de_test ( )

%*****************************************************************************80
%
%% S2DE_TEST tests the S2DE library.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/stokes_2d_exact/s2de_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'S2DE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the S2DE library.\n' );

  uvp_stokes1_test ( );
  resid_stokes1_test ( );
  gnuplot_stokes1_test ( );

  uvp_stokes2_test ( );
  resid_stokes2_test ( );
  gnuplot_stokes2_test ( );

  uvp_stokes3_test ( );
  resid_stokes3_test ( );
  gnuplot_stokes3_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'S2DE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( );

  return
end

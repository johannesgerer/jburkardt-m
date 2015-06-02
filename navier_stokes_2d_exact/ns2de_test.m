function ns2de_test ( )

%*****************************************************************************80
%
%% NS2DE_TEST tests the NS2DE library.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/ns2de_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS2DE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NS2DE library.\n' );
%
%  Taylor Vortex Flow.
%
  uvp_taylor_test ( );
  uvp_taylor_test2 ( );
  rhs_taylor_test ( );
  resid_taylor_test ( );
  gnuplot_taylor_test ( );
  parameter_taylor_test ( );
%
%  Spiral Flow.
%
  uvp_spiral_test ( );
  uvp_spiral_test2 ( );
  rhs_spiral_test ( );
  resid_spiral_test ( );
  gnuplot_spiral_test ( );
  parameter_spiral_test ( );
%
%  Lucas Bystricky Flow.
%
  uvp_lucas_test ( );
  uvp_lucas_test2 ( );
  rhs_lucas_test ( );
  resid_lucas_test ( );
  gnuplot_lucas_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS2DE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( )

  return
end

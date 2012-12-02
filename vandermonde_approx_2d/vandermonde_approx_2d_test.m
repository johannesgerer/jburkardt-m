function vandermonde_approx_2d_test ( )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_2D_TEST tests VANDERMONDE_APPROX_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' );
  addpath ( '../test_interp_2d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_2D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the VANDERMONDE_APPROX_2D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  This test also needs the TEST_INTERP_2D library.\n' );

  prob_num = f00_num ( );
  for prob = 1 : prob_num
    grid = 1;
    for m = [ 0, 1, 2, 4, 8 ]
      vandermonde_approx_2d_test01 ( prob, grid, m );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_2d' )

  return
end

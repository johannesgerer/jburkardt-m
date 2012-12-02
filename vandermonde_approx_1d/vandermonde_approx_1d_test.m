function vandermonde_approx_1d_test ( )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_1D_TEST tests VANDERMONDE_APPROX_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the VANDERMONDE_APPROX_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test also needs the TEST_INTERP library.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for m = [ 0, 1, 2, 3, 4, 5, 9, 12 ]
      vandermonde_approx_1d_test01 ( prob, m );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp' )

  return
end

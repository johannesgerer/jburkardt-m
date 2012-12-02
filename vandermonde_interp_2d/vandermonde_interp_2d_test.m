function vandermonde_interp_2d_test ( )

%*****************************************************************************80
%
%% VANDERMONDE_INTERP_2D_TEST tests VANDERMONDE_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp_2d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the VANDERMONDE_INTERP_2D library.\n' );
  fprintf ( 1, '  This test also needs the TEST_INTERP_2D library.\n' );

  prob_num = f00_num ( );
  for prob = 1 : prob_num
    for m = [ 1, 2, 3, 4, 8 ]
      vandermonde_interp_2d_test01 ( prob, m );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_2d' )

  return
end

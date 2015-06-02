function shepard_interp_2d_test ( )

%*****************************************************************************80
%
%% SHEPARD_INTERP_2D_TEST tests the SHEPARD_INTERP_2D library.
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
  addpath ( '../test_interp_2d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SHEPARD_INTERP_2D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  This test also needs the TEST_INTERP_2D library.\n' );

  prob_num = f00_num ( );
  g = 1;

  for prob = 1 : prob_num

    for p = [ 1.0, 2.0, 4.0, 8.0 ];
      shepard_interp_2d_test01 ( prob, g, p );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_2d' )

  return
end

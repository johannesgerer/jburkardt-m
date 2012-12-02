function rbf_interp_2d_test ( )

%*****************************************************************************80
%
%% RBF_INTERP_2D_TEST tests RBF_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_interp_2d' )
  addpath ( '../r8lib' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the RBF_INTERP_2D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  This test also needs the TEST_INTERP_2D library.\n' );

  prob_num = f00_num ( );
  g = 1;

  for prob = 1 : prob_num
    rbf_interp_2d_test01 ( prob, g, @phi1, 'phi1' );
    rbf_interp_2d_test01 ( prob, g, @phi2, 'phi2' );
    rbf_interp_2d_test01 ( prob, g, @phi3, 'phi3' );
    rbf_interp_2d_test01 ( prob, g, @phi4, 'phi4' );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../test_interp_2d' )
  rmpath ( '../r8lib' )

  return
end

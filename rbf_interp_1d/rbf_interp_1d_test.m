function rbf_interp_1d_test ( )

%*****************************************************************************80
%
%% RBF_INTERP_1D_TEST tests RBF_INTERP_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the RBF_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP library.\n' );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num
%
%  Determine an appropriate value of R0, the spacing parameter.
%
    nd = p00_data_num ( prob );
    xy = p00_data ( prob, 2, nd );
    xd = reshape ( xy(1,1:nd), nd, 1 );
    xmax = max ( xd );
    xmin = min ( xd );
    r0 = ( xmax - xmin ) / ( nd - 1 );

    rbf_interp_1d_test01 ( prob, @phi1, 'phi1', r0 );
    rbf_interp_1d_test01 ( prob, @phi2, 'phi2', r0 );
    rbf_interp_1d_test01 ( prob, @phi3, 'phi3', r0 );
    rbf_interp_1d_test01 ( prob, @phi4, 'phi4', r0 );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp' )

  return
end

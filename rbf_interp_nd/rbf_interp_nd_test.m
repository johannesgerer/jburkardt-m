function rbf_interp_nd_test ( )

%*****************************************************************************80
%
%% RBF_INTERP_ND_TEST tests RBF_INTERP_ND.
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
  addpath ( '../r8lib' )
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the RBF_INTERP_ND library.\n' );
  fprintf ( 1, '  The R8LIB library is also needed.\n' );

  rbf_interp_nd_test01 ( );
  rbf_interp_nd_test02 ( );
  rbf_interp_nd_test03 ( );
  rbf_interp_nd_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
  rmpath ( '../r8lib' )

  return
end

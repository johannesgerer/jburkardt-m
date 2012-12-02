function sparse_interp_nd_test ( )

%*****************************************************************************80
%
%% SPARSE_INTERP_ND_TEST tests SPARSE_INTERP_ND.
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
  fprintf ( 1, 'SPARSE_INTERP_ND_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SPARSE_INTERP_ND library.\n' );
  fprintf ( 1, '  The R8LIB library is also required.\n' );

  m = 1;
  sparse_max = 9;
  sparse_interp_nd_test01 ( m, sparse_max );

  m = 2;
  sparse_max = 9;
  sparse_interp_nd_test01 ( m, sparse_max );

  m = 3;
  sparse_max = 9;
  sparse_interp_nd_test01 ( m, sparse_max );

  m = 4;
  sparse_max = 7;
  sparse_interp_nd_test01 ( m, sparse_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_INTERP_ND_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )

  return
end




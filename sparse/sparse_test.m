function sparse_test ( )

%*****************************************************************************80
%
%% SPARSE_TEST tests the SPARSE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test MATLAB''s sparse matrix features.\n' );

  sparse_test01 ( );
  sparse_test02 ( );
  sparse_test03 ( );
  sparse_test04 ( );
  sparse_test05 ( );
  sparse_test06 ( );
  sparse_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

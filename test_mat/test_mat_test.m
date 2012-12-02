function test_mat_test ( )

%*****************************************************************************80
%
%% TEST_MAT_TEST tests TEST_MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MAT_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TEST_MAT library.\n' );

  test_mat_test_cond ( );
  test_mat_test_determinant ( );
  test_mat_test_eigen ( );
  test_mat_test_inverse ( );
  test_mat_test_null ( );
  test_mat_test_plu ( );
  test_mat_test_solution ( );
%
%  Terminate.
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MAT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


function test_mat_test ( )

%*****************************************************************************80
%
%% TEST_MAT_TEST tests the TEST_MAT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2015
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
%
%  Utilities.
%
  bvec_next_grlex_test ( );
  legendre_zeros_test ( );
  mertens_test ( );
  moebius_test ( );
  r8mat_is_eigen_left_test ( );
  r8mat_is_eigen_right_test ( );
  r8mat_is_llt_test ( );
  r8mat_is_null_left_test ( );
  r8mat_is_null_right_test ( );
  r8mat_is_solution_test ( );
  r8mat_norm_fro_test ( );
%
%  Interesting stuff.
%
  test_condition ( );
  test_determinant ( );
  test_eigen_left ( );
  test_eigen_right ( );
  test_inverse ( );
  test_llt ( );
  test_null_left ( );
  test_null_right ( );
  test_plu ( );
  test_solution ( );
  test_type ( );
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


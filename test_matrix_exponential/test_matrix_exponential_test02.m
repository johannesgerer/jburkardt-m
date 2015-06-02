function test_matrix_exponential_test02 ( )

%*****************************************************************************80
%
%% TEST_MATRIX_EXPONENTIAL_TEST02 retrieves the complex test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_EXPONENTIAL_TEST02:\n' );
  fprintf ( 1, '  Retrieve the data for each matrix exponential test.\n' );

  test_num = c8mat_exp_test_num ( );

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test #%d\n', test );

    n = c8mat_exp_n ( test );

    c8mat_exp_story ( test );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Matrix order N = %d\n', n );

    a = c8mat_exp_a ( test, n );

    c8mat_print ( n, n, a, '  Matrix:' );

    a_exp = c8mat_exp_expa ( test, n );
    c8mat_print ( n, n, a_exp, '  Exact Exponential:' );

  end

  return
end

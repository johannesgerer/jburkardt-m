function matrix_exponential_test02 ( )

%*****************************************************************************80
%
%% MATRIX_EXPONENTIAL_TEST02 compares matrix exponential algorithms.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATRIX_EXPONENTIAL_TEST02:\n' );
  fprintf ( 1, '  EXPM is MATLAB''s matrix exponential function;\n' );
  fprintf ( 1, '  C8MAT_EXPM1 is an M-file equivalent to EXPM;\n' );
  fprintf ( 1, '  C8MAT_EXPM2 uses a Taylor series approach;\n' );
  fprintf ( 1, '  C8MAT_EXPM3 relies on an eigenvalue calculation.\n' );

  test_num = c8mat_exp_test_num ( );

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test #%d\n', test );

    c8mat_exp_story ( test );

    n = c8mat_exp_n ( test );

    fprintf ( 1, '  Matrix order N = %d\n', n );

    a = c8mat_exp_a ( test, n );

    c8mat_print ( n, n, a, '  Matrix:' );

    a_exp = expm ( a );
    c8mat_print ( n, n, a_exp, '  EXPM(A):' );

    a_exp = c8mat_expm1 ( a );
    c8mat_print ( n, n, a_exp, '  C8MAT_EXPM1(A):' );

    a_exp = c8mat_expm2 ( a );
    c8mat_print ( n, n, a_exp, '  C8MAT_EXPM2(A):' );

    a_exp = c8mat_expm3 ( a );
    c8mat_print ( n, n, a_exp, '  C8MAT_EXPM3(A):' );

    a_exp = c8mat_exp_expa ( test, n );
    c8mat_print ( n, n, a_exp, '  Exact Exponential:' );

  end

  return
end

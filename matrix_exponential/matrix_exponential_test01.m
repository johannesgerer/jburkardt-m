function matrix_exponential_test01 ( )

%*****************************************************************************80
%
%% MATRIX_EXPONENTIAL_TEST01 compares matrix exponential algorithms.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATRIX_EXPONENTIAL_TEST01:\n' );
  fprintf ( 1, '  EXPM is MATLAB''s matrix exponential function;\n' );
  fprintf ( 1, '  R8MAT_EXPM1 is an M-file equivalent to EXPM;\n' );
  fprintf ( 1, '  R8MAT_EXPM2 uses a Taylor series approach;\n' );
  fprintf ( 1, '  R8MAT_EXPM3 relies on an eigenvalue calculation.\n' );

  test_num = r8mat_exp_test_num ( );

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test #%d\n', test );

    r8mat_exp_story ( test );

    n = r8mat_exp_n ( test );

    fprintf ( 1, '  Matrix order N = %d\n', n );

    a = r8mat_exp_a ( test, n );

    r8mat_print ( n, n, a, '  Matrix:' );

    a_exp = expm ( a );
    r8mat_print ( n, n, a_exp, '  EXPM(A):' );

    a_exp = r8mat_expm1 ( a );
    r8mat_print ( n, n, a_exp, '  R8MAT_EXPM1(A):' );

    a_exp = r8mat_expm2 ( a );
    r8mat_print ( n, n, a_exp, '  R8MAT_EXPM2(A):' );

    a_exp = r8mat_expm3 ( a );
    r8mat_print ( n, n, a_exp, '  R8MAT_EXPM3(A):' );

    a_exp = r8mat_exp_expa ( test, n );
    r8mat_print ( n, n, a_exp, '  Exact Exponential:' );

  end

  return
end

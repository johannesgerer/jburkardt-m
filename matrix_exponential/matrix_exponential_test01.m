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
  fprintf ( 1, '  EXPM1_USER is an M-file equivalent to EXPM;\n' );
  fprintf ( 1, '  EXPM2 uses a Taylor series approach;\n' );
  fprintf ( 1, '  EXPM3 relies on an eigenvalue calculation.\n' );

  test_num = mexp_test_num ( );

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test #%d\n', test );

    mexp_story ( test );

    n = mexp_n ( test );

    fprintf ( 1, '  Matrix order N = %d\n', n );

    a = mexp_a ( test, n );

    r8mat_print ( n, n, a, '  Matrix:' );

    a_exp = expm ( a );
    r8mat_print ( n, n, a_exp, '  EXPM(A):' );

    a_exp = expm1_user ( a );
    r8mat_print ( n, n, a_exp, '  EXPM1(A):' );

    a_exp = expm2 ( a );
    r8mat_print ( n, n, a_exp, '  EXPM2(A):' );

    a_exp = expm3 ( a );
    r8mat_print ( n, n, a_exp, '  EXPM3(A):' );

    a_exp = mexp_expa ( test, n );
    r8mat_print ( n, n, a_exp, '  Exact Exponential:' );

  end

  return
end

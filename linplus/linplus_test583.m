function linplus_test583 ( )

%*****************************************************************************80
%
%% TEST583 tests R8STO_INVERSE.
%
%  Discussion:
%
%    This routine was modified at the suggestion of Yunong Zhang
%    of the EEE department of the University of Strathclyde.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  a = [ 4.0E+00, 2.0E+00, 0.8E+00, 0.4E+00, 0.1E+00 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST583\n' );
  fprintf ( 1, '  R8STO_INVERSE computes the inverse of a positive\n' );
  fprintf ( 1, '  definite symmetric Toeplitz matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  r8sto_print ( n, a, '  The symmetric Toeplitz matrix A:' );

  b = r8sto_inverse ( n, a );

  r8ge_print ( n, n, b, '  The inverse matrix B:' );

  error_max = norm ( toeplitz ( a ) * b - eye ( n ), inf );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum discrepancy in A * B - I is %e\n', error_max );

  return
end

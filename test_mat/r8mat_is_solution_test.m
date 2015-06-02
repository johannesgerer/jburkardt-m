function r8mat_is_solution_test ( )

%*****************************************************************************80
%
%% R8MAT_IS_SOLUTION_TEST tests R8MAT_IS_SOLUTION.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_SOLUTION_TEST:\n' );
  fprintf ( 1, '  R8MAT_IS_SOLUTION tests whether X is the solution of\n' );
  fprintf ( 1, '  A*X=B by computing the Frobenius norm of the residual.\n' );
%
%  Get random shapes.
%
  i4_lo = 1;
  i4_hi = 10;
  seed = 123456789;
  [ m, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
  [ n, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
  [ k, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
%
%  Get a random A.
%
  r8_lo = -5.0;
  r8_hi = +5.0;
  [ a, seed ] = r8mat_uniform_ab ( m, n, r8_lo, r8_hi, seed );
%
%  Get a random X.
%
  r8_lo = -5.0;
  r8_hi = +5.0;
  [ x, seed ] = r8mat_uniform_ab ( n, k, r8_lo, r8_hi, seed );
%
%  Compute B = A * X.
%
  b = a * x;
%
%  Compute || A*X-B||
%
  enorm = r8mat_is_solution ( m, n, k, a, x, b );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A is %d by %d\n', m, n );
  fprintf ( 1, '  X is %d by %d\n', n, k );
  fprintf ( 1, '  B is %d by %d\n', m, k );
  fprintf ( 1, '  Frobenius error in A*X-B is %g\n', enorm );

  return
end
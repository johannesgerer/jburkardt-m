function linplus_test45 ( )

%*****************************************************************************80
%
%% TEST45 tests R8PBU_CG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 50;
  mu = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST45\n' );
  fprintf ( 1, '  R8PBU_CG applies the conjugate gradient method\n' );
  fprintf ( 1, '    to a symmetric positive definite banded\n' );
  fprintf ( 1, '    linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix values.
%
  a(2,1:n) = 2.0E+00;
  a(1,2:n) = -1.0E+00;

  r8pbu_print_some ( n, mu, a, 1, 1, 10, 10, ...
    '  The symmetric banded matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the right hand side.
%
  b = r8pbu_mxv ( n, mu, a, x );
%
%  Set the approximate solution.
%
  x(1:n) = 1.0E+00;
%
%  Call the conjugate gradient method.
%
  x = r8pbu_cg ( n, mu, a, b, x );
%
%  Compute the residual, A*x-b
%
  ax = r8pbu_mxv ( n, mu, a, x );
 
  err = max ( abs ( ax(1:n) - b(1:n) ) );
 
  r8vec_print_some ( n, x, 1, 10, '  Solution:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum residual = %f\n', err );
 
  return
end

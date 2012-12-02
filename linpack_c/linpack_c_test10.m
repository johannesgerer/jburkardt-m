function linpack_c_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests CGTSL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  For a complex tridiagonal matrix:\n' );
  fprintf ( 1, '  CGTSL solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  seed = 123456789;

  c(1) = 0.0;
  [ c(2:n), seed ] = c4vec_uniform_01 ( n-1, seed );

  [ e(1:n-1), seed ] = c4vec_uniform_01 ( n-1, seed );
  e(n) = 0.0;

  d(1:n) = 0.0;

  d(1:n-1) = d(1:n-1) - 2.0 * e(1:n-1);
  d(2:n)   = d(2:n) - 2.0 * c(2:n);
%
%  Set the desired solution.
%
  for i = 1 : n
    x(i) = complex ( i, 10 * i );
  end
%
%  Compute the corresponding right hand side.
%
  b(1) = d(1) * x(1) + e(1) * x(2);
  for i = 2 : n-1
    b(i) = c(i) * x(i-1) + d(i) * x(i) + e(i) * x(i+1);
  end
  b(n) = c(n) * x(n-1) + d(n) * x(n);
%
%  Solve the tridiagonal system.
%
  [ b, info ] = cgtsl ( n, c, d, e, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)  (%8f  %8f)\n', ...
      real ( b(i) ), imag ( b(i) ), real ( x(i) ), imag ( x(i) ) );
  end

  return
end

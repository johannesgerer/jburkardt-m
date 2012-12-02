function linpack_c_test37 ( )

%*****************************************************************************80
%
%% TEST37 tests CTRSL.
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
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  triangular matrix (TR),\n' );
  fprintf ( 1, '  CTRSL solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the matrix.
%
  seed = 123456789;

  for i = 1 : n
    for j = 1 : i
      [ a(i,j), seed ] = c4_uniform_01 ( seed );
    end
    a(i,i+1:n) = 0.0;
  end
%
%  Set the desired solution
%
  for i = 1 : n
    x(i) = complex ( i, 10 * i );
  end
%
%  Compute the corresponding right hand side.
%
  b(1:n) = a(1:n,1:n) * transpose ( x(1:n) );
%
%  Solve the lower triangular system.
%
  job = 0;
  [ b, info ] = ctrsl ( a, lda, n, b, job );

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

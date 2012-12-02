function linpack_z_test35 ( )

%*****************************************************************************80
%
%% TEST35 tests ZTRCO.
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
  n = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST35\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  triangular matrix (TR),\n' );
  fprintf ( 1, '  ZTRCO estimates the condition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the matrix.
%
  seed = 123456789;

  for i = 1 : n
    for j = 1 : i
      [ a(i,j), seed ] = c8_uniform_01 ( seed );
    end
    a(i,i+1:n) = 0.0;
  end
%
%  Get the condition of the lower triangular matrix.
%
  job = 0;
  rcond = ztrco ( a, lda, n, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end

function subpak_test089 ( )

%*****************************************************************************80
%
%% TEST089 tests R8PLU_SOL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST089\n' );
  fprintf ( 1, '  R8PLU_SOL solves a linear system A*x=b\n' );
  fprintf ( 1, '  using the compressed PLU factors of A.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  r8mat_print ( n, n, a, '  The matrix A:' );
%
%  Set the right hand side.
%
  for i = 1 : n
    x(i) = i;
  end

  b(1:n) = a(1:n,1:n) * x(1:n)';
  x(1:n) = 0.0;

  r8vec_print ( n, b, '  The right hand side B:' );
%
%  Factor the matrix.
%
  [ pivot, lu, info ] = r8mat_to_r8plu ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Fatal error!\n' );
    fprintf ( 1, '  R8MAT_TO_R8PLU declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the system.
%
  x = r8plu_sol ( n, pivot, lu, b );

  r8vec_print ( n, x, '  The computed solution X:' );

  return
end

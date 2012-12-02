function r8lib_test080 ( )

%*****************************************************************************80
%
%% TEST080 tests R8MAT_TO_R8PLU and R8PLU_TO_R8MAT;
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
  b = 0.0;
  c = 1.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST080\n' );
  fprintf ( 1, '  R8MAT_TO_R8PLU determines the compressed PLU factors\n' );
  fprintf ( 1, '  of an R8MAT.\n' );
  fprintf ( 1, '  R8PLU_TO_R8MAT determines the original matrix from\n' );
  fprintf ( 1, '  the compressed PLU factors.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_ab ( n, n, b, c, seed );

  r8mat_print ( n, n, a, '  The matrix A:' );
%
%  Factor the matrix.
%
  [ pivot, lu, info ] = r8mat_to_r8plu ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Warning!\n' );
    fprintf ( 1, '  R8MAT_TO_R8PLU declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
  end
%
%  Display the gory details.
%
  i4vec_print ( n, pivot, '  The pivot vector P:' );

  r8mat_print ( n, n, lu, '  The compressed LU factors:' );
%
%  Recover the matrix from the PLU factors.
%
  a2 = r8plu_to_r8mat ( n, pivot, lu );

  r8mat_print ( n, n, a2, '  The recovered matrix A2:' );

  return
end

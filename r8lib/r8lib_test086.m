function subpak_test086 ( )

%*****************************************************************************80
%
%% TEST086 tests R8PLU_DET;
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
  fprintf ( 1, 'TEST086\n' );
  fprintf ( 1, '  R8PLU_DET determines the determinant of a matrix\n' );
  fprintf ( 1, '  from its compressed PLU factors.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  r8mat_print ( n, n, a, '  The matrix A:' );
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
%  Compute the determinant.
%
  det = r8plu_det ( n, pivot, lu );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The determinant = %f\n', det );

  return
end

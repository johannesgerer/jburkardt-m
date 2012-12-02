function linplus_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests R83_NP_DET, R83_NP_FA.
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
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  For a tridiagonal matrix that can be factored\n' );
  fprintf ( 1, '    with no pivoting,\n' );
  fprintf ( 1, '  R83_NP_FA factors,\n' );
  fprintf ( 1, '  R83_NP_DET computes the determinant.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r83_random ( n, seed );
%
%  Copy the matrix into general storage.
%
  b = r83_to_r8ge ( n, a );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r83_np_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST05 - Warning!\n' );
    fprintf ( 1, '  R83_NP_FA returns INFO = %d\n', info );
  end

  r83_print ( n, a_lu, '  The factored R83 matrix:' );
%
%  Compute the determinant.
%
  det = r83_np_det ( n, a_lu );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R83_NP_DET computes determinant = %f\n', det );
%
%  Factor the matrix in R8GE storage.
%
  [ b_lu, info ] = r8ge_np_fa ( n, b );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST05 - Warning!\n' );
    fprintf ( 1, '  R8GE_NP_FA returns INFO = %d\n', info );
  end
%
%  Compute the determinant of the R8GE matrix.
%
  det = r8ge_np_det ( n, b_lu );

  fprintf ( 1, '  R8GE_NP_DET computes determinant = %f\n', det );

  return
end

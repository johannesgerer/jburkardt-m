function linplus_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests R8GE_NP_FA, R8GE_NP_INVERSE.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_NP_FA computes LU factors without pivoting,\n' );
  fprintf ( 1, '  R8GE_NP_INVERSE computes the inverse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( n, n, seed );

  r8ge_print ( n, n, a, '  The random matrix:' );
%
%  Factor and invert the matrix.
%
  [ a_lu, info ] = r8ge_np_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST33 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_NP_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  b = r8ge_np_inverse ( n, a_lu );

  r8ge_print ( n, n, b, '  The inverse matrix:' );
%
%  Compute A * B = C.
%
  c = r8ge_mxm ( n, a, b );

  r8ge_print ( n, n, c, '  The product:' );

  return
end

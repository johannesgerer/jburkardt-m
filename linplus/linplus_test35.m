function linplus_test35 ( )

%*****************************************************************************80
%
%% TEST35 tests R8GE_INVERSE.
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
  n = 4;
  x = 2.0E+00;
  y = 3.0E+00;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST35\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_INVERSE computes the inverse matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  for j = 1 : n
    for i = 1 : n
      if ( i == j )
        a(i,i) = x + y;
      else
        a(i,j) = y;
      end
    end
  end

  r8ge_print ( n, n, a, '  Matrix A:' );
%
%  Factor and invert the matrix.
%
  [ a_lu, pivot, info ] = r8ge_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST35 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_FA reports the matrix is singular.\n' );
    return
  end

  a_inverse = r8ge_inverse ( n, a_lu, pivot );

  r8ge_print ( n, n, a_inverse, '  Inverse matrix B:' );
%
%  Check.
%
  c = r8ge_mxm ( n, a, a_inverse );

  r8ge_print ( n, n, c, '  Product matrix:' );

  return
end

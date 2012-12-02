function linplus_test29 ( )

%*****************************************************************************80
%
%% TEST29 tests R8GE_DET.
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
  fprintf ( 1, 'TEST29\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_DET computes the determinant.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = x + y;
      else
        a(i,j) = y;
      end
    end
  end
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8ge_fa ( n, a );
%
%  Compute the determinant.
%
  det = r8ge_det ( n, a_lu, pivot );

  exact = x^(n-1) * ( x + n * y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8GE_DET computes the determinant = %f\n', det );
  fprintf ( 1, '  Exact determinant =                %f\n', exact );

  return
end

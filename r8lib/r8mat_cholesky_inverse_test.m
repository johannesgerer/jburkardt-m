function r8mat_cholesky_inverse_test ( )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_INVERSE_TEST tests R8MAT_CHOLESKY_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2013
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_CHOLESKY_INVERSE_TEST\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  R8MAT_CHOLESKY_INVERSE computes the inverse.\n' );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 2.0;
      elseif ( abs ( i - j ) == 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  r8mat_print ( n, n, a, '  Matrix to be inverted:' );

  a2 = r8mat_cholesky_inverse ( n, a );

  r8mat_print ( n, n, a2, '  Inverse matrix:' );

  a3 = a2 * a;
  
  r8mat_print ( n, n, a3, '  Product inv(A) * A:' );

  return
end



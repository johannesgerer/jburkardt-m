function subpak_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests R8MAT_INVERSE_4D.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST066\n' );
  fprintf ( 1, '  R8MAT_INVERSE_4D inverts a 4 x 4 matrix.\n' );

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) = n + 1 - j;
      elseif ( j == i - 1 )
        a(i,j) = n - j;
      else
        a(i,j) = 0.0;
      end

    end
  end

  r8mat_print ( n, n, a, '  Matrix A to be inverted:' );

  [ b, det ] = r8mat_inverse_4d ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant is %f\n', det );

  r8mat_print ( n, n, b, '  Inverse B:' );

  c = a * b;

  r8mat_print ( n, n, c, '  Product C = A * B:' );

  return
end

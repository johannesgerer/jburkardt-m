function r8mat_mm_test ( )

%*****************************************************************************80
%
%% R8MAT_MM_TEST tests R8MAT_MM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2015
%
%  Author:
%
%    John Burkardt
%
  n1 = 4;
  n2 = 3;
  n3 = n1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_MM_TEST\n' );
  fprintf ( 1, '  R8MAT_MM computes a matrix-matrix product C = A * B.\n' );

  for i = 1 : n1
    for j = 1 : n2

      if ( j == 1 )
        a(i,j) = 1.0;
      elseif ( i == 1 )
        a(i,j) = 0.0;
      else
        a(i,j) = a(i-1,j-1) + a(i-1,j);
      end

    end
  end

  b = a';

  c = r8mat_mm ( n1, n2, n3, a, b );

  r8mat_print ( n1, n2, a, '  A:' );
  r8mat_print ( n2, n3, b, '  B:' );
  r8mat_print ( n1, n3, c, '  C = A*B:' );

  return
end

function r8mat_nonzeros_test ( )

%*****************************************************************************80
%
%% R8MAT_NONZEROS_TEST tests R8MAT_NONZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  a = zeros ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_NONZEROS_TEST\n' );
  fprintf ( 1, '  R8MAT_NONZEROS counts nonzeros in an R8MAT.\n' );

  c1 = 0;
  for i = 1 : m
    for j = 1 : n
      if ( mod ( i, 2 ) == 0 && mod (  j, 2 ) == 0 )
        a(i,j) = 1.0;
        c1 = c1 + 1;
      else
        a(i,j) = 0.0;
      end
    end
  end

  r8mat_print ( m, n, a, '  Matrix A:' );

  c2 = r8mat_nonzeros ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected nonzeros = %d\n', c1 );
  fprintf ( 1, '  Computed nonzeros = %d\n', c2 );

  return
end

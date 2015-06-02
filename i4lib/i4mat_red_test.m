function i4mat_red_test ( )

%*****************************************************************************80
%
%% I4MAT_RED_TEST tests I4MAT_RED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 5;
  test_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4MAT_RED_TEST\n' );
  fprintf ( 1, '  I4MAT_RED divides common factors in a matrix;\n' );
 
  for test = 1 : test_num
 
    if ( test == 1 )
 
      k = 0;
      for i = 1 : m
        for j = 1 : n
          k = k + 1;
          a(i,j) = k;
        end
      end
 
    elseif ( test == 2 )
 
      factor = 8 * 7 * 6 * 5 * 4 * 3 * 2;
 
      for i = 1 : m
        for j = 1 : n
          a(i,j) = factor / ( i + j - 1 );
        end
      end
 
    elseif ( test == 3 )
 
      for i = 1 : m
        for j = 1 : n
          a(i,j) = i * j;
        end
      end

    end
 
    i4mat_print ( m, n, a, '  The original matrix:' );
 
    [ a, row, col ] = i4mat_red ( m, n, a );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The matrix, as returned by I4MAT_RED:\n' );
    fprintf ( 1, '  (Factors are displayed in an extra row and column.\n' );
    fprintf ( 1, '\n' );
    for i = 1 : m
      for j = 1 : n
        fprintf ( 1, '  %6d', a(i,j) );
      end
      fprintf ( 1, '  %6d\n', row(i) );
    end
    for j = 1 : n
      fprintf ( 1, '  %6d', col(j) );
    end
    fprintf ( 1, '\n' );

  end
 
  return
end

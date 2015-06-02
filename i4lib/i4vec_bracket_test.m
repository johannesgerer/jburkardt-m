function i4vec_bracket_test ( )

%*****************************************************************************80
%
%% I4VEC_BRACKET_TEST tests I4VEC_BRACKET.
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
  n_max = 20;
  test_num = 6;
  atest = [ -10, 2, 9, 10, 20, 24 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_BRACKET_TEST\n' );
  fprintf ( 1, '  I4VEC_BRACKET finds a pair of entries in a\n' );
  fprintf ( 1, '  sorted integer array which bracket a value.\n' );

  n = 10;
  for i = 1 : n
    a(i) = 2 * i;
  end
  a(6) = a(5);

  i4vec_print ( n, a, '  Sorted array:' );

  for test = 1 : test_num

    aval = atest(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Search for AVAL = %d\n', aval );

    [ left, right ] = i4vec_bracket ( n, a, aval );

    fprintf ( 1, '  Left =  %d\n', left );
    fprintf ( 1, '  Right = %d\n', right );

    if ( 1 <= left ) 
      fprintf ( 1, '  A(LEFT) = %d\n', a(left) );
    end

    if ( 1 <= right )
      fprintf ( 1, '  A(RIGHT) = %d\n', a(right) );
    end
%
%  Insert the value.
%
    if ( left == -1 )
      left = 0;
    end

    if ( left == right )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  No insertion necessary.\n' );

    else

      a = i4vec_insert ( n, a, left+1, aval );

      n = n + 1;

      i4vec_print ( n, a, '  Sorted, augmented array:' );

    end

  end

  return
end

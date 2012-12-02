function r8lib_test113 ( )

%*****************************************************************************80
%
%% TEST113 tests R8VEC_BRACKET2.
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
  n = 10;
  test_num = 6;

  xtest = [ -10.0, 1.0, 4.5, 5.0, 10.0, 12.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST113\n' );
  fprintf ( 1, '  R8VEC_BRACKET2 finds a pair of entries in a\n' );
  fprintf ( 1, '    sorted DVEC which bracket a value.\n' );

  x = r8vec_indicator ( n );
  x(6) = x(5);

  r8vec_print ( n, x, '  Sorted array:' );

  left = 0;

  for test = 1 : test_num

    xval = xtest(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Search for XVAL = ', xval );

    if ( 0 < left )
      start = left;
    else
      start = floor ( ( n + 1 ) / 2 );
    end

    fprintf ( 1, '  Start = %d\n', start );

    [ left, right ] = r8vec_bracket2 ( n, x, xval, start );

    fprintf ( 1, '  Left =  %d\n', left );
    fprintf ( 1, '  Right = %d\n', right );

    if ( 1 <= left )
      fprintf ( 1, '  X(LEFT) = %f\n', x(left) );
    end

    if ( 1 <= right )
      fprintf ( 1, '  X(RIGHT) = %f\n', x(right) );
    end

  end

  return
end

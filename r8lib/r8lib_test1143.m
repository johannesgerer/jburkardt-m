function r8lib_test1143 ( )

%*****************************************************************************80
%
%% R8LIB_TEST1143 tests R8VEC_BRACKET5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2012
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  test_num = 6;

  xtest = [ -10.0, 1.0, 4.5, 5.0, 10.0, 12.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST1143\n' );
  fprintf ( 1, '  R8VEC_BRACKET5 finds a pair of entries in a\n' );
  fprintf ( 1, '  sorted R8VEC which bracket a value.\n' );

  x = r8vec_indicator ( n );
  x(6) = x(5);

  r8vec_print ( n, x, '  Sorted array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        LEFT                   RIGHT\n' );
  fprintf ( 1, '      X(LEFT)       XVAL     X(RIGHT)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    xval = xtest(test);

    left = r8vec_bracket5 ( n, x, xval );

    if ( left == -1 )
      fprintf ( 1, '  %10d\n', left );
      fprintf ( 1, '              %10.4f  (Not bracketed!)\n' );
    else
      right = left + 1;
      fprintf ( 1, '  %10d              %10d\n', left, right );
      fprintf ( 1, '  %10.4f  %10.4f  %10.4f\n', x(left), xval, x(right) );
    end

  end

  return
end

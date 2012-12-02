function spline_test002 ( )

%*****************************************************************************80
%
%% TEST002 tests R8VEC_BRACKET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  n = 10;
  ntest = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST002\n' );
  fprintf ( 1, '  R8VEC_BRACKET finds a pair of entries in a\n' );
  fprintf ( 1, '    sorted real array which bracket a value.\n' );

  xtest(1:6) = [ -10.0, 1.0, 4.5, 5.0, 10.0, 12.0 ];

  x = r8vec_indicator ( n );
  x(6) = x(5);

  r8vec_print ( n, x, '  Sorted array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    LEFT             RIGHT\n' );
  fprintf ( 1, '  X(LEFT)   XVAL   X(RIGHT)\n' );
  fprintf ( 1, '\n' );

  for itest = 1 : ntest

    xval = xtest(itest);

    [ left, right ] = r8vec_bracket ( n, x, xval );

    fprintf ( 1, '%14d              %14d\n', left, right );

    if ( 1 <= left & 1 <= right )
      fprintf ( 1, '%14f  %14f  %14f\n', x(left), xval, x(right) );
    elseif ( left < 1 & 1 <= right )
      fprintf ( 1, '                %14f  %14f\n', xval, x(right) );
    elseif ( 1 <= left & right < 1 )
      fprintf ( 1, '%14f  %14f\n', x(left), xval );
    elseif ( left < 1 & right < 1 ) 
      fprintf ( 1, '                %14f\n', xval );
    end

  end

  return
end

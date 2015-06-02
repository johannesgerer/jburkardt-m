function polygon_properties_test10 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST10 tests POLYGON_IS_CONVEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;
  test_num = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST10\n' );
  fprintf ( 1, '  POLYGON_IS_CONVEX determines if a polygon\n' );
  fprintf ( 1, '  is convex.\n' );

  for test = 1 : test_num

    if ( test == 1 )
      n = 1;
      v = [ ...
        0.0, 0.0 ]';
      title = '  A point:';
    elseif ( test == 2 )
      n = 2;
      v = [ ...
        0.0, 0.0; ...
        1.0, 2.0 ]';
      title = '  A line:';
    elseif ( test == 3 )
      n = 3;
      v = [ ...
        0.0, 0.0; ...
        2.0, 0.0; ...
        1.0, 0.0 ]';
      title = '  A triangle:';
    elseif ( test == 4 )
      n = 3;
      v = [ ...
        0.0, 0.0; ...
        1.0, 0.0; ...
        0.0, 2.0 ]';
      title = '  A CCW triangle:';
    elseif ( test == 5 )
      n = 3;
      v = [ ...
        0.0, 0.0; ...
        0.0, 2.0; ...
        1.0, 0.0 ]';
      title = '  A CW triangle:';
    elseif ( test == 6 )
      n = 4;
      v = [ ...
        1.0, 0.0; ...
        2.0, 0.0; ...
        3.0, 1.0; ...
        0.0, 1.0 ]';
      title = '  Polygon with large angle:';
    elseif ( test == 7 )
      n = 5;
      v = [ ...
        0.0, 0.0; ...
        0.5, 0.5; ...
        1.0, 0.0; ...
        1.0, 1.0; ...
        0.0, 1.0 ]';
      title = '  Polygon with huge angle:';
    elseif ( test == 8 )
      n = 5;
      v = zeros ( 2, n );
      for i = 1 : n
        angle = ( i - 1 ) * 4.0 * pi / n;
        v(1,i) = cos ( angle );
        v(2,i) = sin ( angle );
      end
      title = '  A five-pointed star:';
    elseif ( test == 9 )
      n = 6;
      v = zeros ( 2, n );
      for i = 1 : n
        angle = ( i - 1 ) * 2.0 * pi / n;
        v(1,i) = cos ( angle );
        v(2,i) = sin ( angle );
      end
      title = '  A hexagon:';
    elseif ( test == 10 )
      n = 6;
      v = [ ...
        0.0, 0.0; ...
        2.0, 0.0; ...
        1.0, 1.0; ...
        0.0, 0.0; ...
        2.0, 0.0; ...
        1.0, 1.0 ]';
      title = '  A triangle twice:';
    elseif ( test == 11 )
      n = 8;
      v = [ ...
        1.0, 0.0; ...
        3.0, 0.0; ...
        3.0, 3.0; ...
        0.0, 3.0; ...
        0.0, 1.0; ...
        2.0, 1.0; ...
        2.0, 2.0; ...
        1.0, 2.0 ]';
      title = '  Square knot:';
    end

    r8mat_transpose_print ( 2, n, v, title );
    result = polygon_is_convex ( n, v );
    if ( result == -1 )
      fprintf ( 1, '  The polygon is not convex.\n' );
    elseif ( result == 0 )
      fprintf ( 1, '  The polygon is degenerate and convex.\n' );
    elseif ( result == 1 )
      fprintf ( 1, '  The polygon is convex and counterclockwise.\n' );
    elseif ( result == 2 )
      fprintf ( 1, '  The polygon is convex and clockwise.\n' );
    end

  end

  return
end


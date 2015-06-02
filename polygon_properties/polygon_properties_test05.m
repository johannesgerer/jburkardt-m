function polygon_properties_test05 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST05 tests POLYGON_CONTAINS_POINT, POLYGON_CONTAINS_POINT_2.
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
  n = 5;
  test_num = 4;
  p_test = [ ...
    1.0,  1.0; ...
    3.0,  4.0; ...
    0.0,  2.0; ...
    0.5, -0.25 ]';
  v = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 2.0 ]';
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST05\n' );
  fprintf ( 1, '  POLYGON_CONTAINS_POINT determines if\n' );
  fprintf ( 1, '  a point is in a polygon.\n' );
  fprintf ( 1, '  POLYGON_CONTAINS_POINT_2 determines if\n' );
  fprintf ( 1, '  a point is in a polygon.\n' );

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '          P          In1  In2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    p(1:2,1) = p_test(1:2,test);
 
    inside1 = polygon_contains_point ( n, v, p );

    inside2 = polygon_contains_point_2 ( n, v, p );

    fprintf ( 1, '  %14.6g%14.6g    %d    %d\n', p(1:2), inside1, inside2 );

  end
 
  return
end

function geometry_test079 ( )

%*****************************************************************************80
%
%% TEST079 tests POLYGON_CONTAINS_POINT_2D, POLYGON_CONTAINS_POINT_2D_2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  clear

  n = 5;
  dim_num = 2;
  ntest = 4;

  ptest = [ ...
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
  fprintf ( 1, 'TEST079\n' );
  fprintf ( 1, '  POLYGON_CONTAINS_POINT_2D determines if \n' );
  fprintf ( 1, '    a point is in a polygon.\n' );
  fprintf ( 1, '  POLYGON_CONTAINS_POINT_2D_2 determines if\n' );
  fprintf ( 1, '    a point is in a polygon.\n' );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '          P          In1  In2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest
 
    p(1:dim_num) = ptest(1:dim_num,i)';
 
    inside1 = polygon_contains_point_2d ( n, v, p );

    inside2 = polygon_contains_point_2d_2 ( n, v, p );

    fprintf ( 1, '  %12f  %12f  %d  %d\n', p(1:dim_num), inside1, inside2 );

  end
 
  return
end

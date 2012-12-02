function geometry_test0765 ( )

%*****************************************************************************80
%
%% TEST0765 tests POLYGON_AREA_2D_2.
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
  dim_num = 2;
  test_num = 2;
  area_exact_test = [ 2.0, 6.0 ];
  n_test = [ 4, 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0765\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_AREA_2D_2 computes the area.\n' );

  for test = 1 : 2

    n = n_test(test);
    area_exact = area_exact_test(test);

    if ( test == 1 )

      v = [ ...
        1.0, 0.0; ...
        2.0, 1.0; ...
        1.0, 2.0; ...
        0.0, 1.0 ]';

    elseif ( test == 2 )

      v = [ ...
        0.0, 0.0; ...
        3.0, 0.0; ...
        3.0, 3.0; ...
        2.0, 3.0; ...
        2.0, 1.0; ...
        1.0, 1.0; ...
        1.0, 2.0; ...
        0.0, 2.0 ]';

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of polygonal vertices = %d\n', n );

    r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

    area = polygon_area_2d_2 ( n, v );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Exact area is        %f\n', area_exact );
    fprintf ( 1, '  The computed area is %f\n', area );
 
  end

  return
end

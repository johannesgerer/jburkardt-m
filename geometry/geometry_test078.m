function geometry_test078 ( )

%*****************************************************************************80
%
%% TEST078 tests POLYGON_AREA_3D.
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
  dim_num = 3;
  test_num = 2;
  n_test = [ 4, 8 ];
  area_exact_test = [ 2.4494898, 6.0 ];

  v = [ ...
    1.0, 0.0, 0.0; ...
    2.0, 1.0, 1.0; ...
    1.0, 2.0, 1.0; ...
    0.0, 1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST078\n' );
  fprintf ( 1, '  For a polygon in 3D:\n' );
  fprintf ( 1, '  POLYGON_AREA_3D computes the area;\n' );

  for test = 1 : test_num

    n = n_test(test);
    area_exact = area_exact_test(test);

    if ( test == 1 )

      v = [ ...
        1.0, 0.0, 0.0; ...
        2.0, 1.0, 1.0; ...
        1.0, 2.0, 1.0; ...
        0.0, 1.0, 0.0 ]';

    elseif ( test == 2 )

      v = [ ...
        0.00000,  0.00000,  0.00000; ...   
        2.62679,  1.26009, -0.715657; ...    
        1.48153,  3.97300, -0.142512; ...    
        0.605932, 3.55297,  0.0960401; ...
        1.36944,  1.74437, -0.286056; ...
        0.493842, 1.32433, -0.0475041; ...
        0.112090, 2.22864,  0.143544; ...
       -0.763505, 1.80861,  0.382097 ]';

    end

    r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' )

    [ area, normal ] = polygon_area_3d ( n, v );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Exact area is        %f\n', area_exact );
    fprintf ( 1, '  The computed area is %f\n', area );

  end
 
  return
end

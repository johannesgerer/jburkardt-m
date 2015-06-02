function polygon_properties_test02 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST02 tests POLYGON_AREA.
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
  test_num = 2;
  area_exact_test = [ 2.0, 6.0 ];
  n_test = [ 4, 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST02\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_AREA computes the area.\n' );

  for test = 1 : test_num

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

    r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

    area = polygon_area ( n, v );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Exact area is        %g\n', area_exact );
    fprintf ( 1, '  The computed area is %g\n', area );
 
  end

  return
end

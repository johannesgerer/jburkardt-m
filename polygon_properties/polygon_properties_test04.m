function polygon_properties_test04 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST04 tests POLYGON_CENTROID and POLYGON_CENTROID_2.
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
  n = 4;
  v = [ ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST04\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_CENTROID computes the centroid.\n' );
  fprintf ( 1, '  POLYGON_CENTROID_2 computes the centroid.\n' );

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  centroid = polygon_centroid ( n, v );

  r8vec_print ( 2, centroid, '  POLYGON_CENTROID:' );

  centroid = polygon_centroid_2 ( n, v );

  r8vec_print ( 2, centroid, '  POLYGON_CENTROID_2:' );

  return
end

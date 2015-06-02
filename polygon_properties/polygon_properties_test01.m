function polygon_properties_test01 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST01 tests POLYGON_ANGLES.
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
  n = 6;
  v = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    3.0, 0.0; ...
    3.0, 2.0; ...
    1.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST01\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_ANGLES computes the angles.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of polygonal vertices = %d\n', n );

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  angle = polygon_angles ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polygonal angles in degrees:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  %14.6g\n', i, r8_degrees ( angle(i) ) );
  end

  return
end

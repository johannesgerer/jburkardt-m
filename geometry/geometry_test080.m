function geometry_test080 ()

%*****************************************************************************80
%
%% TEST080 tests POLYGON_DIAMETER_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  dim_num = 2;

  diameter_exact = 2.0;
  v = [ ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST080\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_DIAMETER_2D computes the diameter;\n' );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

  diameter = polygon_diameter_2d ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Diameter ( computed ) %f\n', diameter );
  fprintf ( 1, '  Diameter ( exact )    %f\n', diameter_exact );
 
  return
end

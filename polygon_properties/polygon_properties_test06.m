function polygon_properties_test06 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST06 tests POLYGON_DIAMETER;
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
  diameter_exact = 2.0;
  v = [ ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST06\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_DIAMETER computes the diameter;\n' );

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  diameter = polygon_diameter ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Diameter ( computed ) %g\n', diameter );
  fprintf ( 1, '  Diameter ( exact )    %g\n', diameter_exact );
 
  return
end

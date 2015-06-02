function polygon_properties_test11 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST11 tests POLYGON_LATTICE_AREA.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST11\n' );
  fprintf ( 1, '  POLYGON_LATTICE_AREA returns the "area"\n' );
  fprintf ( 1, '  of a polygon, measured in lattice points.\n' );

  i = 5;
  b = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of interior lattice points = %d\n', i );
  fprintf ( 1, '  Number of boundary lattice points = %d\n', b );

  area = polygon_lattice_area ( i, b );

  fprintf ( 1, '  Area of polygon is %g\n', area );

  return
end


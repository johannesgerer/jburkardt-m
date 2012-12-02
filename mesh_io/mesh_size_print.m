function mesh_size_print ( dim, vertices, edges, triangles, quadrilaterals, ...
  tetrahedrons, hexahedrons )

%*****************************************************************************80
%
%% MESH_SIZE_PRINT prints mesh sizes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Pascal Frey,
%    MEDIT: An interactive mesh visualization software,
%    Technical Report RT-0253,
%    Institut National de Recherche en Informatique et en Automatique,
%    03 December 2001.
%
%  Parameters:
%
%    Input, integer DIM, the spatial dimension, which should be 2 or 3.
%
%    Input, integer VERTICES, the number of vertices.
%
%    Input, integer EDGES, the number of edges (may be 0).
%
%    Input, integer TRIANGLES, the number of triangles (may be 0).
%
%    Input, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Input, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Input, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of dimensions = %d\n', dim );
  fprintf ( 1, '  Number of vertices = %d\n', vertices );
  fprintf ( 1, '  Number of edges = %d\n', edges );
  fprintf ( 1, '  Number of triangles = %d\n', triangles );
  fprintf ( 1, '  Number of quadrilaterals = %d\n', quadrilaterals );
  fprintf ( 1, '  Number of tetrahedrons = %d\n', tetrahedrons );
  fprintf ( 1, '  Number of hexahedrons = %d\n', hexahedrons );

  return
end

function [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
  edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
  quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
  tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
  hexahedron_label ] = ice_read ( filename )

%*****************************************************************************80
%
%% ICE_READ reads an ICE grid dataset from a NETCDF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
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
%    Input, string FILENAME, the name of the file to be read.
%    Ordinarily, the name should include the extension ".nc".
%
%    Output, integer DIM, the spatial dimension, which should be 3.
%
%    Output, integer VERTICES, the number of vertices.
%
%    Output, real VERTEX_COORDINATE(3,VERTICES), the XYZ coordinates
%    of each vertex.
%
%    Output, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Output, integer EDGES, the number of edges (may be 0).
%
%    Output, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Output, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Output, integer TRIANGLES, the number of triangles (may be 0).
%
%    Output, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Output, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Output, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Output, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Output, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for 
%    each quadrilateral.
%
%    Output, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Output, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Output, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Output, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
%    Output, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Output, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%

%
%  Initialize everything to nothing.
%
  dim = 0;
  vertices = 0;
  vertex_coordinate = [];
  vertex_label = [];
  edges = 0;
  edge_vertex = [];
  edge_label = [];
  triangles = 0;
  triangle_vertex = [];
  triangle_label = [];
  quadrilaterals = 0;
  quadrilateral_vertex = [];
  quadrilateral_label = [];
  tetrahedrons = 0;
  tetrahedron_vertex = [];
  tetrahedron_label = [];
  hexahedrons = 0;
  hexahedron_vertex = [];
  hexahedron_label = [];
%
%  Open the file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Return information about the NETCDF file.
%
  [ ndims, nvars, ngatts, unlimdimid ] = netcdf.inq ( ncid );
%
%  Get the dimension information.
%
%  Because NETCDF won't let me define a dimension with extent 0,
%  and because MATLAB won't return an error if I inquire about a
%  dimension that doesn't exist, I have to read every dimension
%  and match it against what I am looking for.
%
%  Then, because MATLAB can't compare strings of different length,
%  I have to take care of that too.
%
%  Also, it was a BIG MISTAKE to call a variable "Dimension"!
%
  for dims = 0 : ndims - 1

    [ name, len ] = netcdf.inqdim ( ncid, dims );

    if ( s_eqi ( name, 'Dimension' ) )
      dim = len;
    elseif ( s_eqi ( name, 'Vertices' ) )
      vertices = len;
    elseif ( s_eqi ( name, 'Edges' ) )
      edges = len;
    elseif ( s_eqi ( name, 'Triangles' ) )
      triangles = len;
    elseif ( s_eqi ( name, 'Quadrilaterals' ) )
      quadrilaterals = len;
    elseif ( s_eqi ( name, 'Tetrahedrons' ) || ...
             s_eqi ( name, 'Tetrahedra' ) )
      tetrahedrons = len;
    elseif ( s_eqi ( name, 'Hexahedrons' ) || ...
             s_eqi ( name, 'Hexahedra' ) )
      hexahedrons = len;
    end

  end
%
%  Read the data.
%
  var_vertex_coordinate = netcdf.inqVarID ( ncid, 'Vertex_Coordinate' );
  vertex_coordinate = netcdf.getVar ( ncid, var_vertex_coordinate );

  var_vertex_label = netcdf.inqVarID ( ncid, 'Vertex_Label' );
  vertex_label = netcdf.getVar ( ncid, var_vertex_label );

  if ( 0 < edges )
    var_edge_vertex = netcdf.inqVarID ( ncid, 'Edge_Vertex' );
    edge_vertex = netcdf.getVar ( ncid, var_edge_vertex );
    var_edge_label = netcdf.inqVarID ( ncid, 'Edge_Label' );
    edge_label = netcdf.getVar ( ncid, var_edge_label );
  end

  if ( 0 < triangles )
    var_triangle_vertex = netcdf.inqVarID ( ncid, 'Triangle_Vertex' );
    triangle_vertex = netcdf.getVar ( ncid, var_triangle_vertex );
    var_triangle_label = netcdf.inqVarID ( ncid, 'Triangle_Label' );
    triangle_label = netcdf.getVar ( ncid, var_triangle_label );
  end

  if ( 0 < quadrilaterals )
    var_quadrilateral_vertex = netcdf.inqVarID ( ncid, 'Quadrilateral_Vertex' );
    quadrilateral_vertex = netcdf.getVar ( ncid, var_quadrilateral_vertex );
    var_quadrilateral_label = netcdf.inqVarID ( ncid, 'Quadrilateral_Label' );
    quadrilateral_label = netcdf.getVar ( ncid, var_quadrilateral_label );
  end

  if ( 0 < tetrahedrons )
    var_tetrahedron_vertex = netcdf.inqVarID ( ncid, 'Tetrahedron_Vertex' );
    tetrahedron_vertex = netcdf.getVar ( ncid, var_tetrahedron_vertex );
    var_tetrahedron_label = netcdf.inqVarID ( ncid, 'Tetrahedron_Label' );
    tetrahedron_label = netcdf.getVar ( ncid, var_tetrahedron_label );
  end

  if ( 0 < hexahedrons )
    var_hexahedron_vertex = netcdf.inqVarID ( ncid, 'Hexahedron_Vertex' );
    hexahedron_vertex = netcdf.getVar ( ncid, var_hexahedron_vertex );
    var_hexahedron_label = netcdf.inqVarID ( ncid, 'Hexahedron_Label' );
    hexahedron_label = netcdf.getVar ( ncid, var_hexahedron_label );
  end
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end

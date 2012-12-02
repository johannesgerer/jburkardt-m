function ice_write ( filename, dim, vertices, vertex_coordinate, ...
  vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
  triangle_label, quadrilaterals, quadrilateral_vertex, ...
  quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
  hexahedrons, hexahedron_vertex, hexahedron_label )

%*****************************************************************************80
%
%% ICE_WRITE writes 3D ICE mesh data to a NETCDF file.
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
%    Input, string FILENAME, the name of the file to be created.
%    Ordinarily, the name should include the extension ".nc".
%
%    Input, integer DIM, the spatial dimension, which should be 3.
%
%    Input, integer VERTICES, the number of vertices.
%
%    Input, real VERTEX_COORDINATE(3,VERTICES), the XYZ coordinates
%    of each vertex.
%
%    Input, integer VERTEX_LABEL(VERTICES), a label for each vertex.
%
%    Input, integer EDGES, the number of edges (may be 0).
%
%    Input, integer EDGE_VERTEX(2,EDGES), the vertices that form each edge.
%
%    Input, integer EDGE_LABEL(EDGES), a label for each edge.
%
%    Input, integer TRIANGLES, the number of triangles (may be 0).
%
%    Input, integer TRIANGLE_VERTEX(3,TRIANGLES), the vertices that form
%    each triangle.
%
%    Input, integer TRIANGLE_LABEL(TRIANGLES), a label for each triangle.
%
%    Input, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Input, integer QUADRILATERAL_VERTEX(4,QUADRILATERALS), the vertices that
%    form each quadrilateral.
%
%    Input, integer QUADRILATERAL_LABEL(QUADRILATERALS), a label for 
%    each quadrilateral.
%
%    Input, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Input, integer TETRAHEDRON_VERTEX(4,TETRAHEDRONS), the vertices that
%    form each tetrahedron.
%
%    Input, integer TETRAHEDRON_LABEL(TETRAHEDRONS), a label for
%    each tetrahedron.
%
%    Input, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%
%    Input, integer HEXAHEDRON_VERTEX(8,HEXAHEDRONS), the vertices that form
%    each hexahedron.
%
%    Input, integer HEXAHEDRON_LABEL(HEXAHEDRONS), a label for each hexahedron.
%

%
%  Retrieve some constants.
%
  nc_clobber = netcdf.getConstant ( 'NC_CLOBBER' );
  nc_double = netcdf.getConstant ( 'NC_DOUBLE' );
  nc_int = netcdf.getConstant ( 'NC_INT' );
%
%  Create the file.  This automatically "opens" it as well.
%
  mode = nc_clobber;
  ncid = netcdf.create ( filename, mode );
%
%  Put NETCDF into define mode.
%
  netcdf.redef ( ncid );
%
%  Dimension information.
%
%  If a dimension has length 0, it seems to be taken to be the unlimited
%  dimension (not what you want) and then if you have two such dimensions,
%  you get a ninny complaint that you've tried to define the unlimited dimension
%  twice.  The fix requires the programmer not to write anything whose
%  dimension is zero.
%
  name = 'Dimension';
  leng = dim;
  dim_dimension = netcdf.defDim ( ncid, name, leng );

  name = 'Vertices';
  leng = vertices;
  dim_vertices = netcdf.defDim ( ncid, name, leng );

  if ( 0 < edges )
    name = 'Edges';
    leng = edges;
    dim_edges = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < triangles )
    name = 'Triangles';
    leng = triangles;
    dim_triangles = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < quadrilaterals )
    name = 'Quadrilaterals';
    leng = quadrilaterals;
    dim_quadrilaterals = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < tetrahedrons )
    name = 'Tetrahedrons';
    leng = tetrahedrons;
    dim_tetrahedrons = netcdf.defDim ( ncid, name, leng );
  end

  if ( 0 < hexahedrons )
    name = 'Hexahedrons';
    leng = hexahedrons;
    dim_hexahedrons = netcdf.defDim ( ncid, name, leng );
  end

  name = 'Two';
  leng = 2;
  dim_two = netcdf.defDim ( ncid, name, leng );

  name = 'Three';
  leng = 3;
  dim_three = netcdf.defDim ( ncid, name, leng );

  name = 'Four';
  leng = 4;
  dim_four = netcdf.defDim ( ncid, name, leng );

  name = 'Eight';
  leng = 8;
  dim_eight = netcdf.defDim ( ncid, name, leng );
%
%  Define variables.
%
  name = 'Vertex_Coordinate';
  xtype = nc_double;
  dimids = [ dim_three, dim_vertices ];
  var_vertex_coordinate = netcdf.defVar ( ncid, name, xtype, dimids );

  name = 'Vertex_Label';
  xtype = nc_int;
  dimids = [ dim_vertices ];
  var_vertex_label = netcdf.defVar ( ncid, name, xtype, dimids );

  if ( 0 < edges )

    name = 'Edge_Vertex';
    xtype = nc_int;
    dimids = [ dim_two, dim_edges ];
    var_edge_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Edge_Label';
    xtype = nc_int;
    dimids = [ dim_edges ];
    var_edge_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < triangles )

    name = 'Triangle_Vertex';
    xtype = nc_int;
    dimids = [ dim_three, dim_triangles ];
    var_triangle_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Triangle_Label';
    xtype = nc_int;
    dimids = [ dim_triangles ];
    var_triangle_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < quadrilaterals )

    name = 'Quadrilateral_Vertex';
    xtype = nc_int;
    dimids = [ dim_four, dim_quadrilaterals ];
    var_quadrilateral_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Quadrilateral_Label';
    xtype = nc_int;
    dimids = [ dim_quadrilaterals ];
    var_quadrilateral_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < tetrahedrons )

    name = 'Tetrahedron_Vertex';
    xtype = nc_int;
    dimids = [ dim_four, dim_tetrahedrons ];
    var_tetrahedron_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Tetrahedron_Label';
    xtype = nc_int;
    dimids = [ dim_tetrahedrons ];
    var_tetrahedron_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end

  if ( 0 < hexahedrons )

    name = 'Hexahedron_Vertex';
    xtype = nc_int;
    dimids = [ dim_eight, dim_hexahedrons ];
    var_hexahedron_vertex = netcdf.defVar ( ncid, name, xtype, dimids );

    name = 'Hexahedron_Label';
    xtype = nc_int;
    dimids = [ dim_hexahedrons ];
    var_hexahedron_label = netcdf.defVar ( ncid, name, xtype, dimids );

  end
%
%  Terminate the definition phase.
%
  netcdf.endDef ( ncid );
%
%  Write the data.
%
  netcdf.putVar ( ncid, var_vertex_coordinate, vertex_coordinate );
  netcdf.putVar ( ncid, var_vertex_label, vertex_label );
  if ( 0 < edges )
    netcdf.putVar ( ncid, var_edge_vertex, edge_vertex );
    netcdf.putVar ( ncid, var_edge_label, edge_label );
  end
  if ( 0 < triangles )
    netcdf.putVar ( ncid, var_triangle_vertex, triangle_vertex );
    netcdf.putVar ( ncid, var_triangle_label, triangle_label );
  end
  if ( 0 < quadrilaterals )
    netcdf.putVar ( ncid, var_quadrilateral_vertex, quadrilateral_vertex );
    netcdf.putVar ( ncid, var_quadrilateral_label, quadrilateral_label );
  end
  if ( 0 < tetrahedrons )
    netcdf.putVar ( ncid, var_tetrahedron_vertex, tetrahedron_vertex );
    netcdf.putVar ( ncid, var_tetrahedron_label, tetrahedron_label );
  end
  if ( 0 < hexahedrons )
    netcdf.putVar ( ncid, var_hexahedron_vertex, hexahedron_vertex );
    netcdf.putVar ( ncid, var_hexahedron_label, hexahedron_label );
  end
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end

function ice_io_test02 ( filename )

%*****************************************************************************80
%
%% ICE_IO_TEST02 reads an ICE grid dataset from a NETCDF file.
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
%    Russ Rew, Glenn Davis, Steve Emmerson, Harvey Davies, Ed Hartne,
%    The NETCDF User's Guide,
%    Unidata Program Center, March 2009.
%
%  Parameters:
%
%    Input, string FILENAME, the name of the file to be read.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ICE_IO_TEST02:\n' );
  fprintf ( 1, '  Read an ICE grid dataset from a NETCDF file,\n');
  fprintf ( 1, '  and print the data.\n' );
%
%  Read the file
%
  [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
    edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
    quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
    tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
    hexahedron_label ] = ice_read ( filename );
%
%  Print the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data from file "%s"\n', filename );

  ice_print ( dim, vertices, vertex_coordinate, ...
    vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
    triangle_label, quadrilaterals, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
    hexahedrons, hexahedron_vertex, hexahedron_label );

  return
end

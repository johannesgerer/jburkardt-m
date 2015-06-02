function medit_io_test03 ( filename )

%*****************************************************************************80
%
%% MEDIT_IO_TEST03 reads and prints the sizes in a MESH dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_IO_TEST03\n' );
  fprintf ( 1, '  Read a mesh file and print its sizes.\n' );

  [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
    hexahedrons ] = mesh_size_read ( filename );
%
%  Print information.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Header information for "%s":\n', filename );

  mesh_size_print ( dim, vertices, edges, triangles, quadrilaterals, ...
    tetrahedrons, hexahedrons );

  return
end

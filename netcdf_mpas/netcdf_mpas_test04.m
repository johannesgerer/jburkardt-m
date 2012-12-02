function netcdf_mpas_test04 ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_TEST04 extracts information about the cellsonvertex.
%
%  Discussion:
%
%    This test does a better job of drawing the triangulation, because
%    it actually has information about the triangles, that is, the
%    3 cells that form the vertices.  This allows us to draw a triangular
%    patch (an area) rather than three lines, as done in the previous test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the file to be examined.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NETCDF_MPAS_TEST04\n' );
  fprintf ( 1, '  Read an MPAS NETCDF grid file, \n' );
  fprintf ( 1, '  get cell locations,\n' );
  fprintf ( 1, '  and cellsonvertex. \n' ); 
  fprintf ( 1, '  Draw the faces of the triangulation.\n' );
%
%  Read "nCells", "xCell", "yCell", "zCell",
%  read "nVertices", "cellsOnVertex", so that we can draw the cells
%  that form each triangle.
%
  [ ncells, xcell, ycell, zcell, nvertices, cellsonvertex ] = ...
    netcdf_mpas_read_cellsonvertex ( filename );
%
%  Print a selection of the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 entries of CELLSONVERTEX:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %2d  %6d  %6d  %6d\n', j, cellsonvertex(1:3,j) );
  end
%
%  Plot the data.
%
  figure ( )

  point_size = 30;
  point_color = 'k';
  scatter3 ( xcell, ycell, zcell, point_size, point_color, 'filled' );

  hold on

  face_color = 'yellow';

  for vertex = 1 : nvertices
    p = cellsonvertex(1:3,vertex);
    patch ( xcell(p), ycell(p), zcell(p), face_color, ...
      'EdgeColor', 'r', 'LineWidth', 1.0 );
  end

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
  axis equal;
  title_string = sprintf ( 'Triangulation faces from %s', filename );
  title ( title_string );
  frame = getframe;
  [ picture, map ] = frame2im ( frame );
  imwrite ( picture, 'triangulation_faces.png', 'PNG' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved image as "%s"\n', 'triangulation_faces.png' );
  hold off

  end

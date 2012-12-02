function netcdf_mpas_test03 ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_TEST03 extracts information about the triangulation.
%
%  Discussion:
%
%    Despite appearances, we are only drawing the lines of the triangulation,
%    not the triangles.  To fake it, we draw a big green ball first, and so
%    the lines appear on the ball, and we see green triangles. 
%    See the next test for the correct way to access the information
%    needed to draw triangles.
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
  fprintf ( 1, 'NETCDF_MPAS_TEST03\n' );
  fprintf ( 1, '  Read an MPAS NETCDF grid file, get cell locations\n' );
  fprintf ( 1, '  and cell neighbors.\n' );
  fprintf ( 1, '  Draw the lines of the triangulation.\n' );
%
%  Read "nCells", "xCell", "yCell", "zCell",
%  read "nEdges", "cellsOnEdge", so that we can draw nodes and the edges
%  that join them in the Delaunay triangulation.
%
  [ ncells, xcell, ycell, zcell, nedges, cellsonedge ] = ...
    netcdf_mpas_read_cellsonedge ( filename );
%
%  Print a selection of the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 entries of CELLSONEDGE:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %2d  %6d  %6d\n', j, cellsonedge(1:2,j) );
  end
%
%  Plot the data.
%
  figure ( )

  shrink = 0.97;

  [ sphere_x, sphere_y, sphere_z ] = sphere ( 20 );
  sphere_x = shrink * sphere_x;
  sphere_y = shrink * sphere_y;
  sphere_z = shrink * sphere_z;
  c = 0.20 * ones ( size ( sphere_z ) );
  surf ( sphere_x, sphere_y, sphere_z, c, 'EdgeColor', 'none' );
  hold on

  point_size = 40;
  point_color = 'r';
  scatter3 ( xcell, ycell, zcell, point_size, point_color, 'filled' );

  for edge = 1 : nedges
    p = cellsonedge(1:2,edge);
    line ( xcell(p), ycell(p), zcell(p) );
  end

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
  axis equal;
  title_string = sprintf ( 'Triangulation edges from %s', filename );
  title ( title_string );
  frame = getframe;
  [ picture, map ] = frame2im ( frame );
  imwrite ( picture, 'triangulation_edges.png', 'PNG' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved image as "%s"\n', 'triangulation_edges.png' );
  hold off

  end

function mpas_cells_display ( filename )

%*****************************************************************************80
%
%% MPAS_CELLS_DISPLAY displays the cells of an MPAS grid.
%
%  Discussion:
%
%    Each cell is bounded by edges between vertices.
%
%    Thus, the data we need to read from the MPAS NETCDF grid file
%    is (xVertex,yVertex,zVertex), the coordinates of the vertices,
%    and verticesOnCells, the indices of the vertices that bound
%    a cell.
%
%    Since the order (number of vertices) of each cell varies,
%    we also need nEdgesOnCell for each cell.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the MPAS NETCDF grid filename.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MPAS_CELLS_DISPLAY:\n' );
  fprintf ( 1, '  Read MPAS polygonal mesh data from a NETCDF file.\n' );
  fprintf ( 1, '  Use the PATCH command to display the grid.\n' );
%
%  Check the input argument.
%
  if ( nargin < 1 )
    filename = input ( '  Enter filename: ' );
  end
%
%  Open the MPAS NETCDF grid file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Get the cell coordinates and the cell-vertex connectivity array.
%
  xv = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'xVertex' ) );
  yv = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'yVertex' ) );
  zv = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'zVertex' ) );
  neoc = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'nEdgesOnCell' ) );
  voc = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'verticesOnCell' ) );
%
%  Report some important measures.
%
  vertex_num = length ( xv );
  [ dim, cell_num ] = size ( voc );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of vertices is %d\n', vertex_num );
  fprintf ( 1, '  Minimum cell order is %d\n', min ( neoc ) );
  fprintf ( 1, '  Maximum cell order is %d\n', max ( neoc ) );
  fprintf ( 1, '  Number of cells is %d\n', cell_num );
%
%  Draw the mesh.
%
%  1) PATCH requires X, Y and Z to be in a single array.
%  2) PATCH requires that all the polygons being drawn on a given call
%     have the same order, and it will not accept entries in the Faces
%     array that are less than 1 or greater than the number of vertices.
%  3) PATCH will graciously corrupt and terminate the MATLAB session if the Faces
%     array is empty, so we cannot call PATCH for a given order unless
%     there are actually 1 or more polygons of that order.
%  4) Immediately after drawing a batch of polygons of a given order,
%     we can color them in with a color peculiar to that order.
%     We expect only to encounter polygons of order 3 to 10.
%  5) We need to issue the CLF command, since otherwise the graphic
%     output from previous calls to PATCH may persevere on the screen,
%     an issue which made the creation of this function extra painful,
%     since repeated experiments and modifications did not make certain
%     anomalies go away (they did, actually, but the anomalies remained
%     on the screen because of no CLF!)
%
  xyz = zeros ( vertex_num, 3 );
  xyz(:,1) = xv;
  xyz(:,2) = yv;
  xyz(:,3) = zv;

  clf

  for v = 3 : 10

    r = ( ( 10 - v     ) * 0.3 ...
        + (      v - 3 ) * 0.8 ) / 7;
    g = ( ( 10 - v     ) * 0.4 ...
        + (      v - 3 ) * 0.9 ) / 7;
    b = ( ( 10 - v     ) * 1.0 ...
        + (      v - 3 ) * 0.5 ) / 7;

    I = find ( neoc == v );

    if ( 0 < length ( I ) )
      handle = patch ( 'Vertices', xyz, 'Faces', voc(1:v,I)' );
      set ( handle, 'FaceColor', [r, g, b], 'EdgeColor', 'Black' );
    end

  end

  xlabel ( '--- X Axis ---' )
  ylabel ( '--- Y Axis ---' )
  zlabel ( '--- Z Axis ---' )
  axis equal
  grid on
  title_string = sprintf ( 'MPAS mesh from %s', filename );
  title ( title_string );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MPAS_CELLS_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( ) ;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

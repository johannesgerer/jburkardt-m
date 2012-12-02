function mpas_triangulation_display ( filename )

%*****************************************************************************80
%
%% MPAS_TRIANGULATION_DISPLAY displays an MPAS triangulation.
%
%  Discussion:
%
%    The triangulation is the dual of the cell mesh.
%
%    As such, each edge of the triangulation joins two
%    adjacent cells.  Each triangle formed by such edges
%    contains a vertex of the original cell mesh.
%
%    Thus, the data we need to read from the MPAS NETCDF grid file
%    is (xCell,yCell,zCell), the coordinates of the cell centers,
%    and cellsOnVertex, the indices of the three cells that share
%    a given vertex.
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
  fprintf ( 1, 'MPAS_TRIANGULATION_DISPLAY:\n' );
  fprintf ( 1, '  Read MPAS triangulation data from a NETCDF file.\n' );
  fprintf ( 1, '  Use the TRIMESH command to display the triangulation.\n' );
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
  xc = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'xCell' ) );
  yc = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'yCell' ) );
  zc = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'zCell' ) );
  cov = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'cellsOnVertex' ) );
%
%  Report some important measures.
%
  cell_num = length ( xc );
  [ dim, vertex_num ] = size ( cov );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of edges (cells) is %d\n', cell_num );
  fprintf ( 1, '  Number of triangles (vertices) is %d\n', vertex_num );
%
%  Draw the triangulation.
%
  trimesh ( cov', xc, yc, zc, 'EdgeColor', 'b' );

  xlabel ( '--- X Axis ---' )
  ylabel ( '--- Y Axis ---' )
  zlabel ( '--- Z Axis ---' )
  axis equal
  grid on
  title_string = sprintf ( 'MPAS triangulation from %s', filename );
  title ( title_string );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MPAS_TRIANGULATION_DISPLAY:\n' );
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

function netcdf_mpas_test02 ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_TEST02 tests NETCDF_MPAS_READ_XYZCELL.
%
%  Discussion:
%
%    Read an MPAS NETCDF grid file which we know contains a dimension
%    "nCells" and variables "xCell", "yCell", "zCell", (but we don't know the
%    NETCDF internal indexes for the items).  Retrieve the data, and
%    make a plot.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2010
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
  fprintf ( 1, 'NETCDF_MPAS_TEST02\n' );
  fprintf ( 1, '  NETCDF_MPAS_READ_CELLS reads a NETCDF MPAS grid file,\n ' );
  fprintf ( 1, '  extracts the number of cells and the coordinates\n' );
  fprintf ( 1, '  of their centers.\n' );

  [ ncells, xcell, ycell, zcell ] = netcdf_mpas_read_xyzcell ( filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 cell centers:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %2d  %10f  %10f  %10f\n', i, xcell(i), ycell(i), zcell(i) );
  end
%
%  Display a plot of the data.
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
  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
  axis equal;
  title_string = sprintf ( 'Cell locations from %s', filename );
  title ( title_string );
  frame = getframe;
  [ picture, map ] = frame2im ( frame );
  imwrite ( picture, 'cells.png', 'PNG' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved image as "%s"\n', 'cells.png' );
  hold off

  return
end

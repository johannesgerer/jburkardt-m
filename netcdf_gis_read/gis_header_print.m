function gis_header_print ( ndims, nvars, ngatts, unlimdimid, level_dim, ...
  time_dim, x0_dim, x1_dim, y0_dim, y1_dim, filename );

%*****************************************************************************80
%
%% GIS_HEADER_PRINT prints header data from the GIS dataset.
%
%  Discussion:
%
%    The arrays THK, USURF, UVELHOM, VELNORMHOM and VVELHOM, which are
%    multiply-dimensioned, are, for no doubt excellent reasons, returned by
%    the MATLAB read routines with the index ordering reversed.  Thus, an
%    array which is supposed to be dimensioned THK(TIME,Y1,X1) will be
%    returned as THK(X1,Y1,TIME).  Please make a note of it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philippe Huybrechts, Tony Payne,
%    The EISMINT benchmarks for testing ice-sheet models,
%    Annals of Glaciology,
%    Volume 23, 1996, pages 1-14.
%
%    Russ Rew, Glenn Davis, Steve Emmerson, Harvey Davies, Ed Hartne,
%    The NetCDF User's Guide,
%    Unidata Program Center, March 2009.
%
%  Parameters:
%
%    Input, integer NDIMS, the number of dimensions declared in the file.
%
%    Input, integer NVARS, the number of variables declared in the file.
%
%    Input, integer NGATTS, the number of global attributes declared in the file.
%
%    Input, integer UNLIMDIMID, the unlimited dimension.
%
%    Input, integer LEVEL_DIM, the extent of the level dimension.
%
%    Input, integer TIME_DIM, the extent of the time dimension.
%
%    Input, integer X0_DIM, the extent of the x0 dimension.
%
%    Input, integer X1_DIM, the extent of the x1 dimension.
%
%    Input, integer Y0_DIM, the extent of the y0 dimension.
%
%    Input, integer Y1_DIM, the extent of the y1 dimension.
%
%    Input, string FILENAME, the name of the file from which the data was read.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GIS_HEADER_PRINT:\n' );
  fprintf ( 1, '  Header data as read from "%s".\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ndims, number of dimensions, = %d\n', ndims );
  fprintf ( 1, '  nvars, number of variables, = %d\n', nvars );
  fprintf ( 1, '  ngatts, number of global attributes, = %d\n', ngatts );
  fprintf ( 1, '  unlimdimid, the unlimited dimension, = %d\n', unlimdimid );
%
%  Dimensions.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Dimensions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  level_dim = %d\n', level_dim );
  fprintf ( 1, '  time_dim = %d\n', time_dim );
  fprintf ( 1, '  x0_dim = %d\n', x0_dim );
  fprintf ( 1, '  x1_dim = %d\n', x1_dim );
  fprintf ( 1, '  y0_dim = %d\n', y0_dim );
  fprintf ( 1, '  y1_dim = %d\n', y1_dim );
%
%  Variable sizes:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Variable extents:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  level(%d)\n', level_dim );
  fprintf ( 1, '  time(%d)\n', time_dim );
  fprintf ( 1, '  x0(%d)\n', x0_dim );
  fprintf ( 1, '  x1(%d)\n', x1_dim );
  fprintf ( 1, '  y0(%d)\n', y0_dim );
  fprintf ( 1, '  y1(%d)\n', y1_dim );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  acab(%d,%d,%d)\n', x1_dim, y1_dim, time_dim );
  fprintf ( 1, '  artm(%d,%d,%d)\n', x1_dim, y1_dim, time_dim );
  fprintf ( 1, '  beta(%d,%d,%d)\n', x0_dim, y0_dim, time_dim );
  fprintf ( 1, '  bheatflx(%d,%d,%d)\n', x1_dim, y1_dim, time_dim );
  fprintf ( 1, '  temp(%d,%d,%d,%d)\n', x1_dim, y1_dim, level_dim, time_dim );
  fprintf ( 1, '  thk(%d,%d,%d)\n', x1_dim, y1_dim, time_dim );
  fprintf ( 1, '  topg(%d,%d,%d)\n', x1_dim, y1_dim, time_dim );

  return
end

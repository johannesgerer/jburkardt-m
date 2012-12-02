function hump_test ( filename )

%*****************************************************************************80
%
%% HUMP_TEST reads a GLIMMER NETCDF data file and prints it out.
%
%  Discussion:
%
%    Although the file contains global attribute information, we
%    do not try to retrieve that.
%
%    Be aware (as I was not) that MATLAB automatically reverses the
%    order of all indices in multiply dimensioned arrays read from
%    a NETCDF file.  Thus, an array which is supposed to be
%    dimensioned THK(TIME,Y1,X1) will be returned instead as
%    THK(X1,Y1,TIME).
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
%    Input, string FILENAME, the name of the GLIMMER NETCDF file to read.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HUMP_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Read "%s" and print its contents.\n', filename );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    filename = input ( 'Enter the name of the GLIMMER NETCDF file to read.\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading file "%s".\n', filename );

  [ ndims, nvars, ngatts, unlimdimid, time_dim, level_dim, ...
    levels_dim, lithoz_dim, tillnodes_dim, x0_dim, x1_dim, y0_dim, y1_dim, ...
    time, level, levels, lithoz, tillnodes, x0, x1, y0, y1, thk, ...
    usurf, uvelhom, velnormhom, vvelhom ] ...
    = hump_read ( filename );

  hump_print ( ndims, nvars, ngatts, unlimdimid, time_dim, ...
    level_dim, levels_dim, lithoz_dim, tillnodes_dim, x0_dim, x1_dim, ...
    y0_dim, y1_dim, time, level, levels, lithoz, tillnodes, x0, x1, y0, y1, ...
    thk, usurf, uvelhom, velnormhom, vvelhom );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HUMP_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n', filename );

  fprintf ( 1, '\n' );
  timestamp ( );

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

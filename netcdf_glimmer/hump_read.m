function [ ndims, nvars, ngatts, unlimdimid, time_dim, level_dim, ...
  levels_dim, lithoz_dim, tillnodes_dim, x0_dim, x1_dim, y0_dim, y1_dim, ...
  time, level, levels, lithoz, tillnodes, x0, x1, y0, y1, thk, ...
  usurf, uvelhom, velnormhom, vvelhom ] ...
  = hump_read ( filename )

%*****************************************************************************80
%
%% HUMP_READ reads the NETCDF file containing the hump data.
%
%  Discussion:
%
%    Although the file contains global attribute information, this function
%    does not try to retrieve that.
%
%    For what I suppose are perfectly good reasons, MATLAB returns
%    multiply-dimensioned arrays with the dimensioning in the reverse
%    order of what the internal NETCDF documentation would suggest.
%    Thus, an array which is supposed to be dimensioned THK(TIME,Y1,X1)
%    will be returned as THK(X1,Y1,TIME).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2010
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
%    Input, string FILENAME, the name of the file to be read.
%    Ordinarily, the name should include the extension ".nc".
%
%    Output, integer NDIMS, the number of dimensions declared in the file.
%
%    Output, integer NVARS, the number of variables declared in the file.
%
%    Output, integer NGATTS, the number of global attributes declared in the file.
%
%    Output, integer UNLIMDIMID, the unlimited dimension.
%
%    Output, integer TIME_DIM, the extent of the time dimension.
%
%    Output, integer LEVEL_DIM, the extent of the level dimension.
%
%    Output, integer LEVELS_DIM, the extent of the levels dimension.
%
%    Output, integer LITHOZ_DIM, the extent of the lithoz dimension.
%
%    Output, integer TILLNODES_DIM, the extent of the tillnodes dimension.
%
%    Output, integer X0_DIM, the extent of the x0 dimension.
%
%    Output, integer X1_DIM, the extent of the x1 dimension.
%
%    Output, integer Y0_DIM, the extent of the y0 dimension.
%
%    Output, integer Y1_DIM, the extent of the y1 dimension.
%
%    Output, real TIME(TIME_DIM), the time values.
%
%    Output, real LEVEL(LEVEL_DIM), the sigma layers.
%
%    Output, real LEVELS(LEVELS_DIM), the stag sigma layers.
%
%    Output, real LITHOZ(LITHOZ_DIM), the vertical coordinate of the
%    lithosphere layer.
%
%    Output, integer TILLNODES(TILLNODES_DIM), the number of till layers.
%
%    Output, real X0(X0_DIM), the X grid, offset for velocity.
%
%    Output, real X1(X1_DIM), the X grid.
%
%    Output, real Y0(Y0_DIM), the Y grid, offset for velocity.
%
%    Output, real Y1(Y1_DIM), the Y grid.
%
%    Output, real THK(X1_DIM,Y1_DIM,TIME_DIM), the ice thickness.
%
%    Output, real USURF(X1_DIM,Y1_DIM,TIME_DIM), the ice upper surface elevation.
%
%    Output, real UVELHOM(X0_DIM,Y0_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity in the X direction as computed by the higher order method.
%
%    Output real VELNORMHOM(X1_DIM,Y1_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity magnitude as computed by the higher order method.
%
%    Output, real VVELHOM(X0_DIM,Y0_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity in the Y direction as computed by the higher order method.
%

%
%  Open the file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Read the NETCDF counts.
%
  [ ndims, nvars, ngatts, unlimdimid ] = netcdf.inq ( ncid );
%
%  Read the dimension extents, by specifying the names.
%
  for dims = 0 : ndims - 1

    [ name, len ] = netcdf.inqdim ( ncid, dims );

    if ( s_eqi ( name, 'time' ) )
      time_dim = len;
    elseif ( s_eqi ( name, 'level' ) )
      level_dim = len;
    elseif ( s_eqi ( name, 'levels' ) )
      levels_dim = len;
    elseif ( s_eqi ( name, 'lithoz' ) )
      lithoz_dim = len;
    elseif ( s_eqi ( name, 'tillnodes' ) )
      tillnodes_dim = len;
    elseif ( s_eqi ( name, 'x0' ) )
      x0_dim = len;
    elseif ( s_eqi ( name, 'x1' ) )
      x1_dim = len;
    elseif ( s_eqi ( name, 'y0' ) )
      y0_dim = len;
    elseif ( s_eqi ( name, 'y1' ) )
      y1_dim = len;
    end

  end
%
%  Read the data by getting, and then specifying the variable index.
%
  time_var = netcdf.inqVarID ( ncid, 'time' );
  time = netcdf.getVar ( ncid, time_var );

  level_var = netcdf.inqVarID ( ncid, 'level' );
  level = netcdf.getVar ( ncid, level_var );

  levels_var = netcdf.inqVarID ( ncid, 'levels' );
  levels = netcdf.getVar ( ncid, levels_var );

  lithoz_var = netcdf.inqVarID ( ncid, 'lithoz' );
  lithoz = netcdf.getVar ( ncid, lithoz_var );

  tillnodes_var = netcdf.inqVarID ( ncid, 'tillnodes' );
  tillnodes = netcdf.getVar ( ncid, tillnodes_var );

  x0_var = netcdf.inqVarID ( ncid, 'x0' );
  x0 = netcdf.getVar ( ncid, x0_var );

  x1_var = netcdf.inqVarID ( ncid, 'x1' );
  x1 = netcdf.getVar ( ncid, x1_var );

  y0_var = netcdf.inqVarID ( ncid, 'y0' );
  y0 = netcdf.getVar ( ncid, y0_var );

  y1_var = netcdf.inqVarID ( ncid, 'y1' );
  y1 = netcdf.getVar ( ncid, y1_var );

  thk_var = netcdf.inqVarID ( ncid, 'thk' );
  thk = netcdf.getVar ( ncid, thk_var );

  usurf_var = netcdf.inqVarID ( ncid, 'usurf' );
  usurf = netcdf.getVar ( ncid, usurf_var );

  uvelhom_var = netcdf.inqVarID ( ncid, 'uvelhom' );
  uvelhom = netcdf.getVar ( ncid, uvelhom_var );

  velnormhom_var = netcdf.inqVarID ( ncid, 'velnormhom' );
  velnormhom = netcdf.getVar ( ncid, velnormhom_var );

  vvelhom_var = netcdf.inqVarID ( ncid, 'vvelhom' );
  vvelhom = netcdf.getVar ( ncid, vvelhom_var );
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = 0;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = 0;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c && c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end


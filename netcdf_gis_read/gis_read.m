function [ ndims, nvars, ngatts, unlimdimid, level_dim, time_dim, ...
  x0_dim, x1_dim, y0_dim, y1_dim, acab, artm, beta, bheatflx, temp, ...
  thk, time, topg, x0, x1, y0, y1 ] = gis_read ( filename )

%*****************************************************************************80
%
%% GIS_READ reads the NETCDF file containing the GIS data.
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
%    Output, integer LEVEL_DIM, the extent of the level dimension.
%
%    Output, integer TIME_DIM, the extent of the time dimension.
%
%    Output, integer X0_DIM, the extent of the x0 dimension.
%
%    Output, integer X1_DIM, the extent of the x1 dimension.
%
%    Output, integer Y0_DIM, the extent of the y0 dimension.
%
%    Output, integer Y1_DIM, the extent of the y1 dimension.
%
%    Output, real ACAB(X1_DIM,Y1_DIM,TIME_DIM), "ACcumulation/ABlation":
%    surface mass balance in meters/year, the amount of ice added or removed
%    from the surface annually as a result of climate.
%
%    Output, real ARTM(X1_DIM,Y1_DIM,TIME_DIM), "air temperature": the
%    mean-annual air temperature at the upper ice surface in degrees C.
%    This is the "skin" temperature that gets applied for the upper
%    surface boundary condition in the heat balance calculation.
%
%    Output, real BETA(X0_DIM,Y0_DIM,TIME_DIM), short for "betasquared": the
%    basal sliding coefficient in Pascal*year/meter, used with the sliding law
%    of the form Tau_B = beta * u_sliding, where Tau_B is the basal traction
%    in Pascals.  Here, this is set to some large number to enforce approximate
%    zero slip at the bed everywhere.
%
%    Output, real BHEATFLX(X1_DIM,Y1_DIM,TIME_DIM), the basal heat flux in
%    Watt/meter^2.  This should be negative, so that the heat flux to the ice
%    sheet base is positive if the temperature gradient in the ice is negative,
%    that is, with Z positive upwards, the temperature in the ice generally
%    gets colder moving upwards from the bed.  It is used for specifying the
%    basal temperature gradient (basal boundary conditions for the heat
%    balance calculation), through k * dT/dz = bheatflx or, equivalently,
%    dT/dz = 1/k * bheatflx.
%
%    Output, real TEMP(X1_DIM,Y1_DIM,LEVEL_DIM,TIME_DIM), the 3D temperature
%    field in the ice.  A crude initial guess may be given, with the
%    internal profile estimated from the surface temperature to the bed
%    based on the temperature gradient implied by the geothermal flux.
%
%    Output, real THK(X1_DIM,Y1_DIM,TIME_DIM), the ice thickness.
%
%    Output, real TIME(TIME_DIM), the time values.
%
%    Output, real TOPG(X1_DIM,Y1_DIM,TIME_DIM), the basal topography. For
%    grounded ice, this is the same as the lower surface of the ice sheet,
%    which will be the case for most of Greenland.  If the ice is floating,
%    the two are NOT necessarily the same, that is, TOPG is the bedrock,
%    which for floating ice, is below the lower surface of the ice.
%
%    Output, real X0(X0_DIM), the X grid, offset for velocity.
%
%    Output, real X1(X1_DIM), the X grid.
%
%    Output, real Y0(Y0_DIM), the Y grid, offset for velocity.
%
%    Output, real Y1(Y1_DIM), the Y grid.
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

    if ( s_eqi ( name, 'level' ) )
      level_dim = len;
    elseif ( s_eqi ( name, 'time' ) )
      time_dim = len;
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
  acab_var = netcdf.inqVarID ( ncid, 'acab' );
  acab = netcdf.getVar ( ncid, acab_var );

  artm_var = netcdf.inqVarID ( ncid, 'artm' );
  artm = netcdf.getVar ( ncid, artm_var );

  beta_var = netcdf.inqVarID ( ncid, 'beta' );
  beta = netcdf.getVar ( ncid, beta_var );

  bheatflx_var = netcdf.inqVarID ( ncid, 'bheatflx' );
  bheatflx = netcdf.getVar ( ncid, bheatflx_var );

  temp_var = netcdf.inqVarID ( ncid, 'temp' );
  temp = netcdf.getVar ( ncid, temp_var );

  thk_var = netcdf.inqVarID ( ncid, 'thk' );
  thk = netcdf.getVar ( ncid, thk_var );

  time_var = netcdf.inqVarID ( ncid, 'time' );
  time = netcdf.getVar ( ncid, time_var );

  topg_var = netcdf.inqVarID ( ncid, 'topg' );
  topg = netcdf.getVar ( ncid, topg_var );

  x0_var = netcdf.inqVarID ( ncid, 'x0' );
  x0 = netcdf.getVar ( ncid, x0_var );

  x1_var = netcdf.inqVarID ( ncid, 'x1' );
  x1 = netcdf.getVar ( ncid, x1_var );

  y0_var = netcdf.inqVarID ( ncid, 'y0' );
  y0 = netcdf.getVar ( ncid, y0_var );

  y1_var = netcdf.inqVarID ( ncid, 'y1' );
  y1 = netcdf.getVar ( ncid, y1_var );
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

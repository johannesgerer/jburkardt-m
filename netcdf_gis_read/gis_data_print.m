function gis_print ( ndims, nvars, ngatts, unlimdimid, level_dim, time_dim, ...
    x0_dim, x1_dim, y0_dim, y1_dim, acab, artm, beta, bheatflx, temp, ...
    thk, time, topg, x0, x1, y0, y1, filename );

%*****************************************************************************80
%
%% GIS_PRINT prints data from the GIS dataset.
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
%    Input, real ACAB(X1_DIM,Y1_DIM,TIME_DIM), "ACcumulation/ABlation":
%    surface mass balance in meters/year, the amount of ice added or removed
%    from the surface annually as a result of climate.
%
%    Input, real ARTM(X1_DIM,Y1_DIM,TIME_DIM), "air temperature": the
%    mean-annual air temperature at the upper ice surface in degrees C.
%    This is the "skin" temperature that gets applied for the upper
%    surface boundary condition in the heat balance calculation.
%
%    Input, real BETA(X0_DIM,Y0_DIM,TIME_DIM), short for "betasquared": the
%    basal sliding coefficient in Pascal*year/meter, used with the sliding law
%    of the form Tau_B = beta * u_sliding, where Tau_B is the basal traction
%    in Pascals.  Here, this is set to some large number to enforce approximate
%    zero slip at the bed everywhere.
%
%    Input, real BHEATFLX(X1_DIM,Y1_DIM,TIME_DIM), the basal heat flux in
%    Watt/meter^2.  This should be negative, so that the heat flux to the ice
%    sheet base is positive if the temperature gradient in the ice is negative,
%    that is, with Z positive upwards, the temperature in the ice generally
%    gets colder moving upwards from the bed.  It is used for specifying the
%    basal temperature gradient (basal boundary conditions for the heat
%    balance calculation), through k * dT/dz = bheatflx or, equivalently,
%    dT/dz = 1/k * bheatflx.
%
%    Input, real TEMP(X1_DIM,Y1_DIM,LEVEL_DIM,TIME_DIM), the 3D temperature
%    field in the ice.  A crude initial guess may be given, with the
%    internal profile estimated from the surface temperature to the bed
%    based on the temperature gradient implied by the geothermal flux.
%
%    Input, real THK(X1_DIM,Y1_DIM,TIME_DIM), the ice thickness.
%
%    Input, real TIME(TIME_DIM), the time values.
%
%    Input, real TOPG(X1_DIM,Y1_DIM,TIME_DIM), the basal topography. For
%    grounded ice, this is the same as the lower surface of the ice sheet,
%    which will be the case for most of Greenland.  If the ice is floating,
%    the two are NOT necessarily the same, that is, TOPG is the bedrock,
%    which for floating ice, is below the lower surface of the ice.
%
%    Input, real X0(X0_DIM), the X grid, offset for velocity.
%
%    Input, real X1(X1_DIM), the X grid.
%
%    Input, real Y0(Y0_DIM), the Y grid, offset for velocity.
%
%    Input, real Y1(Y1_DIM), the Y grid.
%
%    Input, string FILENAME, the name of the file from which the data was read.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GIS_DATA_PRINT:\n' );
  fprintf ( 1, '  Data values as read from "%s".\n', filename );
%
%  Variable values.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Variables:\n' );
%
%  "Independent" variables.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  level:\n' );
  for i = 1 : level_dim
    fprintf ( 1, '  %d  %f\n', i, level(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  time:\n' );
  for i = 1 : time_dim
    fprintf ( 1, '  %d  %f\n', i, time(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  x0:\n' );
  for i = 1 : x0_dim
    fprintf ( 1, '  %d  %f\n', i, x0(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  x1:\n' );
  for i = 1 : x1_dim
    fprintf ( 1, '  %d  %f\n', i, x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  y0:\n' );
  for i = 1 : y0_dim
    fprintf ( 1, '  %d  %f\n', i, y0(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  y1:\n' );
  for i = 1 : y1_dim
    fprintf ( 1, '  %d  %f\n', i, y1(i) );
  end
%
%  "Dependent" variables.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  acab:\n' );
  size ( acab )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, acab(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  artm:\n' );
  size ( artm )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, artm(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  beta:\n' );
  size ( beta )
  for k = 1 : time_dim
    for j = 1 : y0_dim
      for i = 1 : x0_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, beta(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  bheatflx:\n' );
  size ( bheatflx )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, bheatflx(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  temp:\n' );
  size ( temp )
  for k = 1 : time_dim
    for l = 1 : level_dim
      for j = 1 : y1_dim
        for i = 1 : x1_dim
          fprintf ( 1, '  %d  %d  %d  %d  %f\n', i, j, l, k, temp(i,j,l,k) );
        end
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  thk:\n' );
  size ( thk )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, acab(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  topg:\n' );
  size ( topg )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, topg(i,j,k) );
      end
    end
  end

  return
end

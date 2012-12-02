function hump_print ( ndims, nvars, ngatts, unlimdimid, time_dim, ...
  level_dim, levels_dim, lithoz_dim, tillnodes_dim, x0_dim, x1_dim, ...
  y0_dim, y1_dim, time, level, levels, lithoz, tillnodes, x0, x1, y0, y1, ...
  thk, usurf, uvelhom, velnormhom, vvelhom )

%*****************************************************************************80
%
%% HUMP_PRINT prints data from the hump dataset.
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
%    Input, integer NDIMS, the number of dimensions declared in the file.
%
%    Input, integer NVARS, the number of variables declared in the file.
%
%    Input, integer NGATTS, the number of global attributes declared in the file.
%
%    Input, integer UNLIMDIMID, the unlimited dimension.
%
%    Input, integer TIME_DIM, the extent of the time dimension.
%
%    Input, integer LEVEL_DIM, the extent of the level dimension.
%
%    Input, integer LEVELS_DIM, the extent of the levels dimension.
%
%    Input, integer LITHOZ_DIM, the extent of the lithoz dimension.
%
%    Input, integer TILLNODES_DIM, the extent of the tillnodes dimension.
%
%    Input, integer X0_DIM, the extent of the x0 dimension.
%
%    Input, integer X1_DIM, the extent of the x1 dimension.
%
%    Input, integer Y0_DIM, the extent of the y0 dimension.
%
%    Input, integer Y1_DIM, the extent of the y1 dimension.
%
%    Input, real TIME(TIME_DIM), the time values.
%
%    Input, real LEVEL(LEVEL_DIM), the sigma layers.
%
%    Input, real LEVELS(LEVELS_DIM), the stag sigma layers.
%
%    Input, real LITHOZ(LITHOZ_DIM), the vertical coordinate of the
%    lithosphere layer.
%
%    Input, integer TILLNODES(TILLNODES_DIM), the number of till layers.
%
%    Input, real X0(X0_DIM), the X grid, offset for velocity.
%
%    Input, real X1(X1_DIM), the X grid.
%
%    Input, real Y0(Y0_DIM), the Y grid, offset for velocity.
%
%    Input, real Y1(Y1_DIM), the Y grid.
%
%    Input real THK(X1DIM,Y1_DIM,TIME_DIM), the ice thickness.
%
%    Input, real USURF(X1_DIM,Y1_DIM,TIME_DIM), the ice upper surface elevation.
%
%    Input, real UVELHOM(X0_DIM,Y0_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity in the X direction as computed by the higher order method.
%
%    Input real VELNORMHOM(X1_DIM,Y1_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity magnitude as computed by the higher order method.
%
%    Input, real VVELHOM(X0_DIM,Y0_DIM,LEVEL_DIM,TIME_DIM), the
%    ice velocity in the Y direction as computed by the higher order method.
%
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
  fprintf ( 1, '  time_dim = %d\n', time_dim );
  fprintf ( 1, '  level_dim = %d\n', level_dim );
  fprintf ( 1, '  levels_dim = %d\n', levels_dim );
  fprintf ( 1, '  lithoz_dim = %d\n', lithoz_dim );
  fprintf ( 1, '  till_nodes_dim = %d\n', tillnodes_dim );
  fprintf ( 1, '  x0_dim = %d\n', x0_dim );
  fprintf ( 1, '  x1_dim = %d\n', x1_dim );
  fprintf ( 1, '  y0_dim = %d\n', y0_dim );
  fprintf ( 1, '  y1_dim = %d\n', y1_dim );
%
%  Variables.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Variables:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  time:\n' );
  for i = 1 : time_dim
    fprintf ( 1, '  %d  %f\n', i, time(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  level:\n' );
  for i = 1 : level_dim
    fprintf ( 1, '  %d  %f\n', i, level(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  levels:\n' );
  for i = 1 : levels_dim
    fprintf ( 1, '  %d  %f\n', i, levels(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  lithoz:\n' );
  for i = 1 : lithoz_dim
    fprintf ( 1, '  %d  %f\n', i, lithoz(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  tillnodes:\n' );
  for i = 1 : tillnodes_dim
    fprintf ( 1, '  %d  %f\n', i, tillnodes(i) );
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
%  For confirmation, we print out MATLAB's notion of the size of each
%  array, verifying that MATLAB has reversed the index order of the arrays
%  when it read them from the NETCDF file.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  thk:\n' );
  size ( thk )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, thk(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  usurf:\n' );
  size ( usurf )
  for k = 1 : time_dim
    for j = 1 : y1_dim
      for i = 1 : x1_dim
        fprintf ( 1, '  %d  %d  %d  %f\n', i, j, k, usurf(i,j,k) );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  uvelhom:\n' );
  size ( uvelhom )
  for l = 1 : time_dim
    for k = 1 : level_dim
      for j = 1 : y0_dim
        for i = 1 : x0_dim
          fprintf ( 1, '  %d  %d  %d  %d  %f\n', i, j, k, l, uvelhom(i,j,k,l) );
        end
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  velnormhom:\n' );
  size ( velnormhom )
  for l = 1 : time_dim
    for k = 1 : level_dim
      for j = 1 : y1_dim
        for i = 1 : x1_dim
          fprintf ( 1, '  %d  %d  %d  %d  %f\n', i, j, k, l, velnormhom(i,j,k,l) );
        end
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  vvelhom:\n' );
  size ( vvelhom )
  for l = 1 : time_dim
    for k = 1 : level_dim
      for j = 1 : y0_dim
        for i = 1 : x0_dim
          fprintf ( 1, '  %d  %d  %d  %d  %f\n', i, j, k, l, vvelhom(i,j,k,l) );
        end
      end
    end
  end

  return
end

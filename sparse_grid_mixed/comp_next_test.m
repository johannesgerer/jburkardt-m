function comp_next_test ( dim_num, level_max )

%****************************************************************************80
%
%% COMP_NEXT_TEST tests COMP_NEXT, which computes 1D level vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum level.
%
  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_NEXT_TEST\n' );
  fprintf ( 1, '  COMP_NEXT generates, one at a time, vectors\n' );
  fprintf ( 1, '  LEVEL_1D(1:DIM_NUM) whose components add up to LEVEL.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We call with:\n' );
  fprintf ( 1, '  DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  %d = LEVEL_MIN <= LEVEL <= LEVEL_MAX = %d\n', ...
    level_min, level_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     LEVEL     INDEX  LEVEL_1D Vector\n' );
%
%  The outer loop generates values of LEVEL from LEVEL_MIN to LEVEL_MAX.
%
  for level = level_min : level_max

    fprintf ( 1, '\n' );
%
%  The inner loop generates vectors LEVEL_1D(1:DIM_NUM) whose components
%  add up to LEVEL.
%
    level_1d = [];
    more_grids = 0;
    h = 0;
    t = 0;
    i = 0;

    while ( 1 )

      [ level_1d, more_grids, h, t ] = comp_next ( level, dim_num, level_1d, ...
        more_grids, h, t );

      i = i + 1;
      fprintf ( 1, '  %8d  %8d', level, i );
      for dim = 1 : dim_num
        fprintf ( 1, '  %8d', level_1d(dim) );
      end
      fprintf ( 1, '\n' );

      if ( ~more_grids )
        break
      end

    end

  end

  return
end

function param_print ( dim_num, n, cvt_it, latin_it, seed, seed_start, ...
  sample_function_cvt, sample_function_init, sample_num_cvt )

%*****************************************************************************80
%
%% PARAM_PRINT prints the program parameters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of Voronoi cells.
%
%    Input, integer CVT_IT, the number of CVT iterations.
%
%    Input, integer LATIN_IT, the number of Latin iterations.
%
%    Input, integer SEED, the current random number seed.
%
%    Input, integer SEED_START, the initial random number seed.
%
%    Input, integer SAMPLE_FUNCTION_CVT, specifies how the region is sampled:
%    -1, the sampling function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the sampling function is UNIFORM,
%    1, the sampling function is HALTON,
%    2, the sampling function is GRID.
%
%    Input, integer SAMPLE_FUNCTION_INIT, specifies how the initial
%    generators are chosen:
%    0, the initialization function is UNIFORM,
%    1, the initialization function is HALTON,
%    2, the initialization function is GRID,
%    3, the initial values are read in from a file.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sample points for the
%    CVT iteration.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Geometry parameters:\n' );
  fprintf ( 1, '-------------------\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension is DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data lies in the unit hypercube [0,1]^DIM_NUM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Latin hypercube parameters:\n' );
  fprintf ( 1, '-------------------------\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of Latin iterations: %d\n', latin_it );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT Algorithm parameters:\n' );
  fprintf ( 1, '-------------------------\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of Voronoi cells to generate: %d\n', n );

  fprintf ( 1, '  Number of CVT iterations: %d\n', cvt_it );
  fprintf ( 1, '  Number of sampling points for CVT iteration: %d\n', ...
    sample_num_cvt );

  if ( sample_function_init == -1 )
    fprintf ( 1, ...
      '  The generators are initialized by RAND (MATLAB intrinsic).\n' );
  elseif ( sample_function_init == 0 )
    fprintf ( 1, '  The generators are initialized by UNIFORM.\n' );
  elseif ( sample_function_init == 1 )
    fprintf ( 1, '  The generators are initialized by HALTON.\n' );
  elseif ( sample_function_init == 2 )
    fprintf ( 1, '  The generators are initialized by GRID.\n' );
  elseif ( sample_function_init == 3 )
    fprintf ( 1, '  The generators are initialized from a file.\n' );
  end

  if ( sample_function_cvt == -1 )
    fprintf ( 1, '  The region is sampled by RAND (MATLAB intrinsic).\n' );
  elseif ( sample_function_cvt == 0 )
    fprintf ( 1, '  The region is sampled by UNIFORM.\n' );
  elseif ( sample_function_cvt == 1 )
    fprintf ( 1, '  The region is sampled by HALTON.\n' );
  elseif ( sample_function_cvt == 2 )
    fprintf ( 1, '  The region is sampled by GRID.\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Miscellaneous parameters:\n' );
  fprintf ( 1, '------------------------\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial random number seed was %d\n', seed_start );
  fprintf ( 1, '  The current random number seed is  %d\n', seed );

  fprintf ( 1, '\n' );

  return
end

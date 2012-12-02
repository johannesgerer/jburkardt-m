function lcvt_write ( dim_num, n, seed_start, sample_function_init, ...
  file_in_name, sample_function_cvt, sample_num_cvt, cvt_it, ...
  cvt_energy, latin_it, latin_energy, cell_generator, file_out_name )

%*****************************************************************************80
%
%% LCVT_WRITE writes a Latinized CVT dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the M-dimensional
%    components of a Latinized CVT generator.
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
%    Input, integer N, the number of points.
%
%    Input, integer SEED_START, the initial random number seed.
%
%    Input, integer SAMPLE_FUNCTION_INIT, specifies how the initial
%    generators are chosen:
%    -1, the initialization function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the initialization function is UNIFORM,
%    1, the initialization function is HALTON,
%    2, the initialization function is GRID,
%    3, the initial values are read in from a file.
%
%    Input, string FILE_IN_NAME, the name of the file
%    from which initialization values were read for the generators,
%    if SAMPLE_FUNCTION_INIT = 3.
%
%    Input, integer SAMPLE_FUNCTION_CVT, specifies how the region is sampled:
%    -1, the sampling function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the sampling function is UNIFORM,
%    1, the sampling function is HALTON,
%    2, the sampling function is GRID.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sampling points used on
%    each CVT iteration.
%
%    Input, integer CVT_IT, the number of CVT iterations.
%
%    Input, real CVT_ENERGY, the energy of the final CVT dataset.
%
%    Input, integer LATIN_IT, the number of Latin iterations.
%
%    Input, real LATIN_ENERGY, the energy of the Latinized
%    CVT dataset.
%
%    Input, real CELL_GENERATOR(DIM_NUM,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of
%    the output file.
%
  comment = 1;

  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'LCVT_WRITE - Fatal error!' );
  end

  if ( comment )

    fprintf ( file_out_unit, '#  %s\n', file_out_name );
    fprintf ( file_out_unit, '#  created by LCVT_WRITE.M\n' );
    fprintf ( file_out_unit, '#\n' );
    fprintf ( file_out_unit, ...
      '#  Spatial dimension DIM_NUM =   %12d\n', dim_num  );
    fprintf ( file_out_unit, '#  Number of points N =       %12d\n', n );
    fprintf ( file_out_unit, '#  EPSILON (unit roundoff ) = %e\n', eps );

    if ( sample_function_init == 0 | ...
         sample_function_init == 1 | ...
         sample_function_cvt == 0 | ...
         sample_function_cvt == 1 )
      fprintf ( file_out_unit, '#\n' );
      fprintf ( file_out_unit, '#  Initial SEED = %d\n', seed_start );
    end

    fprintf ( file_out_unit, '#\n' );
    if ( sample_function_init == -1 )
      fprintf ( file_out_unit, ...
        '#  Initialization by RAND (MATLAB intrinsic).\n' );
    elseif ( sample_function_init == 0 )
      fprintf ( file_out_unit, '#  Initialization by UNIFORM.\n' );
    elseif ( sample_function_init == 1 )
      fprintf ( file_out_unit, '#  Initialization by HALTON.\n' );
    elseif ( sample_function_init == 2 )
      fprintf ( file_out_unit, '#  Initialization by GRID.\n' );
    elseif ( sample_function_init == 3 )
      fprintf ( file_out_unit, '#  Initialization from file: "%s"\n', ...
        file_in_name );
    end

    if ( sample_function_cvt == -1 )
      fprintf ( file_out_unit,'#  Sampling by RAND (MATLAB intrinsic).\n' );
    elseif ( sample_function_cvt == 0 )
      fprintf ( file_out_unit, '#  Sampling by UNIFORM.\n' );
    elseif ( sample_function_cvt == 1 )
      fprintf ( file_out_unit, '#  Sampling by HALTON.\n' );
    elseif ( sample_function_cvt == 2 )
      fprintf ( file_out_unit, '#  Sampling by GRID.\n' );
    end

    fprintf ( file_out_unit, '#  Number of sample points = %d\n', ...
      sample_num_cvt );
    fprintf ( file_out_unit, '#  Number of CVT iterations = %d\n', ...
      cvt_it );
    fprintf ( file_out_unit, '#  Energy of CVT dataset = %f\n', ...
      cvt_energy );
    fprintf ( file_out_unit, '#  Number of Latin iterations = %d\n', ...
      latin_it );
    fprintf ( file_out_unit, '#  Energy of Latinized CVT dataset = %f\n', ...
      latin_energy );
    fprintf ( file_out_unit, '#\n' );

  end 

  for j = 1 : n
    for i = 1 : dim_num
      fprintf ( file_out_unit, '  %10f', cell_generator(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end

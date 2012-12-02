function cvt_write ( ndim, n, batch, seed_init, seed, init_string, it_max, ...
  it_fixed, it_num, energy, sample_string, sample_num, r, ...
  file_out_name )

%*****************************************************************************80
%
%% CVT_WRITE writes a CVT dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the NDIM-dimensional
%    components of the next entry in the set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDIM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer BATCH, sets the maximum number of sample points
%    generated at one time.  It is inefficient to generate the sample
%    points 1 at a time, but memory intensive to generate them all
%    at once.  You might set BATCH to min ( SAMPLE_NUM, 10000 ), for instance.
%
%    Input, integer SEED_INIT, the initial random number seed.
%
%    Input, integer SEED, the current random number seed.
%
%    Input, character INIT_STRING(*), specifies how the initial
%    generators are chosen:
%    filename, by reading data from a file;
%    'GRID', picking points from a grid;
%    'HALTON', from a Halton sequence;
%    'RAND', using MATLAB RAND function;
%    'UNIFORM', using a simple uniform RNG;
%
%    Input, integer IT_MAX, the maximum number of iterations allowed.
%
%    Input, integer IT_FIXED, the maximum number of iterations to take
%    with a fixed set of sample points.
%
%    Input, integer IT_NUM, the actual number of iterations taken.
%
%    Input, real ENERGY, the discrete "energy", divided
%    by the number of sample points.
%
%    Input, string SAMPLE_STRING, specifies how the region is sampled:
%    'GRID', picking points from a grid;
%    'HALTON', from a Halton sequence;
%    'RAND', using MATLAB RAND function;
%    'UNIFORM', using a simple uniform RNG;
%
%    Input, integer SAMPLE_NUM, the number of sampling points used on
%    each iteration.
%
%    Input, real R(NDIM,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of the output file.
%
  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'CVT_WRITE - Fatal error!' );
  end

  fprintf ( file_out_unit, '#  %s\n', file_out_name );
  fprintf ( file_out_unit, '#  created by CVT_WRITE.M\n' );
  fprintf ( file_out_unit, '#\n' );
  fprintf ( file_out_unit, '#  Spatial dimension NDIM =   %12d\n', ndim );
  fprintf ( file_out_unit, '#  Number of points N =       %12d\n', n );
  fprintf ( file_out_unit, '#  Initial SEED_INIT =        %12d\n', seed_init );
  fprintf ( file_out_unit, '#  Current SEED =             %12d\n', seed );
  fprintf ( file_out_unit, '#  INIT =                    "%s"\n', init_string );
  fprintf ( file_out_unit, '#  Max iterations IT_MAX =    %12d\n', it_max );
  fprintf ( file_out_unit, '#  IT_FIXED (fixed samples) = %12d\n', it_fixed );
  fprintf ( file_out_unit, '#  Iterations IT_NUM =        %12d\n', it_num );
  fprintf ( file_out_unit, '#  CVT ENERGY =               %12f\n', energy );
  fprintf ( file_out_unit, '#  SAMPLE =                  "%s"\n', sample_string );
  fprintf ( file_out_unit, '#  SAMPLE_NUM =               %12d\n', sample_num );
  fprintf ( file_out_unit, '#  Sample BATCH size =        %12d\n', batch );
  fprintf ( file_out_unit, '#  EPSILON (unit roundoff ) = %e\n', eps );
  fprintf ( file_out_unit, '#\n' );

  for j = 1 : n
    for i = 1 : ndim
      fprintf ( file_out_unit, '  %10f', r(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end

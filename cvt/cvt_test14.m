function cvt_test14 ( )

%*****************************************************************************80
%
%% CVT_TEST14 generates a 10 point CVT on [0,1].
%
%  Discussion:
%
%    Generate 10 CVT points on the interval [0,1].
%    We expect them to be at 1/20, 3/20, 5/20, ..., 19/20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  Generate a CVT in the interval [0,1] using 10 points.\n' );
  fprintf ( 1, '  Exact answer: { 0.05, 0.15, 0.25, ..., 0.85, 0.95 }\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It turns out that, for a fixed number of points N,\n' );
  fprintf ( 1, '  a 1D problem will converge much more slowly than for\n' );
  fprintf ( 1, '  cases where the dimension is higher.\n' );

  dim_num = 1;
  n = 10;
  batch = 10000;
  init = 1;
  init_string = 'uniform';
  it_max = 50;
  it_fixed = 1;
  sample = 1;
  sample_num = 100000;
  sample_string = 'uniform';
  seed = 123456789;
  r = [];

  seed_init = seed;

  [ r, seed, it_num, it_diff, energy ] = cvt ( dim_num, n, batch, init, ...
    sample, sample_num, it_max, it_fixed, seed, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension DIM_NUM =        %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =       %12d\n', n );
  fprintf ( 1, '  Initial SEED =             %12d\n', seed_init );
  fprintf ( 1, '  Current SEED =             %12d\n', seed );
  fprintf ( 1, '  INIT =                    "%s".\n', init_string );
  fprintf ( 1, '  Max iterations IT_MAX =    %12d\n', it_max );
  fprintf ( 1, '  IT_FIXED (fixed samples) = %12d\n', it_fixed );
  fprintf ( 1, '  Iterations IT_NUM =        %12d\n', it_num );
  fprintf ( 1, '  Difference IT_DIFF =       %14f\n', it_diff );
  fprintf ( 1, '  CVT ENERGY =               %14f\n', energy );
  fprintf ( 1, '  SAMPLE =                  "%s".\n', sample_string );
  fprintf ( 1, '  Samples SAMPLE_NUM    =    %12d\n', sample_num );
  fprintf ( 1, '  Sampling BATCH size =      %12d\n', batch );
  fprintf ( 1, '  EPSILON (unit roundoff) =  %12e\n', eps );
  
  r = sort ( r );

  r8mat_transpose_print ( dim_num, n, r, '  Generators (rows):' );

  return
end

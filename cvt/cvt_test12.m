function cvt_test12 ( )

%*****************************************************************************80
%
%% CVT_TEST12 tests CVT with 'RANDOM' initialization.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  The "random" initialization option calls the\n' );
  fprintf ( 1, '  system random number generator.  There is some\n' );
  fprintf ( 1, '  question about whether this works correctly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The test is as follows:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CVT call #1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM      =      2\n' );
  fprintf ( 1, '    N         =     10\n' );
  fprintf ( 1, '    INIT      =     -1\n' );
  fprintf ( 1, '    IT_MAX    =      0\n' );
  fprintf ( 1, '    SEED      = 100000\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Print output values of SEED and R #1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CVT call #2: (jump SEED)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM      =      2\n' );
  fprintf ( 1, '    N         =     10\n' );
  fprintf ( 1, '    INIT      =     -1\n' );
  fprintf ( 1, '    IT_MAX    =      0\n' );
  fprintf ( 1, '    SEED      = 200000\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Print output values of SEED and R #2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CVT call #3: (restore SEED)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM      =      2\n' );
  fprintf ( 1, '    N         =     10\n' );
  fprintf ( 1, '    INIT      =     -1\n' );
  fprintf ( 1, '    IT_MAX    =      0\n' );
  fprintf ( 1, '    SEED      = 100000\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Print output values of SEED and R #3.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We expect:\n' );
  fprintf ( 1, '  * the values R #1 and R #2 will differ;\n' );
  fprintf ( 1, '  AND\n' );
  fprintf ( 1, '  * the values R #1 and R #3 will agree.\n' );
%
%  Run #1.
%
  batch = 1000;
  init = -1;
  init_string = 'random';
  it_max = 0;
  it_fixed = 1;
  sample = 0;
  sample_num = 10000;
  sample_string = 'uniform';
  seed = 100000;
  r = [];

  seed_init = seed;
  
  [ r, seed, it_num, it_diff, energy ] = cvt ( dim_num, n, batch, init, ...
    sample, sample_num, it_max, it_fixed, seed, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension DIM_NUM =       %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =      %d\n', n );
  fprintf ( 1, '  Initial SEED =            %d\n', seed_init );
  fprintf ( 1, '  Current SEED =            %d\n', seed );
  fprintf ( 1, '  INIT =                    "%s".\n', init_string );
  fprintf ( 1, '  Max iterations IT_MAX =   %d\n', it_max );
  fprintf ( 1, '  IT_FIXED (fixed samples)  %d\n', it_fixed );
  fprintf ( 1, '  Iterations IT_NUM =       %d\n', it_num );
  fprintf ( 1, '  Difference IT_DIFF =      %f\n', it_diff );
  fprintf ( 1, '  CVT ENERGY =              %f\n', energy );
  fprintf ( 1, '  SAMPLE =                  "%s".\n', sample_string );
  fprintf ( 1, '  Samples SAMPLE_NUM    =   %d\n', sample_num );
  fprintf ( 1, '  Sampling BATCH size =     %d\n', batch );
  fprintf ( 1, '  EPSILON (unit roundoff) = %f\n', eps );

  r8mat_transpose_print ( dim_num, n, r, '  R #1:' );
%
%  Run #2.
%
  batch = 1000;
  init = -1;
  init_string = 'random';
  it_max = 0;
  it_fixed = 1;
  sample = 0;
  sample_num = 10000;
  sample_string = 'uniform';
  seed = 200000;
  r = [];

  seed_init = seed;

  [ r, seed, it_num, it_diff, energy ] = cvt ( dim_num, n, batch, init, ...
    sample, sample_num, it_max, it_fixed, seed, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension DIM_NUM =       %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =      %d\n', n );
  fprintf ( 1, '  Initial SEED =            %d\n', seed_init );
  fprintf ( 1, '  Current SEED =            %d\n', seed );
  fprintf ( 1, '  INIT =                    "%s".\n', init_string );
  fprintf ( 1, '  Max iterations IT_MAX =   %d\n', it_max );
  fprintf ( 1, '  IT_FIXED (fixed samples)  %d\n', it_fixed );
  fprintf ( 1, '  Iterations IT_NUM =       %d\n', it_num );
  fprintf ( 1, '  Difference IT_DIFF =      %f\n', it_diff );
  fprintf ( 1, '  CVT ENERGY =              %f\n', energy );
  fprintf ( 1, '  SAMPLE =                  "%s".\n', sample_string );
  fprintf ( 1, '  Samples SAMPLE_NUM    =   %d\n', sample_num );
  fprintf ( 1, '  Sampling BATCH size =     %d\n', batch );
  fprintf ( 1, '  EPSILON (unit roundoff) = %f\n', eps );

  r8mat_transpose_print ( dim_num, n, r, '  R #2:' );
%
%  Run #3.
%
  batch = 1000;
  init = -1;
  init_string = 'random';
  it_max = 0;
  it_fixed = 1;
  sample = 0;
  sample_num = 10000;
  sample_string = 'uniform';
  seed = 100000;
  r = [];

  seed_init = seed;

  [ r, seed, it_num, it_diff, energy ] = cvt ( dim_num, n, batch, init, ...
    sample, sample_num, it_max, it_fixed, seed, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension DIM_NUM =       %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =      %d\n', n );
  fprintf ( 1, '  Initial SEED =            %d\n', seed_init );
  fprintf ( 1, '  Current SEED =            %d\n', seed );
  fprintf ( 1, '  INIT =                    "%s".\n', init_string );
  fprintf ( 1, '  Max iterations IT_MAX =   %d\n', it_max );
  fprintf ( 1, '  IT_FIXED (fixed samples)  %d\n', it_fixed );
  fprintf ( 1, '  Iterations IT_NUM =       %d\n', it_num );
  fprintf ( 1, '  Difference IT_DIFF =      %f\n', it_diff );
  fprintf ( 1, '  CVT ENERGY =              %f\n', energy );
  fprintf ( 1, '  SAMPLE =                  "%s".\n', sample_string );
  fprintf ( 1, '  Samples SAMPLE_NUM    =   %d\n', sample_num );
  fprintf ( 1, '  Sampling BATCH size =     %d\n', batch );
  fprintf ( 1, '  EPSILON (unit roundoff) = %f\n', eps );

  r8mat_transpose_print ( dim_num, n, r, '  R #3:' );

  return
end

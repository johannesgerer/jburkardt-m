function cvt_test11 ( )

%*****************************************************************************80
%
%% CVT_TEST11 tests CVT.
%
%  Discussion:
%
%    In this test, we initialize the generators to grid points; this is 
%    an unstable CVT solution.  The data would "prefer" to be in a
%    different form.  However, even if we take 2000 steps of CVT iteration,
%    the data is still only slowly progressing towards that other 
%    configuration.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  CVT computes a Centroidal Voronoi Tessellation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we initialize the generators to\n' );
  fprintf ( 1, '  grid points; this is an unstable CVT solution.\n' );

  dim_num = 2;
  n = 16;
  batch = 1000;
  init = 4;
  init_string = 'user initialization';
  it_max = 40;
  it_fixed = 1;
  sample = 0;
  sample_num = 1000;
  sample_string = 'uniform';
  seed = 123456789;

  seed_init = seed;
%
%  Initialize the tuple generator.
%
  rank = -1;
  ngrid = 4;
  tuple(1:dim_num) = tuple_next_fast ( ngrid, dim_num, rank );
%
%  Pick points on a grid.
%
  for rank = 0 : n-1
    tuple(1:dim_num) = tuple_next_fast ( ngrid, dim_num, rank );
    r(1:dim_num,rank+1) = ( 2 * tuple(1:dim_num)' - 1 ) / ( 2 * ngrid ); 
  end

  r8mat_transpose_print ( dim_num, n, r, '  Initial generators (rows):' );

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
  
  r8mat_transpose_print ( dim_num, n, r, '  Generators (rows):' );

  return
end

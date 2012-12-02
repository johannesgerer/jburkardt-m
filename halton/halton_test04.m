function halton_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests HALTON, HALTON_BASE_GET, HALTON_BASE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  HALTON_BASE_GET gets the current Halton base.\n' );
  fprintf ( 1, '  HALTON_BASE_SET sets the current Halton base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we compute a Halton sequence\n' );
  fprintf ( 1, '  with the default base, then change the base,\n' );
  fprintf ( 1, '  reset the seed, and recompute the sequence.\n' );

  halton_dim_num_set ( dim_num );
  n = 10;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );
  base = halton_base_get ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N    = %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    r = halton ( );
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1) );
  end

  n = 10;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );
  base(1) = 3;
  halton_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    = %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    r = halton ( );
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1) );
  end

  base(1) = 4;
  n = 10;
  halton_base_set ( base );
  step = 0;
  halton_step_set ( step );
  for i = 1 : dim_num
    base(i) = 4;
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    = %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    r = halton ( );
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1) );
  end

  return
end

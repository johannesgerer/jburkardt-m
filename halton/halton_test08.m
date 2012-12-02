function halton_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests HALTON_BASE_GET, HALTON_BASE_SET, HALTON_SEQUENCE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  HALTON_BASE_GET gets the current bases.\n' );
  fprintf ( 1, '  HALTON_BASE_SET sets the current bases.\n' );
  fprintf ( 1, '  HALTON_SEQUENCE computes the next N elements\n' );
  fprintf ( 1, '  of a vector Halton sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we compute the first 10 elements of the\n' );
  fprintf ( 1, '  default sequence, then change bases, reset the seed\n' );
  fprintf ( 1, '  and recompute the first 10 elements.\n' );

  dim_num = 4;
  halton_dim_num_set ( dim_num );
  n = 10;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );
  for i = 1 : dim_num
    base(i) = prime ( i );
  end
  halton_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  step = 0;
  halton_step_set ( step );
  for i = 1 : dim_num
    base(i) = prime ( 2 * i );
  end
  halton_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

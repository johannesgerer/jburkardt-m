function halton_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests HALTON_SEQUENCE.
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
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  HALTON_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Halton sequence on a single call.\n' );

  dim_num = 2;
  halton_dim_num_set ( dim_num );
  n = 101;
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
  fprintf ( 1, '  N    = %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %8f  %8f\n', step+j-1, r(1:2,j) );
  end

  return
end

function halton_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests HALTON_SEQUENCE, HALTON_STEP_SET.
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
  nmax = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  HALTON_STEP_SET specifies the next element of\n' );
  fprintf ( 1, '    the Halton subsequence to compute.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we demonstrate how resetting STEP\n' );
  fprintf ( 1, '  determines the next element computed.\n' );

  dim_num = 1;
  halton_dim_num_set ( dim_num );
  n = 11;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );
  base(1:dim_num) = 2;
  halton_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP  Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1,j) );
  end

  n = 11;
  step = 6;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP  Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1,j) );
  end

  n = 6;
  step = 0;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP  Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1,j) );
  end

  n = 5;
  step = 100;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP  Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %12f\n', step+j-1, r(1,j) );
  end

  return
end

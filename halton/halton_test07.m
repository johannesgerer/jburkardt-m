function halton_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests HALTON_STEP_GET, HALTON_SEQUENCE.
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
  nmax = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  HALTON_STEP_SET specifies which element of the\n' );
  fprintf ( 1, '    Halton subsequence to compute.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we show how STEP chooses the next element.\n' );

  dim_num = 4;
  halton_dim_num_set ( dim_num );
  n = 10;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j ) );
    end
    fprintf ( 1, '\n' );
  end

  n = 10;
  step = 6;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j ) );
    end
    fprintf ( 1, '\n' );
  end

  n = 6;
  step = 0;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j ) );
    end
    fprintf ( 1, '\n' );
  end

  n = 5;
  step = 100;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  r = halton_sequence ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

function halton_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests HALTON_SEQUENCE.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  HALTON_SEQUENCE computes N elements of \n' );
  fprintf ( 1, '  a Halton sequence on a single call.\n' );
  
  dim_num = 3;
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
    fprintf ( 1, '  %6d ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%8f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

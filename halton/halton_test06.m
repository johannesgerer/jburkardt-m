function halton_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests HALTON_SEQUENCE.
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
  n = 11;
  dim_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  HALTON_SEQUENCE computes the next N elements\n' ); 
  fprintf ( 1, '  of a vector Halton sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each call produces the next value.  By default,\n' );
  fprintf ( 1, '  the bases are the first DIM_NUM primes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we demonstrate how one call can compute\n' );
  fprintf ( 1, '  many successive vector elements of the sequence.\n' );

  halton_dim_num_set ( dim_num );
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
      fprintf ( 1, '%12f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

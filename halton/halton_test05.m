function halton_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests HALTON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  HALTON computes the elements of a vector\n' );
  fprintf ( 1, '  Halton sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each call produces the next value.  By default,\n' );
  fprintf ( 1, '  the bases are the first DIM_NUM primes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call HALTON several times,\n' );
  fprintf ( 1, '  with the default bases.\n' );

  halton_dim_num_set ( dim_num );
  n = 11;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );
  for i = 1 : dim_num
    base(i) = prime ( i );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    r = halton ( );
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

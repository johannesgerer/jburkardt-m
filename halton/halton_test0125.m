function halton_test0125 ( )

%*****************************************************************************80
%
%% TEST0125 tests I4_TO_HALTON.
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
  dim_max = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0125\n' );
  fprintf ( 1, '  I4_TO_HALTON computes a Halton sequence.\n' );
  fprintf ( 1, '  The user specifies all data explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call I4_TO_HALTON repeatedly.\n' );
  fprintf ( 1, '  We use distinct primes as bases.\n' );

  for dim_num = 1 : dim_max

    n = 11;
    step = 0;
    seed(1:dim_num) = 0;
    leap(1:dim_num) = 1;
    for j = 1 : dim_num
      base(j) = prime(j);
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
    fprintf ( 1, '  N =    %12d\n', n );
    fprintf ( 1, '  STEP = %12d\n', step );
    i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
    i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
    i4vec_transpose_print ( dim_num, base, '  BASE = ' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  STEP      Halton\n' );
    fprintf ( 1, '\n' );
    for j = 1 : n
      step = j - 1;
      r = i4_to_halton ( dim_num, step, seed, leap, base );
      fprintf ( 1, '  %6d  ', step );
      for i = 1 : dim_num
        fprintf ( 1, '%8f  ', r(i) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end

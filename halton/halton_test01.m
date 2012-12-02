function halton_test01 ( )

%*****************************************************************************80
%
%% HALTON_TEST01 tests HALTON, HALTON_STEP_SET.
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
  test_num = 4;

  step_vec = [ 0, 5, 1000, 1000000 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HALTON_TEST01\n' );
  fprintf ( 1, '  HALTON returns the next element of a Halton sequence.\n' );
  fprintf ( 1, '  HALTON_STEP_SET sets the step.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we try several values of STEP.\n' );
  fprintf ( 1, '  We repeat the test for several dimensions.\n' );
  fprintf ( 1, '  We assume defaults for SEED, LEAP and BASE.\n' );

  for dim_num = 1 : dim_max

    for test = 1 : test_num

      halton_dim_num_set ( dim_num );
      n = 11;
      step = step_vec(test);
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
      fprintf ( 1, '          STEP   Halton\n' );
      fprintf ( 1, '\n' );

      for j = 1 : n
        r = halton ( );
        fprintf ( 1, '  %12d  ', step+j-1 );
        for i = 1 : dim_num
          fprintf ( 1, '%12f  ', r(i) );
        end
        fprintf ( 1, '\n' );
      end

    end

  end

  return
end

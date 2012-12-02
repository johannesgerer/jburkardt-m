function niederreiter2_test04 ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST04 tests NIEDERREITER2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2008
%
%  Author:
%
%    John Burkardt
%
  dim_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST04\n' );
  fprintf ( 1, '  NIEDERREITER2 computes the next element of\n' );
  fprintf ( 1, '  a Niederreiter quasirandom sequence using base 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call NIEDERREITER2 repeatedly.\n' );

  for dim_num = 2 : dim_max

    seed = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Seed  Seed   Niederreiter2\n' );
    fprintf ( 1, '  In    Out\n' );
    fprintf ( 1, '\n' );

    for i = 0 : 110
      seed_in = seed;
      [ r, seed ] = niederreiter2 ( dim_num, seed );
      seed_out = seed;
      if ( i <= 11 | 95 <= i )
        fprintf ( 1, '%3d  %3d  ', seed_in, seed_out );
        for j = 1 : dim_num
          fprintf ( 1, '%10f', r(j) );
        end
        fprintf ( 1, '\n' );
      elseif ( i == 12 )
        fprintf ( 1, '......................\n' );
      end
    end

  end

  return
end

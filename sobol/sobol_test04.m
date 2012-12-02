function sobol_test04 ( )

%*****************************************************************************80
%
%% SOBOL_TEST04 tests I4_SOBOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOBOL_TEST04\n' );
  fprintf ( 1, '  I4_SOBOL returns the next element\n' );
  fprintf ( 1, '  of a Sobol sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call I4_SOBOL repeatedly.\n' );

  dim_max = 4;

  for dim_num = 2 : dim_max

    seed = 0;
    qs = prime_ge ( dim_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Seed  Seed   I4_SOBOL\n' );
    fprintf ( 1, '  In    Out\n' );
    fprintf ( 1, '\n' );
    for i = 0 : 110
      [ r, seed_out ] = i4_sobol ( dim_num, seed );
      if ( i <= 11 || 95 <= i )
        fprintf ( 1, '%6d %6d  ', seed, seed_out );
        for j = 1 : dim_num
          fprintf ( 1, '%10f  ', r(j) );
        end
        fprintf ( 1, '\n' );
      elseif ( i == 12 )
        fprintf ( 1, '......................\n' );
      end
      seed = seed_out;
    end

  end 

  return
end

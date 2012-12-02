function faure_test01 ( )

%*****************************************************************************80
%
%% FAURE_TEST01 tests FAURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FAURE_TEST01\n' );
  fprintf ( 1, '  FAURE returns the next element\n' );
  fprintf ( 1, '  of a Faure sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call Faure repeatedly.\n' );

  dim_max = 4;

  for dim_num = 2 : dim_max

    seed = -1;
    qs = prime_ge ( dim_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );
    fprintf ( 1, '  The underlying base is QS = %d\n', qs );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Seed    Seed   Faure\n' );
    fprintf ( 1, '    In      Out\n' );
    fprintf ( 1, '\n' );
    for i = 1 : 10
      [ r, seed_out ] = faure ( dim_num, seed );
      fprintf ( 1, '  %6d   %6d', seed, seed_out );
      for dim = 1 : dim_num
        fprintf ( 1, '  %10f', r(dim) );
      end
      fprintf ( 1, '\n' );
      seed = seed_out;
    end

  end 

  return
end

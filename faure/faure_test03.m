function faure_test03 ( )

%*****************************************************************************80
%
%% FAURE_TEST03 tests FAURE.
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
  fprintf ( 1, 'FAURE_TEST03\n' );
  fprintf ( 1, '  FAURE returns the next element\n' );
  fprintf ( 1, '  of a Faure sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we try some large dimensions.\n' );

  dim_base = 10;

  for dim_num = dim_base : dim_base : 6 * dim_base

    seed = -1;
    qs = prime_ge ( dim_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );
    fprintf ( 1, '  The underlying base is QS = %d\n', qs );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Seed    Seed   Faure\n' );
    fprintf ( 1, '    In      Out\n' );
    fprintf ( 1, '\n' );
    for i = 1 : 2
      [ r, seed_out ] = faure ( dim_num, seed );
      fprintf ( 1, '  %8d  %8d', seed, seed_out );
      for dim = 1 : dim_num
        fprintf ( 1, '  %10f', r(dim) );
        if ( mod ( dim, 5 ) == 0 | dim == dim_num )
          fprintf ( 1, '\n' );
        end
        if ( mod ( dim,5 ) == 0 & dim < dim_num )
          fprintf ( 1, '                    ' );
        end
      end
      fprintf ( 1, '\n' );
      seed = seed_out;
    end

  end 

  return
end

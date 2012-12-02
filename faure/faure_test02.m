function faure_test02 ( )

%*****************************************************************************80
%
%% FAURE_TEST02 tests FAURE.
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
  fprintf ( 1, 'FAURE_TEST02\n' );
  fprintf ( 1, '  FAURE computes the next element of a Faure sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we demonstrate how the SEED can be\n' );
  fprintf ( 1, '  manipulated to skip ahead in the sequence, or\n' );
  fprintf ( 1, '  to come back to any part of the sequence.\n' );
  fprintf ( 1, '\n' );

  dim_num = 3;
  qs = prime_ge ( dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );
  fprintf ( 1, '  The underlying base is QS = %d\n', qs );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note that on the first call to FAURE, if\n' );
  fprintf ( 1, '  SEED is negative, it is reset to a value that\n' );
  fprintf ( 1, '  is the recommended starting point:\n' );

  seed = -1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Seed    Seed   Faure\n' );
  fprintf ( 1, '    In      Out\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ r, seed_out ] = faure ( dim_num, seed );
    fprintf ( 1, '  %6d  %6d', seed, seed_out );
    for dim = 1 : dim_num
      fprintf ( 1, '  %10f', r(dim) );
    end
    fprintf ( 1, '\n' );
    seed = seed_out;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  However, if the input value of SEED is 0,\n' );
  fprintf ( 1, '  then no initial skipping is done.\n' );

  seed = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Seed    Seed   Faure\n' );
  fprintf ( 1, '    In      Out\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed_out ] = faure ( dim_num, seed );
    fprintf ( 1, '  %6d  %6d', seed, seed_out );
    for dim = 1 : dim_num
      fprintf ( 1, '  %10f', r(dim) );
    end
    fprintf ( 1, '\n' );
    seed = seed_out;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jump ahead by increasing SEED:\n' );
  fprintf ( 1, '\n' );

  seed = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Seed    Seed   Faure\n' );
  fprintf ( 1, '    In      Out\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ r, seed_out ] = faure ( dim_num, seed );
    fprintf ( 1, '  %6d  %6d', seed, seed_out );
    for dim = 1 : dim_num
      fprintf ( 1, '  %10f', r(dim) );
    end
    fprintf ( 1, '\n' );
    seed = seed_out;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jump back by decreasing SEED:\n' );
  fprintf ( 1, '\n' );

  seed = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Seed    Seed   Faure\n' );
  fprintf ( 1, '    In      Out\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed_out ] = faure ( dim_num, seed );
    fprintf ( 1, '  %6d  %6d', seed, seed_out );
    for dim = 1 : dim_num
      fprintf ( 1, '  %10f', r(dim) );
    end
    fprintf ( 1, '\n' );
    seed = seed_out;
  end  

  return
end

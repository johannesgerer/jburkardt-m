function niederreiter2_test05 ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST05 tests NIEDERREITER2.
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
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST05\n' );
  fprintf ( 1, '  NIEDERREITER2 computes the next element of\n' );
  fprintf ( 1, '  a Niederreiter quasirandom sequence using base 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we demonstrate how the SEED can be\n' );
  fprintf ( 1, '  manipulated to skip ahead in the sequence, or\n' );
  fprintf ( 1, '  to come back to any part of the sequence.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using dimension DIM_NUM =   %d\n', dim_num );

  seed = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seed  Seed   Niederreiter2\n' );
  fprintf ( 1, '  In    Out\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 10
    seed_in = seed;
    [ r, seed ] = niederreiter2 ( dim_num, seed );
    seed_out = seed;
    fprintf ( 1, '%3d  %3d  ', seed_in, seed_out );
    for j = 1 : dim_num
      fprintf ( 1, '%10f', r(j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jump ahead by increasing SEED:\n' );
  fprintf ( 1, '\n' );

  seed = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seed  Seed   Niederreiter2\n' );
  fprintf ( 1, '  In    Out\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    seed_in = seed;
    [ r, seed ] = niederreiter2 ( dim_num, seed );
    seed_out = seed;
    fprintf ( 1, '%3d  %3d  ', seed_in, seed_out );
    for j = 1 : dim_num
      fprintf ( 1, '%10f', r(j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jump back by decreasing SEED:\n' );
  fprintf ( 1, '\n' );

  seed = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seed  Seed   Niederreiter2\n' );
  fprintf ( 1, '  In    Out\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 10
    seed_in = seed;
    [ r, seed ] = niederreiter2 ( dim_num, seed );
    seed_out = seed;
    fprintf ( 1, '%3d  %3d  ', seed_in, seed_out );
    for j = 1 : dim_num
      fprintf ( 1, '%10f', r(j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jump ahead by increasing SEED:\n' );
  fprintf ( 1, '\n' );
  seed = 98;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seed  Seed   Niederreiter2\n' );
  fprintf ( 1, '  In    Out\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    seed_in = seed;
    [ r, seed ] = niederreiter2 ( dim_num, seed );
    seed_out = seed;
    fprintf ( 1, '%3d  %3d  ', seed_in, seed_out );
    for j = 1 : dim_num
      fprintf ( 1, '%10f', r(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

function uniform_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests LCRG_SEED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  LCRG_SEED directly computes the updated value of a\n' );
  fprintf ( 1, '  seed used by an linear congruential random number\n' );
  fprintf ( 1, '  generator.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I          SEED          SEED          SEED    U\n' );
  fprintf ( 1, '                 Input        Output          LCRG\n' );
  fprintf ( 1, '\n' );
%
%  These parameters define the old (1969) IBM 360 random number generator:
%
  a = 16807;
  b = 0;
  c = i4_huge ( );
%
%  This seed value was used in Pierre L'Ecuyer's article.
%
  seed_start = 12345;

  seed = seed_start;
%
%  Compute 1000 random numbers "the hard way", that is, sequentially.
%  Every now and then, call LCRG_SEED to compute SEED directly.
%
  for i = 1 : 1000

    seed_in = seed;
    [ u, seed ] = r4_uniform_01 ( seed );
    seed_out = seed;

    if ( i <= 10 | i == 100 | i == 1000 )

      seed_lcrg = lcrg_seed ( a, b, c, i, seed_start );

      fprintf ( 1, '  %6d  %12d  %12d  %12d  %14f\n', ...
        i, seed_in, seed_out, seed_lcrg, u );

    end

  end

  return
end

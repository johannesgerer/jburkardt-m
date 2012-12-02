function randlc_test03 ( )

%*****************************************************************************80
%
%% RANDLC_TEST03 tests RANDLC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDLC_TEST03\n' );
  fprintf ( 1, '  RANDLC computes a sequence of pseudorandom numbers\n' );
  fprintf ( 1, '  but all computations depend on the seed value.\n' );
  fprintf ( 1, '  In this test, we show how a sequence of "random"\n' );
  fprintf ( 1, '  values can be manipulated by accessing the seed.\n' );
  
  seed = 1066.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Set SEED to %14.0f\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call 10 times, and watch SEED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    RANDLC\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    if ( i == 5 )
      seed_save = seed;
    end
    [ r, seed_out ] = randlc ( seed_in );
    fprintf ( 1, '  %6d  %14.0f  %14.0f  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end

  seed = seed_save;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reset SEED to its value at step 5, %14.0f\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call 10 times, and watch how SEED\n' );
  fprintf ( 1, '  and RANDLC restart themselves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    RANDLC\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    [ r, seed_out ] = randlc ( seed_in );
    fprintf ( 1, '  %6d  %14.0f  %14.0f  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end
 
  seed = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  What happens with a zero SEED?\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    RANDLC\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    [ r, seed_out ] = randlc ( seed_in );
    fprintf ( 1, '  %6d  %14.0f  %14.0f  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end

  seed = -12345678;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  What happens with a negative SEED?\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    RANDLC\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    [ r, seed_out ] = randlc ( seed_in );
    fprintf ( 1, '  %6d  %14.0f  %14.0f  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end

  return
end

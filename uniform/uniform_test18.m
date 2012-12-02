function uniform_test18 ( )

%*****************************************************************************80
%
%% UNIFORM_TEST18 tests R8_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 June 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST18\n' );
  fprintf ( 1, '  R8_UNIFORM_01 computes a sequence of pseudorandom numbers\n' );
  fprintf ( 1, '  but all computations depend on the seed value.\n' );
  fprintf ( 1, '  In this test, we show how a sequence of "random"\n' );
  fprintf ( 1, '  values can be manipulated by accessing the seed.\n' );
  
  seed = 1066;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Set SEED to %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call 10 times, and watch SEED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    R8_UNIFORM_01\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    if ( i == 5 )
      seed_save = seed;
    end
    [ r, seed_out ] = r8_uniform_01 ( seed_in );
    fprintf ( 1, '  %6d  %12d  %12d  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end

  seed = seed_save;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reset SEED to its value at step 5, %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call 10 times, and watch how SEED\n' );
  fprintf ( 1, '  and R8_UNIFORM_01 restart themselves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    R8_UNIFORM_01\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    [ r, seed_out ] = r8_uniform_01 ( seed_in );
    fprintf ( 1, '  %6d  %12d  %12d  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end
 
  seed = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  What happens with a zero SEED?\n' );

  if ( 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ANSWER: We force a MATLAB error.  Skip this check!\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '       I         Input        Output    R8_UNIFORM_01\n' );
    fprintf ( 1, '                  SEED          SEED\n' );
    fprintf ( 1, '\n' );

    for i = 1: 10
      seed_in = seed;
      [ r, seed_out ] = r8_uniform_01 ( seed_in );
      fprintf ( 1, '  %6d  %12d  %12d  %10f\n', i, seed_in, seed_out, r );
      seed = seed_out;
    end

  end

  seed = -12345678;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  What happens with a negative SEED?\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I         Input        Output    R8_UNIFORM_01\n' );
  fprintf ( 1, '                  SEED          SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1: 10
    seed_in = seed;
    [ r, seed_out ] = r8_uniform_01 ( seed_in );
    fprintf ( 1, '  %6d  %12d  %12d  %10f\n', i, seed_in, seed_out, r );
    seed = seed_out;
  end

  return
end

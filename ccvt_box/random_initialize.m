function seed = random_initialize ( seed )

%*****************************************************************************80
%
%% RANDOM_INITIALIZE initializes the MATLAB random number seed.
%
%  Discussion:
%
%    If you don't initialize the random number generator, its behavior
%    is not specified.  By specifying a particular seed value before generating
%    a series of random numbers, it is possible to regenerate that series
%    at any time by reinitializing the random number generator with that seed.
%
%    This routine can choose a seed for the user (signaled by giving
%    a zero input value for SEED).
%
%    It then uses the seed to initialize the state of the random
%    number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, the seed to use for the random number generator.
%    If the input value of SEED is 0, then the user is requesting this
%    program to choose a SEED value at random.
%
%    Output, integer SEED, if the input seed was nonzero, the output value
%    is that value as well.  Otherwise, the output value of SEED is a
%    value chosen internally.
%
  debug = 0;

  if ( seed ~= 0 )

    if ( debug )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RANDOM_INITIALIZE:\n' );
      fprintf ( 1, '  Initialize RANDOM_NUMBER, user SEED = %d\n', seed );
    end

  else

    seed = get_seed ( );

    if ( debug )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RANDOM_INITIALIZE:\n' );
      fprintf ( 1, '  Initialize RANDOM_NUMBER, arbitrary SEED = %d\n', seed );
    end

  end

  rng ( seed );

  return
end

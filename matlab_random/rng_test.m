function rng_test ( )

%*****************************************************************************80
%
%% RNG_TEST shows how random numbers are generated in MATLAB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RNG_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MATLAB random number functions RNG and RAND.\n' );
%
%  No initialization.
%
  for i = 1 : 5
    rng_test01 ( );
  end
%
%  Same initialization.
%
  seed = 123456789;
  for i = 1 : 5
    rng_test02 ( seed );
    seed = seed;
  end
%
%  Varying initialization.
%
  seed = 123456789;
  for i = 1 : 5
    rng_test02 ( seed );
    seed = 123456789 + mod ( i, 3 );
  end
%
%  Random initialization.
%
  for i = 1 : 5
    rng_test03 ( );
  end
%
%  Save and restore state.
%
  rng_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RNG_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function rng_test01 ( )

%*****************************************************************************80
%
%% RNG_TEST01 calls RAND with no initialization.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAND_TEST01:\n' );
  fprintf ( 1, '  Call RAND with no initialization:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    r = rand ( );
    fprintf ( 1, '  %d  %g\n', i, r );
  end

  return
end
function rng_test02 ( seed )

%*****************************************************************************80
%
%% RNG_TEST02 initializes random number generator with SEED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAND_TEST02:\n' );
  fprintf ( 1, '  Initialize random number generation with RNG(%d):\n', seed );
  fprintf ( 1, '\n' );

  rng ( seed );

  for i = 1 : 5
    r = rand ( );
    fprintf ( 1, '  %d  %g\n', i, r );
  end

  return
end
function rng_test03 ( )

%*****************************************************************************80
%
%% RNG_TEST03 randomly initializes the random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAND_TEST03:\n' );
  fprintf ( 1, '  Randomly initialize with RNG(''shuffle''):\n' );
  fprintf ( 1, '\n' );

  rng ( 'shuffle' );

  for i = 1 : 5
    r = rand ( );
    fprintf ( 1, '  %d  %g\n', i, r );
  end

  return
end
function rng_test04 ( )

%*****************************************************************************80
%
%% RNG_TEST04 saves the state and restores it later.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAND_TEST04:\n' );
  fprintf ( 1, '  Save and restore the RNG state:\n' );
  fprintf ( 1, '\n' );

  s = rng ( );

  for i = 1 : 5
    r = rand ( );
    fprintf ( 1, '  %d  %g\n', i, r );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Restoring RNG state:\n' );
  fprintf ( 1, '\n' );

  rng ( s );

  for i = 1 : 5
    r = rand ( );
    fprintf ( 1, '  %d  %g\n', i, r );
  end
  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

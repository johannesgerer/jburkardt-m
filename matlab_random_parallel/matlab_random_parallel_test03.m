function matlab_random_parallel_test03 ( )

%*****************************************************************************80
%
%% MATLAB_RANDOM_PARALLEL_TEST03 compares random streams from two PARFOR workers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB_RANDOM_PARALLEL_TEST03\n' );
  fprintf ( 1, '  Show that it seems safe to call RAND inside a PARFOR loop.\n' );
  fprintf ( 1, '  Presumably, the workers have distinct random number streams.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  However, apparently, you cannot control the worker streams\n' );
  fprintf ( 1, '  by calling RNG(seed).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initialize the generator to 123456789.\n' );
  fprintf ( 1, '  Generate 12 random values in a FOR loop:\n' );
  fprintf ( 1, '  Do this TWICE.\n' );

  seed = 123456789;
  rng ( seed );
  for i = 1 : 12
    x(i) = rand ( 1, 1 );
  end

  x

  seed = 123456789;
  rng ( seed );
  for i = 1 : 12
    x(i) = rand ( 1, 1 );
  end

  x

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reinitialize the generator to 123456789.\n' );
  fprintf ( 1, '  Generate 12 random values in a PARFOR loop with 2 workers:\n' );
  fprintf ( 1, '  Do this TWICE.\n' );
  fprintf ( 1, '  Apparently, restoring the seed on the client\n' );
  fprintf ( 1, '  does NOT restore it on the workers.\n' );
  fprintf ( 1, '  We get different results the second time.\n' );

  matlabpool open local 2

  seed = 123456789;
  rng ( seed );
  parfor i = 1 : 12
    x(i) = rand ( 1, 1 );
  end
  x

  seed = 123456789;
  rng ( seed );
  parfor i = 1 : 12
    x(i) = rand ( 1, 1 );
  end
  x

  matlabpool close

  if ( 0 )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reinitialize the generator to 123456789.\n' );
  fprintf ( 1, '  Generate 12 random values in a PARFOR loop with 4 workers:\n' );
  fprintf ( 1, '  Do this TWICE.\n' );
  fprintf ( 1, '  Apparently, restoring the seed on the client\n' );
  fprintf ( 1, '  does NOT restore it on the workers.\n' );
  fprintf ( 1, '  We get different results the second time.\n' );

  matlabpool open local 4

  seed = 123456789;
  rng ( seed );
  parfor i = 1 : 12
    x(i) = rand ( 1, 1 );
  end
  x

  seed = 123456789;
  rng ( seed );
  parfor i = 1 : 12
    x(i) = rand ( 1, 1 );
  end
  x

  matlabpool close

  end

  return
end

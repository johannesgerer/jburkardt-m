function latin_random_test ( )

%*****************************************************************************80
%
%% LATIN_RANDOM_TEST tests LATIN_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 April 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_RANDOM_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LATIN_RANDOM library.\n' );

  seed = 0;
  seed = get_seed ( seed );

  seed_save = seed;
  seed = latin_random_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_RANDOM_TEST:\n' );
  fprintf ( 1, '  Repeat test with different seed than run 1.\n' );

  seed = latin_random_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_RANDOM_TEST:\n' );
  fprintf ( 1, '  Repeat test with same seed as run 1.\n' );

  seed = seed_save;
  seed = latin_random_test01 ( seed );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_RANDOM_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function subpak_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests RANDOM_INITIALIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  RANDOM_INITIALIZE can make up a seed for the MATLAB\n' );
  fprintf ( 1, '  random number generator RAND, or use a\n' );
  fprintf ( 1, '  single SEED value from the user.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Calling RANDOM_INITIALIZE with a zero input value of SEED\n' );
  fprintf ( 1, '  tells the routine to make up a seed.  And, at least for\n' );
  fprintf ( 1, '  calls a few milliseconds apart, the output SEED should\n' );
  fprintf ( 1, '  be different.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In any case, if RAND is restarted by calling\n' );
  fprintf ( 1, '  RANDOM_INITIALIZE with a nonzero input SEED, then\n' );
  fprintf ( 1, '  the random number sequence should repeat.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call RANDOM_INITIALIZE 10 times, with a zero input SEED.\n' );
  fprintf ( 1, '  Also, get the first three real random values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    SEED            Random 1, 2, 3\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    seed = 0;
    random_initialize ( seed );
    r(1:3) = rand(3,1);
    fprintf ( 1, '  %12d  %9f  %9f  %9f\n', seed, r(1:3) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call RANDOM_INITIALIZE with SEED = 5, 95, 5, 95.\n' );
  fprintf ( 1, '  We promise the random numbers will repeat the second time.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    SEED            Random 1, 2, 3\n' );
  fprintf ( 1, '\n' );
  seed = 5;
  for i = 1 : 4
    random_initialize ( seed );
    r(1:3) = rand(3,1);
    fprintf ( 1, '  %12d  %9f  %9f  %9f\n', seed, r(1:3) );
    seed = 100 - seed;
  end

  return
end

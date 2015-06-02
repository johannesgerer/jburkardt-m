function matlab_random_parallel_test01 ( )

%*****************************************************************************80
%
%% MATLAB_RANDOM_PARALLEL_TEST01 simply demonstrates some features of RAND.
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
  fprintf ( 1, 'MATLAB_RANDOM_PARALLEL_TEST01\n' );
  fprintf ( 1, '  Demonstrate some features of RAND.\n' );
  fprintf ( 1, '  Compute 10 random values several times.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  #1: use default settings\n' );
  fprintf ( 1, '  #2: use rng(''shuffle''), setting seed based on time.\n' );
  fprintf ( 1, '  #3: use rng(123456789), setting seed explicitly.\n' );
  fprintf ( 1, '  #4, save state.\n' );
  fprintf ( 1, '  #5: use rng(''shuffle''), setting seed based on time.\n' );
  fprintf ( 1, '  #6: use rng(123456789), setting seed explicitly.\n' );
  fprintf ( 1, '  #7: restore state.\n' );
%
%  Compute 10 random values immediately.
%
  x1 = rand ( 10, 1 );
%
%  Call "shuffle", which picks a seed based on the current time.
%
  rng ( 'shuffle' );
  x2 = rand ( 10, 1 );
%
%  Set the seed to 123456789.
%
  seed = 123456789;
  rng ( seed );
  x3 = rand ( 10, 1 );
%
%  Save state.
%
  state = rng;
  x4 = rand ( 10, 1 );
%
%  Call "shuffle", which picks a seed based on the current time.
%
  rng ( 'shuffle' );
  x5 = rand ( 10, 1 );
%
%  Set the seed to 123456789.
%
  seed = 123456789;
  rng ( seed );
  x6 = rand ( 10, 1 );
%
%  Restore state.
%
  rng ( state );
  x7 = rand ( 10, 1 );
%
%  Print results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '        #1          #2          #3          #4' )
  fprintf ( 1, '          #5          #6          #7\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      x1(i), x2(i), x3(i), x4(i), x5(i), x6(i), x7(i) );
  end

  return
end


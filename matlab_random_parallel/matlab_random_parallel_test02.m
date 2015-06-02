function matlab_random_parallel_test02 ( )

%*****************************************************************************80
%
%% MATLAB_RANDOM_PARALLEL_TEST02 compares random streams from two SPMD workers.
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
  fprintf ( 1, 'MATLAB_RANDOM_PARALLEL_TEST02\n' );
  fprintf ( 1, '  Demonstrate that, by default, each Matlab worker\n' );
  fprintf ( 1, '  gets a unique random number stream.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Begin by opening a pool of 2, and use SPMD.\n' );

  matlabpool local 2

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Have each worker generate a row of 4 random values.\n' );

  spmd
    R = rand ( 1, 4 );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Worker 1: %10.4f  %10.4f  %10.4f  %10.4f\n', R{1} );
  fprintf ( 1, '  Worker 2: %10.4f  %10.4f  %10.4f  %10.4f\n', R{2} );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  If desired, all workers can use the same stream.\n' );
  fprintf ( 1, '  Simply have each worker call rng() with the same seed.\n' );
  spmd
    rng ( 123456789 );
    R = rand ( 1, 4 );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Worker 1: %10.4f  %10.4f  %10.4f  %10.4f\n', R{1} );
  fprintf ( 1, '  Worker 2: %10.4f  %10.4f  %10.4f  %10.4f\n', R{2} );

  matlabpool close

  return
end

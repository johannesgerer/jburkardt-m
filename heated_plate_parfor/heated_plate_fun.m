function heated_plate_fun ( epsilon, output_filename )

%*****************************************************************************80
%
%  Purpose:
%
%    HEATED_PLATE_FUN is a function to solve the heated plate problem.
%
%  Discussion:
%
%    This code solves the steady state heat equation on a rectangular region.
%
%    The sequential version of this program needs approximately
%    18/eps iterations to complete.
%
%
%    The physical region, and the boundary conditions, are suggested
%    by this diagram;
%
%                   W = 0
%             +------------------+
%             |                  |
%    W = 100  |                  | W = 100
%             |                  |
%             +------------------+
%                   W = 100
%
%    The region is covered with a grid of M by N nodes, and an N by N
%    array W is used to record the temperature.  The correspondence between
%    array indices and locations in the region is suggested by giving the
%    indices of the four corners:
%
%                  I = 0
%          [0][0]-------------[0][N-1]
%             |                  |
%      J = 0  |                  |  J = N-1
%             |                  |
%        [M-1][0]-----------[M-1][N-1]
%                  I = M-1
%
%    The steady state solution to the discrete heat equation satisfies the
%    following condition at an interior grid point:
%
%      W[Central] = (1/4) * ( W[North] + W[South] + W[East] + W[West] )
%
%    where "Central" is the index of the grid point, "North" is the index
%    of its immediate neighbor to the "north", and so on.
%
%    Given an approximate solution of the steady state heat equation, a
%    "better" solution is given by replacing each interior point by the
%    average of its 4 neighbors - in other words, by using the condition
%    as an ASSIGNMENT statement:
%
%      W[Central]  <=  (1/4) * ( W[North] + W[South] + W[East] + W[West] )
%
%    If this process is repeated often enough, the difference between successive
%    estimates of the solution will go to zero.
%
%    This program carries out such an iteration, using a tolerance specified by
%    the user, and writes the final estimate of the solution to a file that can
%    be used for graphic processing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 July 2010
%
%  Author:
%
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Michael Quinn,
%    Parallel Programming in C with MPI and OpenMP,
%    McGraw-Hill, 2004,
%    ISBN13: 978-0071232654,
%    LC: QA76.73.C15.Q55.
%
%  Parameters:
%
%    Commandline argument 1, real EPSILON, the error tolerance.
%
%    Commandline argument 2, string OUTPUT_FILENAME, the name of the file into which
%    the steady state solution is written when the program has completed.
%
%  Local parameters:
%
%    Local, real DIFF, the norm of the change in the solution from
%    one iteration to the next.
%
%    Local, real MEAN, the average of the boundary values, used
%    to initialize the values of the solution in the interior.
%
%    Local, real U(M,N), the solution at the previous iteration.
%
%    Local, real W(M,N), the solution computed at the latest
%    iteration.
%
  m = 500;
  n = 500;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_PARFOR\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A program to solve for the steady state temperature distribution\n' );
  fprintf ( 1, '  over a rectangular plate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial grid of %d by %d points.\n', m, n );
%
%  Read EPSILON from the command line or the user.
%
  if ( nargin < 1 )
    epsilon = input ( '  Enter EPSILON, the error tolerance.' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The iteration will repeat until the change is <= %e\n', epsilon );
%
%  Read OUTPUT_FILENAME from the command line or the user.
%
  if ( nargin < 2 )
    output_filename = input ( ...
      '  Enter OUTPUT_FILENAME, the name of the output file.' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The steady state solution will be written to "%s".\n', ...
    output_filename );
%
%  Set the boundary values, which don't change.
%
  w(2:m-1,1) = 100.0;
  w(2:m-1,n) = 100.0;
  w(m,1:n) = 100.0;
  w(1,1:n) =   0.0;
%
%  Average the boundary values, to come up with a reasonable
%  initial value for the interior.
%
  mean = ( sum ( w(2:m-1,1) ) ...
         + sum ( w(2:m-1,n) ) ...
         + sum ( w(1,1:n) ) ...
         + sum ( w(m,1:n) ) ) / ( 2 * m + 2 * n - 4 );
%
%  Initialize the interior solution to the mean value.
%
  w(2:m-1,2:n-1) = mean;
%
%  Iterate until the  new solution W differs from the old solution U
%  by no more than EPSILON.
%
  iterations = 0;
  iterations_print = 1;
  diff = epsilon;

  fprintf ( 1, '\n' );
  fprintf ( 1, ' Iteration  Change\n' );
  fprintf ( 1, '\n' );

  tic;

  while ( epsilon <= diff )

    u = w;
%
%  Can't classify W here.
%
    k = 2 : m-1;

    parfor j = 2 : n - 1
      w(k,j) = 0.25 * ( ...
          u(1:m-2,j) ...
        + u(3:m,j) ...
        + u(2:m-1,j-1) ...
        + u(2:m-1,j+1) );
    end

    diff = max ( max ( abs ( u - w ) ) );

    iterations = iterations + 1;

    if ( iterations == iterations_print )
      fprintf ( 1, '  %8d  %14f\n', iterations, diff );
      iterations_print = 2 * iterations_print;
    end

  end

  wtime = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8d  %14f\n', iterations, diff );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Error tolerance achieved.\n' );
  fprintf ( 1, '  Wallclock time = %f\n', wtime );
%
%  Write the solution to the output file.
%
  output_unit = fopen ( output_filename, 'wt' );

  fprintf ( output_unit, '%d\n', m );
  fprintf ( output_unit, '%d\n', n );
  for i = 1 : m
    for j = 1 : n
      fprintf (output_unit, '  %f', w(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end

  fclose ( output_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution written to the output file "%s".\n', output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_PARFOR:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

function subpak_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests RAND.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  RAND(M,N) is a MATLAB routine which returns an M by N\n' );
  fprintf ( 1, '  array of pseudorandom values.\n' );
%
%  Set the random number seed.
%
  rand ( 'state', seed );

  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
%
%  Test 1:
%  Simply call 5 times for 1 value, and print.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test #1: Call 5 times, 1 value each time.\n' );
  fprintf ( 1, '\n' );

  n = 1;
  for i = 1 : 5
    x(1) = rand ( n, 1 );
    fprintf ( 1, '  %6d  %12f\n', i, x(1) );
  end
%
%  Test 2:
%  Restore the random number seed, and repeat.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test #2: Restore the random number seed.\n' );
  fprintf ( 1, '  Call 5 times, 1 value each time.\n' );
  fprintf ( 1, '  The results should be identical.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  rand ( 'state', seed );

  n = 1;
  for i = 1 : 5
    x(1) = rand ( n, 1 );
    fprintf ( 1, '  %6d  %12f\n', i, x(1) );
  end
%
%  Test 3:
%  Restore the random number seed, compute all 5 values at once.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test #3: Restore the random number seed.\n' );
  fprintf ( 1, '  Call 1 time for 5 values.\n' );
  fprintf ( 1, '  The results should be identical.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  rand ( 'state', seed );

  n = 5;
  x(1:n) = rand ( n, 1 );

  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end
%
%  Test 4:
%  Restore the random number seed, compute all 5 values at once.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test #4: Restore the random number seed.\n' );
  fprintf ( 1, '  Call for 2, 1, and 2 values.\n' );
  fprintf ( 1, '  The results should be identical.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  rand ( 'state', seed );

  n = 2;
  x(1:n) = rand ( n, 1 );

  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  n = 1;
  x(1:n) = rand ( n, 1 );

  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  n = 2;
  x(1:n) = rand ( n, 1 );

  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end
%
%  Test 5:
%  Determine the minimum, maximum, mean and variance.
%
  n = 1000;
  x(1:n) = rand ( n, 1 );
  x_min = min( x(1:n) );
  x_max = max ( x(1:n) );
  x_mean = sum ( x(1:n) ) / n;
  x_var = sum ( ( x(1:n) - x_mean ).^2 ) / ( n - 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test #5:\n' );
  fprintf ( 1, '  Number of samples was %d\n', n );
  fprintf ( 1, '  Minimum value was %f\n', x_min );
  fprintf ( 1, '  Maximum value was %f\n', x_max );
  fprintf ( 1, '  Average value was %f\n', x_mean );
  fprintf ( 1, '  Variance was      %f\n', x_var );
  fprintf ( 1, '  Expected average  %f\n', 0.5 );
  fprintf ( 1, '  Expected variance %f\n', 1.0 / 12.0 );
 
  return
end

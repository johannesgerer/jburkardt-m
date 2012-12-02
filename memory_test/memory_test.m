function memory_test ( n_log_min, n_log_max )

%*****************************************************************************80
%
%% MAIN is the main program for MEMORY_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LOG_MIN, the logarithm of the minimum N to try.
%
%    Input, integer N_LOG_MAX, the logarithm of the maximum N to try.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEMORY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Try to see how big vectors and matrices can be.\n' );

  if ( nargin < 1 )
    n_log_min = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default value of N_LOG_MIN = %d\n', n_log_min );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User input value of N_LOG_MIN = %d\n', n_log_min );
  end

  if ( nargin < 2 )
    n_log_max = 25;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default value of N_LOG_MAX = %d\n', n_log_max );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User input value of N_LOG_MAX = %d\n', n_log_max );
  end
%
%  I4VEC test.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC Memory Test\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    'Log2(N)            N   Ave     CPU        Real\n' );
  fprintf ( 1, '\n' );

  for n_log = n_log_min : n_log_max

    i4vec_memory_test ( n_log );

  end
%
%  R8VEC test.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC Memory Test\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    'Log2(N)            N   Ave     CPU        Real\n' );
  fprintf ( 1, '\n' );

  for n_log = n_log_min : n_log_max

    r8vec_memory_test ( n_log );

  end
%
%  I4MAT test.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4MAT Memory Test\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    'Log2(N)            N            N1            N2   Ave     CPU        Real\n' );
  fprintf ( 1, '\n' );

  for n_log = n_log_min : n_log_max

    i4mat_memory_test ( n_log );

  end
%
%  R8MAT test.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT Memory Test\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    'Log2(N)            N            N1            N2   Ave     CPU        Real\n' );
  fprintf ( 1, '\n' );

  for n_log = n_log_min : n_log_max

    r8mat_memory_test ( n_log );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEMORY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function i4mat_memory_test ( n_log )

%*****************************************************************************80
%
%% I4MAT_MEMORY_TEST declares and uses an I4MAT of total size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LOG, the logarithm base 2 of N.
%
  n = 2^n_log;

  n1_log = floor ( n_log / 2 );
  n1 = 2^n1_log;
  n2_log = n_log - n1_log;
  n2 = 2^n2_log;

  fprintf ( 1, '  %4d  %12d', n_log, n );

  tic;
  cpu_time1 = cputime;

  i4mat = zeros ( n1, n2 );

  i4mat = round ( 2.0 * rand ( n1, n2 ) );

  average = ( sum ( sum ( i4mat(1:n1,1:n2) ) ) ) / n1 / n2;

  cpu_time2 = cputime;
  real_diff = toc;

  cpu_diff = cpu_time2 - cpu_time1;

  fprintf ( 1, '  %12d  %12d  %4.2f  %10e  %10e\n', ...
    n1, n2, average, cpu_diff, real_diff );

  return
end
function i4vec_memory_test ( n_log )

%*****************************************************************************80
%
%% I4VEC_MEMORY_TEST declares and uses an I4VEC of size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LOG, the logarithm base 2 of N.
%
  n = 2^n_log;

  fprintf ( 1, '  %4d  %12d', n_log, n );

  tic;
  cpu_time1 = cputime;

  i4vec = zeros ( n, 1 );

  i4vec = round ( 2.0 * rand ( n, 1 ) );

  average = ( sum ( i4vec(1:n) ) ) / n;

  cpu_time2 = cputime;
  real_diff = toc;

  cpu_diff = cpu_time2 - cpu_time1;

  fprintf ( 1, '  %4.2f  %10e  %10e\n', average, cpu_diff, real_diff );

  return
end
function r8mat_memory_test ( n_log )

%*****************************************************************************80
%
%% R8MAT_MEMORY_TEST declares and uses an R8MAT of total size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LOG, the logarithm base 2 of N.
%
  n = 2^n_log;

  n1_log = floor ( n_log / 2 );
  n1 = 2^n1_log;
  n2_log = n_log - n1_log;
  n2 = 2^n2_log;

  fprintf ( 1, '  %4d  %12d', n_log, n );

  tic;
  cpu_time1 = cputime;

  r8mat = zeros ( n1, n2 );

  r8mat = 2.0 * rand ( n1, n2 );

  average = ( sum ( sum ( r8mat(1:n1,1:n2) ) ) ) / n1 / n2;

  cpu_time2 = cputime;
  real_diff = toc;

  cpu_diff = cpu_time2 - cpu_time1;

  fprintf ( 1, '  %12d  %12d  %4.2f  %10e  %10e\n', ...
    n1, n2, average, cpu_diff, real_diff );

  return
end
function r8vec_memory_test ( n_log )

%*****************************************************************************80
%
%% R8VEC_MEMORY_TEST declares and uses an R8VEC of size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LOG, the logarithm base 2 of N.
%
  n = 2^n_log;

  fprintf ( 1, '  %4d  %12d', n_log, n );

  tic;
  cpu_time1 = cputime;

  r8vec = zeros ( n, 1 );

  r8vec = 2.0 * rand ( n, 1 );

  average = ( sum ( r8vec(1:n) ) ) / n;

  cpu_time2 = cputime;
  real_diff = toc;

  cpu_diff = cpu_time2 - cpu_time1;

  fprintf ( 1, '  %4.2f  %10e  %10e\n', average, cpu_diff, real_diff );

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

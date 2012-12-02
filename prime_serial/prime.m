function prime ( )

%*****************************************************************************80
%
%% PRIME carries out the prime number calculation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Call PRIME_NUMBER_SWEEP to count primes up to N.\n' );
 
  n_lo = 1;
  n_hi = 131072;
  n_factor = 2;

  prime_number_sweep ( n_lo, n_hi, n_factor );

  n_lo = 10;
  n_hi = 10000000;
  n_factor = 10;

  prime_number_sweep ( n_lo, n_hi, n_factor );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
   
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end
function prime_number_sweep ( n_lo, n_hi, n_factor )

%*****************************************************************************80
%
%% PRIME_NUMBER_SWEEP does repeated calls to PRIME_NUMBER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LO, the first value of N.
%
%    Input, integer N_HI, the last value of N.
%
%    Input, integer N_FACTOR, the factor by which to increase N 
%    after each iteration.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_NUMBER_SWEEP\n' );
  fprintf ( 1, '  Call PRIME_NUMBER for an increasing series of N values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N        Pi          Time       Ratio\n' );
  fprintf ( 1, '\n' );

  n = n_lo;
  wtime = 0.0;

  while ( n <= n_hi )

    wtime_old = wtime;

    tic;
    primes = prime_number ( n );
    wtime = toc;

    if ( wtime_old ~= 0.0 ) 
      fprintf ( 1, '%8d  %8d  %14f  %8f\n', n, primes, wtime, wtime / wtime_old );
    else
      fprintf ( 1, '%8d  %8d  %14f\n', n, primes, wtime );
    end

    n = n * n_factor;

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

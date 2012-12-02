function prime_plot ( n_max )

%*****************************************************************************80
%
%% PRIME_PLOT makes a box plot of primes.
%
%  Usage:
%
%    prime_plot ( n_max )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_MAX, the maximum number to be considered.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_PLOT\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display primes and composite numbers.\n' );
  fprintf ( 1, '  If N is composite, Box (N,D) is blue if N is divisible by D.\n' );
  fprintf ( 1, '  If N is prime, Column (N,:) is red.\n' );
%
%  First argument is N_MAX.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    n_max = input ( '  Enter N, the maximum number to check: ' );
  end

  clf
%
%  Every box starts out WHITE.
%
  for n = 1 : n_max

    for d = 1 : n_max

      x1 = n - 0.44;
      x2 = n + 0.44;
      y1 = d - 0.44;
      y2 = d + 0.44;

      patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'w', 'EdgeColor', 'none' );

    end
    
  end
%
%  By convention, 1 is NOT a prime!
%
  n = 1;
  d = 1;

  x1 = n - 0.44;
  x2 = n + 0.44;
  y1 = d - 0.44;
  y2 = d + 0.44;
  patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'b', 'EdgeColor', 'none' );

  for n = 2 : n_max

    prime = 1;

    d = 1;

    for d = 2 : min ( n_max, n - 1 )

      if ( mod ( n, d ) == 0 )
        x1 = n - 0.44;
        x2 = n + 0.44;
        y1 = d - 0.44;
        y2 = d + 0.44;
        patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'b', 'EdgeColor', 'none' );
        prime = 0;
      end

    end

    d = n;

    if ( prime )
      x1 = n - 0.44;
      x2 = n + 0.44;
      y1 = 1 - 0.44;
      y2 = d + 0.44;
      patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'r', 'EdgeColor', 'none' );  
    else
      x1 = n - 0.44;
      x2 = n + 0.44;
      y1 = d - 0.44;
      y2 = d + 0.44;
      patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'b', 'EdgeColor', 'none' );  
      x1 = n - 0.44;
      x2 = n + 0.44;
      y1 = 1 - 0.44;
      y2 = 1 + 0.44;
      patch ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], 'b', 'EdgeColor', 'none' );  
    end

  end

  xlabel ( '<---N--->' )
  ylabel ( '<--Divisors-->' )
  title ( 'Primes are red columns; blue squares are factors.' )

  axis ( [ 0.5, n + 0.5, 0.5, n + 0.5 ] );
  axis equal
  axis square
  axis tight

  filename = 'prime_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved in file "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRIME_PLOT\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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

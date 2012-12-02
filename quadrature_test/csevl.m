function value = csevl ( x, cs, n )

%*****************************************************************************80
%
%% CSEVL evaluates an N term Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    FORTRAN77 original version by Roger Broucke,
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    Volume 16, 1973, pages 254-256.
%
%    Leslie Fox, Ian Parker,
%    Chebyshev Polynomials in Numerical Analysis,
%    Oxford Press, 1968,
%    LC: QA297.F65.
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real X, the argument at which the series is 
%    to be evaluated.
%    X must satisfy -1.0 <= X <= 1.0.
%
%    Input, real CS(N), the array of N terms of a Chebyshev series.
%    In evaluating CS, only half the first coefficient is summed.
%
%    Input, integer N, the number of terms in array CS.
%    N must be at least 1, and no more than 1000.
%
%    Output, real CSEVL, the value of the Chebyshev series.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  Number of terms N is less than 1.\n' );
    error ( 'CSEVL - Fatal error!' );
  end

  if ( 1000 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  The number of terms is more than 1000.\n' );
    error ( 'CSEVL - Fatal error!' );
  end

  if ( x < -1.0 | 1.0 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  The input argument X is outside the interval [-1,1].\n' );
    error ( 'CSEVL - Fatal error!' );
  end

  b1 = 0.0;
  b0 = 0.0;

  for i = n : -1 : 1
    b2 = b1;
    b1 = b0;
    b0 = 2.0 * x * b1 - b2 + cs(i);
  end

  value = 0.5 * ( b0 - b2 );

  return
end

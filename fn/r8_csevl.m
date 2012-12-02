function value = r8_csevl ( x, a, n )

%*****************************************************************************80
%
%% R8_CSEVL evaluates a Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    Volume 16, Number 4, April 1973, pages 254-256.
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, real CS(N), the Chebyshev coefficients.
%
%    Input, integer N, the number of Chebyshev coefficients.
%
%    Output, real VALUE, the Chebyshev series evaluated at X.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CSEVL - Fatal error!\n' );
    fprintf ( 1, '  Number of terms <= 0.\n' );
    error ( 'R8_CSEVL - Fatal error!' )
  end

  if ( 1000 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CSEVL - Fatal error!\n' );
    fprintf ( 1, '  Number of terms > 1000.\n' );
    error ( 'R8_CSEVL - Fatal error!' )
  end

  if ( x < -1.1 || 1.1 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CSEVL - Fatal error!\n' );
    fprintf ( 1, '  X outside (-1,+1)\n' );
    fprintf ( 1, '  X = %g\n', x );
    error ( 'R8_CSEVL - Fatal error!' )
  end

  b1 = 0.0;
  b0 = 0.0;

  for i = n : -1 : 1
    b2 = b1;
    b1 = b0;
    b0 = 2.0 * x * b1 - b2 + a(i);
  end

  value = 0.5 * ( b0 - b2 );

  return
end

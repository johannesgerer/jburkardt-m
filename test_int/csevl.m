function value = csevl ( x, cs, n )

%*****************************************************************************80
%
%% CSEVL evaluates a Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2009
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    R. Broucke,
%    Algorithm 446,
%    Communications of the ACM,
%    Volume 16, 254 (1973).
%
%    Leslie Fox, Ian Parker,
%    Chebyshev Polynomials in Numerical Analysis,
%    Oxford Press, page 56.
%
%  Parameters:
%
%    Input, real X, the value at which the series
%    is to be evaluated.
%    X should be in the range -1.0 <= X <= 1.0.  The routine will refuse
%    to proceed if X <= -1.1 or 1.1 <= X.
%
%    Input, real CS(N), the coefficients of the Chebyshev series.
%    In evaluating CS, only half the first coef is summed.
%
%    Output, real VALUE, the value of the Chebyshev series at X.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  Number of terms N <= 0.\n' );
    error ( 'CSEVL - Fatal error!' )
  end

  if ( 1000 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  Number of terms 1000 < N.\n' );
    error ( 'CSEVL - Fatal error!' )
  end 

  if ( x < -1.1D+00 | 1.1D+00 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CSEVL - Fatal error!\n' );
    fprintf ( 1, '  X <= -1.1 or 1.1 <= X.\n' );
    error ( 'CSEVL - Fatal error!' )
  end

  b1 = 0.0;
  b0 = 0.0;
  for i = 1 : n
    b2 = b1;
    b1 = b0;
    b0 = 2.0 * x * b1 - b2 + cs(n+1-i);
  end

  value = 0.5 * ( b0 - b2 );

  return
end

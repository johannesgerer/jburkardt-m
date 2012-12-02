function [ xx, net ] = xalfa2 ( x, xx, npl, m, maxet, epsln )

%*****************************************************************************80
%
%% XALFA2 computes a Chebyshev series raised to the (-1/M) power.
%
%  Discussion:
%
%    This routine estimates the Chebyshev series for a function raised
%    to the (-1/M) power, given the Chebyshev series for the function,
%    and a starting estimate for the desired series.
%
%    The convergence is quadratic.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Roger Broucke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    October 1973, Volume 16, Number 4, pages 254-256.
%
%  Parameters:
%
%    Input, real X(NPL), the Chebyshev series of the function.
%
%    Input/output, real XX(NPL).  On input, an initial
%    approximation to the Chebyshev series of the function raised to the
%    (-1/M) power.  On output, an improved approximation.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Input, integer M, determines the exponent (-1/M).
%
%    Input, integer MAXET, the maximum number of iterations.
%
%    Input, real EPSLN, the required precision.
%
%    Output, integer NET, the actual number of iterations.
%
  for jx = 1 : maxet

    ww(1:npl) = x(1:npl);

    for k = 1 : m

      w2 = mltply ( ww, xx, npl );

      ww(1:npl) = w2(1:npl);

    end

    s = - 2.0 + sum ( abs ( ww(1:npl) ) );

    ww(1:npl) = - ww(1:npl);

    ww(1) = ww(1) + 2 * ( m + 1 );
    w2 = mltply ( ww, xx, npl );

    xx(1:npl) = w2(1:npl) / m;

    net = jx;

    if ( abs ( s ) < epsln )
      return;
    end

  end

  return
end

function xa = binom ( x, xx, npl, m, nt )

%*****************************************************************************80
%
%% BINOM: binomial expansion series for the (-1/M) power of a Chebyshev series.
%
%  Discussion:
%
%    This routine uses a certain number of terms of the binomial expansion 
%    series to estimate the (-1/M) power of a given Chebyshev series. 
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
%    Input, real X(NPL), the given Chebyshev series.
%
%    Input, real XX(NPL), an initial estimate for
%    the Chebyshev series for the input function raised to the (-1/M) power.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Input, integer M, defines the exponent, (-1/M).
%    0 < M.
%
%    Input, integer NT, the number of terms of the binomial
%    series to be used.
%
%    Output, real XA(NPL), the estimated Chebyshev series
%    for the input function raised to the (-1/M) power.
%
  xa = zeros ( npl, 1 );

  dm = m;
  alfa = - 1.0 / dm;

  ww(1:npl) = x(1:npl);

  for k = 1 : m

    w2 = mltply ( ww, xx, npl );

    ww(1:npl) = w2(1:npl);

  end

  ww(1) = ww(1) - 2.0;

  xa(1) = 2.0;
  xa(2:npl) = 0.0;

  w3(1) = 2.0;
  w3(2:npl) = 0.0;

  for k = 2 : nt

    dkmm = k - 1;
    dkm2 = k - 2;
    coef = ( alfa - dkm2 ) / dkmm;

    w2 = mltply ( w3, ww, npl );

    w3(1:npl) = w2(1:npl) * coef;

    xa(1:npl) = xa(1:npl) + w3(1:npl);

  end

  w2 = mltply ( xa, xx, npl );

  xa(1:npl) = w2(1:npl);

  return
end

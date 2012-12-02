function x3 = mltply ( xx, x2, npl )

%*****************************************************************************80
%
%% MLTPLY multiplies two Chebyshev series.
%
%  Discussion:
%
%    This routine multiplies two given Chebyshev series, XX and X2,
%    to produce an output Chebyshev series, X3.
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
%    Input, real XX(NPL), the first Chebyshev series.
%
%    Input, real X2(NPL), the second Chebyshev series.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Output, real X3(NPL), the Chebyshev series of the
%    product.
%
  x3(1:npl) = 0.0;

  for k = 1 : npl
    ex = 0.0;
    mm = npl - k + 1;
    for m = 1 : mm
      l = m + k - 1;
      ex = ex + xx(m) * x2(l) + xx(l) * x2(m);
    end
    x3(k) = 0.5 * ex;
  end

  x3(1) = x3(1) - 0.5 * xx(1) * x2(1);

  for k = 3 : npl
    ex = 0.0;
    mm = k - 1;
    for m = 2 : mm
      l = k - m + 1;
      ex = ex + xx(m) * x2(l);
    end
    x3(k) = 0.5 * ex + x3(k);
  end

  return
end

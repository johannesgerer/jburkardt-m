function x2 = dfrnt ( xx, npl )

%*****************************************************************************80
%
%% DFRNT determines the derivative of a Chebyshev series.
%
%  Discussion:
%
%    This routine computes the Chebyshev series of the derivative of a 
%    function whose Chebyshev series is given.
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
%    Input, real XX(NPL), the given Chebyshev series.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Output, real X2(NPL), the Chebyshev series for the
%    derivative.
%
  x2 = zeros ( npl, 1 );

  n = npl - 1;
  xxn = xx(npl-1);
  x2(npl-1) = 2.0 * xx(npl) * n;
  x2(npl) = 0.0;

  for k = 3 : npl
    l = npl - k + 1;
    xxl = xx(l);
    x2(l) = x2(l+2) + 2.0 * xxn * l;
    xxn = xxl;
  end

  return
end

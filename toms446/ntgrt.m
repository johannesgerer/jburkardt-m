function x2 = ntgrt ( xx, npl )

%*****************************************************************************80
%
%% NTGRT determines the integral of a Chebyshev series.
%
%  Discussion:
%
%    This routine computes the Chebyshev series for the integral of a 
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
%    Input, real XX(NPL), the Chebyshev series.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Output, real X2(NPL), the Chebyshev series for the
%    integral of the function.
%
  xpr = xx(1);
  x2(1) = 0.0;
  n = npl - 1;

  for k = 2 : n
    term = ( xpr - xx(k+1) ) / ( 2.0 * ( k - 1 ) );
    xpr = xx(k);
    x2(k) = term;
  end

  x2(npl) = xpr / ( 2.0 * n );

  return
end

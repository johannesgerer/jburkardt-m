function fx = edcheb ( x, coef, npl )

%*****************************************************************************80
%
%% EDCHEB evaluates the derivative of a Chebyshev series at a point.
%
%  Discussion:
%
%    This routine evaluates the derivative of a Chebyshev series 
%    at a point in [-1,+1].
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
%    Input, real ( kind = 8 ) X, the evaluation point.
%    -1 <= X <= +1.
%
%    Input, real ( kind = 8 ) COEF(NPL), the Chebyshev series.
%
%    Input, integer ( kind = 4 ) NPL, the number of terms in the 
%    Chebyshev series.
%
  xjp2 = 0.0;
  xjpl = 0.0;
  bjp2 = 0.0;
  bjpl = 0.0;
  n = npl - 1;

  for k = 1 : n
    j = npl - k;
    dj = j;
    xj = 2.0 * coef(j+1) * dj + xjp2;
    bj = 2.0 * x * bjpl - bjp2 + xj;
    bf = bjp2;
    bjp2 = bjpl;
    bjpl = bj;
    xjp2 = xjpl;
    xjpl = xj;
  end

  fx = 0.5 * ( bj - bf );

  return
end

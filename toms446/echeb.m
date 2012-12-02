function fx = echeb ( x, coef, npl )

%*****************************************************************************80
%
%% ECHEB evaluates a Chebyshev series at a point.
%
%  Discussion:
%
%  Ê This routine evaluates a Chebyshev series at a point in [-1,+1].
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
%    Input, real X, the evaluation point.
%    -1 <= X <= +1.
%
%    Input, real COEF(NPL), the Chebyshev series.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Output, real FX, the value of the Chebyshev series at X.
%
  br = 0.0;
  brpp = 0.0;

  for k = 1 : npl
    j = npl - k + 1;
    brp2 = brpp;
    brpp = br;
    br = 2.0 * x * brpp - brp2 + coef(j);
  end

  fx = 0.5 * ( br - brp2 );

  return
end

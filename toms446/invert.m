function xnvse = invert ( x, xx, npl, net )

%*****************************************************************************80
%
%% INVERT computes the inverse Chebyshev series.
%
%  Discussion:
%
%    This routine computes the inverse of a Chebyshev series, starting with
%    an initial approximation XX. 
%
%    The routine uses the Euler method and computes all powers EPS^K 
%    up to K=2^(NET+1), where EPS = 1 - X * ( XX inverse ).
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
%    Input, real X(NPL), the Chebyshev series.
%
%    Input, real XX(NPL), an initial approximation for the
%    inverse Chebyshev series.
%
%    Input, integer NPL, the number of terms in the 
%    Chebyshev series.
%
%    Input, integer NET, the number of iterations to take.
%
%    Output, real XNVSE(NPL), the estimated Chebyshev
%    series of the inverse function.
%
  ww = mltply ( x, xx, npl );

  ww(1) = 2.0 - ww(1);

  ww(2:npl) = - ww(2:npl);

  w2 = mltply ( ww, ww, npl );

  ww(1) = 2.0 * ww(1);

  for k = 1 : net

    xnvse = mltply ( ww, w2, npl );

    ww(1:npl) = ww(1:npl) + xnvse(1:npl);

    xnvse = mltply ( w2, w2, npl );

    w2(1:npl) = xnvse(1:npl);

  end

  xnvse = mltply ( ww, xx, npl );

  return
end

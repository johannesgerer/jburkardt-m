function yi = lageven_interp_1d ( nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% LAGEVEN_INTERP_1D evaluates the Lagrange evenly-spaced interpolant.
%
%  Discussion:
%
%    The weight vector WD computed below is only valid if the data points
%    XD are, as expected, evenly spaced in an interval [A,B] with
%    spacing (B-A)/N.  The XD values might be computed by:
%
%      xd(i) = ( ( 2 * nd - 2 * i + 1 ) * a 
%              + (          2 * i - 1 ) * b ) 
%              / ( 2 * nd             )
%
%    for instance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jean-Paul Berrut, Lloyd Trefethen,
%    Barycentric Lagrange Interpolation,
%    SIAM Review,
%    Volume 46, Number 3, September 2004, pages 501-517.
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real YI(NI,1), the interpolated values.
%
  wd = zeros ( nd, 1 );
  sgn = -1.0;
  for j = 1 : nd
    wd(j) = sgn * r8_choose ( nd, j );
    sgn = - sgn;
  end

  numer = zeros ( ni, 1 );
  denom = zeros ( ni, 1 );
  exact = zeros ( ni, 1 );

  for j = 1 : nd
    t = wd(j) ./ ( xi - xd(j) );
    numer = numer + t * yd(j);
    denom = denom + t;
    exact( xi == xd(j) ) = j;
  end

  yi = numer ./ denom;

  j = find ( exact );
  yi(j) = yd(exact(j));

  return
end

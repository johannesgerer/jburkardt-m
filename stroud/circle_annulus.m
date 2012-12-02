function result = circle_annulus ( func, xc, yc, radius1, radius2, nr )

%*****************************************************************************80
%
%% CIRCLE_ANNULUS approximates an integral in a circular annulus.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      RADIUS1**2 <= ( X - XC )**2 + ( Y - YC )**2 <= RADIUS2**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Peirce,
%    Numerical Integration Over the Planar Annulus,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 5, Issue 2, June 1957, pages 66-73.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function of two
%    variables which is to be integrated, of the form:
%      function value = func ( x, y )
%
%    Input, real XC, YC, the center of the circle.
%
%    Input, real RADIUS1, RADIUS2, the radii of the circles.
%
%    Input, integer NR, the order of the rule.  This quantity specifies
%    the number of distinct radii to use.  The number of angles used will
%    be 4*NR, for a total of 4*NR**2 points.
%
%    Output, real RESULT, the approximation to the integral.
%

%
%  Choose radial abscissas and weights.
%
  [ ra, rw ] = legendre_set ( nr );
  a = -1.0E+00;
  b = +1.0E+00;
  c = radius1^2;
  d = radius2^2;
  [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
  ra(1:nr) = sqrt ( ra(1:nr) );
  rw(1:nr) = rw(1:nr) / ( radius2^2 - radius1^2 );
%
%  Set angular abscissas and weights.
%
  nt = 4 * nr;

  tw = 1.0E+00 / nt;
%
%  Approximate the integral.
%
  quad = 0.0E+00;
  for i = 1 : nt
    t = 2.0E+00 * pi * ( i - 1 ) / nt;
    for j = 1 : nr
      x = xc + ra(j) * cos ( t );
      y = yc + ra(j) * sin ( t );
      quad = quad + tw * rw(j) * feval ( func, x, y );
    end
  end

  area = circle_annulus_area_2d ( radius1, radius2 );
  result = quad * area;

  return
end

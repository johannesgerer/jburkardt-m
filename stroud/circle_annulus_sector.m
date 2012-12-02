function result = circle_annulus_sector ( func, xc, yc, radius1, radius2, ...
  theta1, theta2, nr )

%*****************************************************************************80
%
%% CIRCLE_ANNULUS_SECTOR approximates an integral in a circular annulus sector.
%
%  Discussion:
%
%    A circular annulus sector comprises the area between two concentric
%    circles and two concentric rays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
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
%    Input, real THETA1, THETA2, the angles defining the sector.
%    The sector is measured from THETA1 to THETA2.
%
%    Input, integer NR, the order of the rule.  This quantity specifies
%    the number of distinct radii to use.  The number of angles used will
%    be 4*NR, for a total of 4*NR**2 points.
%
%    Output, real RESULT, the approximation to the integral.
%

%
%  Set the radial abscissas and weights.
%
  [ ra, rw ] = legendre_set ( nr );
  a = -1.0E+00;
  b = +1.0E+00;
  c = radius1 * radius1;
  d = radius2 * radius2;
  [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
  ra(1:nr) = sqrt ( ra(1:nr) );
  rw(1:nr) = rw(1:nr) / ( radius2^2 - radius1^2 );
%
%  Pick angles evenly spaced between THETA1 and THETA2, but do not
%  include the endpoints, and use a half interval for the first and last.
%
  nt = 4 * nr;

  ta = tvec_even_bracket3 ( nt, theta1, theta2 );
  tw(1:nt) = 1.0E+00 / nt;
%
%  Approximate the integral.
%
  quad = 0.0E+00;
  for i = 1 : nt
    for j = 1 : nr
      x = xc + ra(j) * cos ( ta(i) );
      y = yc + ra(j) * sin ( ta(i) );
      quad = quad + tw(i) * rw(j) * feval ( func, x, y );
    end
  end

  area = circle_annulus_sector_area_2d ( radius1, radius2, theta1, theta2 );
  result = quad * area;

  return
end

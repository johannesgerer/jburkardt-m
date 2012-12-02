function result = circle_sector ( func, xc, yc, radius, theta1, theta2, nr )

%*****************************************************************************80
%
%% CIRCLE_SECTOR approximates an integral in a circular sector.
%
%  Discussion:
%
%    A sector is contained within a circular arc and the lines joining each
%    endpoint of the arc to the center of the circle.
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
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function of two
%    variables which is to be integrated, of the form:
%      function value = func ( x, y )
%
%    Input, real XC, YC, the center of the circle.
%
%    Input, real RADIUS, the radius of the circle.
%
%    Input, real THETA1, THETA2, the angles defining the sector.
%    The sector is measured from THETA1 to THETA2.
%
%    Input, integer NR, the number of radial values used in the approximation
%    of the integral.  NR must be at least 1.  Higher values improve the
%    accuracy of the integration, at the cost of more function evaluations.
%
%    Output, real RESULT, the approximation to the integral.
%

%
%  Set the radial abscissas and weights.
%
  [ ra, rw ] = legendre_set ( nr );
  a = -1.0E+00;
  b = +1.0E+00;
  c =  0.0E+00;
  d =  radius * radius;
  [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
  ra(1:nr) = sqrt ( ra(1:nr) );
  rw(1:nr) = rw(1:nr) / ( radius * radius );
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

  for i = 1 : nr
    for j = 1 : nt
      x = xc + ra(i) * cos ( ta(j) );
      y = yc + ra(i) * sin ( ta(j) );
      quad = quad + rw(i) * tw(j) * feval ( func, x, y );
    end
  end

  area = circle_sector_area_2d ( radius, theta1, theta2 );
  result = quad * area;

  return
end

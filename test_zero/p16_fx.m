function fx = p16_fx ( x )

%*****************************************************************************80
%
%% P16_FX evaluates Kepler's Equation.
%
%  Discussion:
%
%    This is Kepler's equation.  The equation has the form:
%
%      X = M + E * sin ( X )
%
%    X represents the eccentric anomaly of a planet, the angle between the
%    perihelion (the point on the orbit nearest to the sun)
%    through the sun to the center of the ellipse, and the
%    line from the center of the ellipse to the planet.
%
%    There are two parameters:
%
%    E is the eccentricity of the orbit, which should be between 0 and 1.0;
%
%    M is the angle from the perihelion made by a fictitious planet traveling
%    on a circular orbit centered at the sun, and traveling at a constant
%    angular velocity equal to the average angular velocity of the true planet.
%    M is usually between 0 and 180 degrees, but can have any value.
%
%    For convenience, X and M are measured in degrees.
%
%    Sample results:
%
%    E        M      X
%    -----  ---  ----------
%    0.100    5    5.554589
%    0.200    5    6.246908
%    0.300    5    7.134960
%    0.400    5    8.313903
%    0.500    5    9.950063
%    0.600    5   12.356653
%    0.700    5   16.167990
%    0.800    5   22.656579
%    0.900    5   33.344447
%    0.990    5   45.361023
%    0.990    1   24.725822
%    0.990   33   89.722155
%    0.750   70  110.302
%    0.990    2   32.361007
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Colwell,
%    Solving Kepler's Equation Over Three Centuries,
%    Willmann-Bell, 1993
%
%    Jean Meeus,
%    Astronomical Algorithms,
%    Willman-Bell, Inc, 1991,
%    QB51.3.E43M42
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  e = 0.8;
  m = 5.0;

  fx = pi * ( x - m ) / 180.0 - e * sin ( pi * x / 180.0 );

  return
end

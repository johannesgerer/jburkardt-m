function [ x1, x2, seed ] = circle_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% CIRCLE_SAMPLE samples points from a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the circle.
%    The circle is centered at (A,B) and has radius C.
%    0.0 < C.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X1, X2, a sampled point of the circle.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ radius_frac, seed ] = r8_uniform_01 ( seed );
  radius_frac = sqrt ( radius_frac );

  [ angle, seed ] = r8_uniform_01 ( seed );
  angle = 2.0D+00 * pi * angle;

  x1 = a + c * radius_frac * cos ( angle );
  x2 = b + c * radius_frac * sin ( angle );

  return
end

function [ x, seed ] = halton_in_circle01_map ( dim_num, n, seed )

%*****************************************************************************80
%
%% HALTON_IN_CIRCLE01_MAP maps Halton points into the unit circle.
%
%  Discussion:
%
%    The unit circle has center at the origin, and radius 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space (which is 2).
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  step = seed;
  seed_vec(1) = 0;
  leap(1) = 1;
  base(1) = 2;

  r = i4_to_halton_sequence ( 1, n, step, seed_vec, leap, base );
  r(1:n) = sqrt ( r(1:n) );

  step = seed;
  seed_vec(1) = 0;
  leap(1) = 1;
  base(1) = 3;

  t = i4_to_halton_sequence ( 1, n, step, seed_vec, leap, base );
  t(1:n) = 2.0 * pi * t(1:n);

  x(1,1:n) = r(1:n) .* cos ( t(1:n) );
  x(2,1:n) = r(1:n) .* sin ( t(1:n) );

  seed = seed + n;

  return
end

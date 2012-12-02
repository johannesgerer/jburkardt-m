function [ x, seed ] = uniform_in_circle01_map ( n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_CIRCLE01_MAP maps uniform points into the unit circle.
%
%  Discussion:
%
%    The unit circle has center at the origin, and radius 1.
%
%    This routine is valid for spatial dimension DIM_NUM = 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  [ r, seed ] = r8vec_uniform_01 ( n, seed );
  r(1:n) = sqrt ( r(1:n) );

  [ t, seed ] = r8vec_uniform_01 ( n, seed );
  t(1:n) = 2.0 * pi * t(1:n);

  x(1,1:n) = r(1:n) .* cos ( t(1:n) );
  x(2,1:n) = r(1:n) .* sin ( t(1:n) );

  return
end

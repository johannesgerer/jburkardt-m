function [ x, seed ] = uniform_in_sector_map ( r1, r2, t1, t2, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_SECTOR_MAP maps uniform points into a circular sector.
%
%  Discussion:
%
%    The sector lies between circles with center at 0 and radius R1 and R2,
%    and between rays from the center at the angles T1 and T2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Shirley,
%    Nonuniform Random Point Sets Via Warping,
%    Graphics Gems, Volume III,
%    edited by David Kirk,
%    AP Professional, 1992, 
%    ISBN: 0122861663,
%    LC: T385.G6973.
%
%  Parameters:
%
%    Input, real R1, R2, the two radii.
%
%    Input, real T1, T2, the two angles, which should
%    be measured in radians, with T1 < T2.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(2,N), the points.
%
  [ u, seed ] = r8vec_uniform_01 ( n, seed );
  [ v, seed ] = r8vec_uniform_01 ( n, seed );

  t(1:n) =        ( 1.0 - u(1:n) ) * t1    + u(1:n) * t2;
  r(1:n) = sqrt ( ( 1.0 - v(1:n) ) * r1 * r1 + v(1:n) * r2 * r2 );

  x(1,1:n) = r(1:n) .* cos ( t(1:n) );
  x(2,1:n) = r(1:n) .* sin ( t(1:n) );

  return
end

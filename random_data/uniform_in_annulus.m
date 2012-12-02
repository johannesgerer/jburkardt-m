function [ p, seed ] = uniform_in_annulus ( pc, r1, r2, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_ANNULUS samples a circular annulus.
%
%  Discussion:
%
%    A circular annulus with center PC, inner radius R1 and
%    outer radius R2, is the set of points P so that
%
%      R1**2 <= (P(1)-PC(1))**2 + (P(2)-PC(2))**2 <= R2**2
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
%    Input, real PC(2), the center.
%
%    Input, real R1, R2, the inner and outer radii.
%
%    Input, integer N, the number of points to generate.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real P(2,N), sample points.
%
  dim_num = 2;

  [ u, seed ] = r8vec_uniform_01 ( n, seed );

  theta(1:n) = u(1:n) * 2.0 * pi;

  [ v, seed ] = r8vec_uniform_01 ( n, seed );

  r(1:n) = sqrt ( ( 1.0 - v(1:n) ) * r1 * r1 ...
       +                  v(1:n)   * r2 * r2 );

  p(1,1:n) = pc(1) + r(1:n) .* cos ( theta(1:n) );
  p(2,1:n) = pc(2) + r(1:n) .* sin ( theta(1:n) );

  return
end

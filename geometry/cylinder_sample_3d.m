function [ p, seed ] = cylinder_sample_3d ( p1, p2, r, n, seed )

%*****************************************************************************80
%
%% CYLINDER_SAMPLE_3D samples a cylinder in 3D.
%
%  Discussion:
%
%    We are sampling the interior of a right finite cylinder in 3D.
%
%    The interior of a (right) (finite) cylinder in 3D is defined by an axis,
%    which is the line segment from point P1 to P2, and a radius R.  The points
%    on or inside the cylinder are:
%    * points whose distance from the line through P1 and P2 is less than
%      or equal to R, and whose nearest point on the line through P1 and P2
%      lies (nonstrictly) between P1 and P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), the first and last points
%    on the axis line of the cylinder.
%
%    Input, real R, the radius of the cylinder.
%
%    Input, integer N, the number of sample points to compute.
%
%    Input, integer SEED, the random number seed.
%
%    Input, real P(3,N), the sample points.
%
%    Output, integer SEED, the random number seed.
%

%
%  Compute the axis vector.
%
  axis(1:3,1) = p2(1:3,1) - p1(1:3,1);
  axis_length = r8vec_norm ( 3, axis );
  axis(1:3,1) = axis(1:3,1) / axis_length;
%
%  Compute vectors V2 and V3 that form an orthogonal triple with AXIS.
%
  [ v2, v3 ] = plane_normal_basis_3d ( p1, axis );
%
%  Assemble the randomized information.
%
  [ radius(1,1:n), seed ] = r8vec_uniform_01 ( n, seed );
  radius(1,1:n) = r * sqrt ( radius(1,1:n) );

  [ theta(1,1:n), seed ] = r8vec_uniform_01 ( n, seed );
  theta(1,1:n) = 2.0 * pi * theta(1,1:n);

  [ z(1,1:n), seed ] = r8vec_uniform_01 ( n, seed );
  z(1,1:n) = axis_length * z(1,1:n);

  for i = 1 : 3

    p(i,1:n) = p1(i,1) ...
              + axis(i,1) * z(1,1:n) ...
              + v2(i,1) * radius(1,1:n) .* cos ( theta(1,1:n) ) ...
              + v3(i,1) * radius(1,1:n) .* sin ( theta(1,1:n) );

  end

  return
end

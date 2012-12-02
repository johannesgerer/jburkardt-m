function [ tp, seed ] = uniform_on_sphere01_patch_tp ( n, phi1, phi2, ...
  theta1, theta2, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_SPHERE01_PATCH_TP maps uniform points to a spherical TP patch.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%    This routine is valid for spatial dimension DIM_NUM = 3.
%
%    A spherical TP patch on the surface of the unit sphere contains those 
%    points with radius R = 1 and angles (THETA,PHI) such that
%
%      0.0 <= THETA1 <= THETA <= THETA2 <= 2 * PI
%      0.0 <= PHI1   <= PHI   <= PHI2   <=     PI
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 August 2010
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
%    Input, integer N, the number of points.
%
%    Input, real PHI1, PHI2, the latitudinal angle range.
%
%    Input, real THETA1, THETA2, the longitudinal angle range.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real TP(2,N), the points.
%
  [ tp, seed ] = r8mat_uniform_01 ( 2, n, seed );

  tp(1,1:n) = ( 1.0 - tp(1,1:n) ) * theta1 ...
              +       tp(1,1:n)   * theta2;

  tp(2,1:n) = acos ( ( 1.0 - tp(2,1:n) ) * cos ( phi1 ) ...
                   +         tp(2,1:n)   * cos ( phi2 ) );

  return
end

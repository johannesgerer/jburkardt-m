function [ r, center ] = sphere_dia2imp_3d ( p1, p2 )

%*****************************************************************************80
%
%% SPHERE_DIA2IMP_3D converts a diameter to an implicit sphere in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 + ( Z - CENTER(3) )**2 = R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), are two points which form a diameter
%    of the sphere.
%
%    Output, real R, the computed radius of the sphere.
%
%    Output, real CENTER(3), the computed center of the sphere.
%
  dim_num = 3;

  r = 0.5 * sqrt ( sum ( ( p2(1:dim_num) - p1(1:dim_num) ).^2 ) );

  center(1:dim_num) = 0.5 * ( p1(1:dim_num) + p2(1:dim_num) );

  return
end

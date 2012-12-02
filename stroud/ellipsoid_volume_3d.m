function value = ellipsoid_volume_3d ( r1, r2, r3 )

%*****************************************************************************80
%
%% ELLIPSOID_VOLUME_3D returns the volume of an ellipsoid in 3d.
%
%  Integration region:
%
%    Points (X,Y,Z) such that
%
%      ( ( X - XC ) / R1 )**2
%    + ( ( Y - YC ) / R2 )**2
%    + ( ( Z - ZC ) / R3 )**2 <= 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, R3, the semi-axes of the ellipsoid.
%
%    Output, real VALUE, the volume of the ellipsoid.
%
  value = ( 4.0E+00 / 3.0E+00 ) * pi * r1 * r2 * r3;

  return
end

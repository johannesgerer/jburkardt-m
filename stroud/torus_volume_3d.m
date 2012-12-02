function value = torus_volume_3d ( r1, r2 )

%*****************************************************************************80
%
%% TORUS_VOLUME_3D returns the volume of a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X**2 + Y**2 ) - R1 )**2 + Z**2 = R2**2.
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
%    Input, real R1, R2, the two radii that define the torus.
%
%    Output, real TORUS_VOLUME_3D, the volume of the torus.
%
  value = 2.0 * pi * pi * r1 * r2 * r2;

  return
end

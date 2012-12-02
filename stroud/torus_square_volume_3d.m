function value = torus_square_volume_3d ( r1, r2 )

%*****************************************************************************80
%
%% TORUS_SQUARE_VOLUME_3D returns the volume of a square torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      R1 - R2 <= SQRT ( X**2 + Y**2 ) <= R1 + R2,
%      -R2 <= Z <= R2.
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
%    Output, real TORUS_SQUARE_VOLUME_3D, the volume of the torus.
%
  value = 8.0E+00 * pi * r1 * r2 * r2;

  return
end

function value = torus_area_3d ( r1, r2 )

%*****************************************************************************80
%
%% TORUS_AREA_3D returns the area of a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X*X + Y*Y ) - R1 )**2 + Z*Z = R2*R2.
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
%    Output, real TORUS_AREA_3D, the area of the torus.
%
  value = 4.0E+00 * pi * pi * r1 * r2;

  return
end

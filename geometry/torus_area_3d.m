function area = torus_area_3d ( r1, r2 )

%*****************************************************************************80
%
%% TORUS_AREA_3D returns the area of a torus in 3D.
%
%  Discussion:
%
%    A torus with radii R1 and R2 is the set of points (X,Y,Z)
%    satisfying:
%
%    ( sqrt ( X**2 + Y**2 ) - R1 )**2 + Z**2 <= R2**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the two radii that define the torus.
%
%    Output, real AREA, the area of the torus.
%
  area = 4.0 * pi * pi * r1 * r2;

  return
end

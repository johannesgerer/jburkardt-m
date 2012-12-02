function volume = torus_volume_3d ( r1, r2 )

%*****************************************************************************80
%
%% TORUS_VOLUME_3D computes the volume of a torus in 3D.
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
%    Input, real R1, R2, the "inner" and "outer" radii of the
%    torus.
%
%    Output, real VOLUME, the volume of the torus.
%
  volume = 2.0 * pi * pi * r1 * r2 * r2;

  return
end

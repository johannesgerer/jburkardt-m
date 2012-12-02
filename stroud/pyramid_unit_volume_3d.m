function value = pyramid_unit_volume_3d ( )

%*****************************************************************************80
%
%% PYRAMID_UNIT_VOLUME_3D returns the volume of a unit pyramid in 3D.
%
%  Integration region:
%
%    - ( 1 - Z ) <= X <= 1 - Z
%    - ( 1 - Z ) <= Y <= 1 - Z
%              0 <= Z <= 1.
%
%  Discussion:
%
%    A pyramid with square base can be regarded as the upper half of a
%    3D octahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the volume of the pyramid.
%
  value = 4.0 / 3.0;

  return
end

function value = pyra_unit_volume ( )

%*****************************************************************************80
%
%% PYRA_UNIT_VOLUME_3D returns the volume of a unit pyramid.
%
%  Discussion:
%
%    A pyramid with square base can be regarded as the upper half of a
%    3D octahedron.
%
%    The integration region:
%
%      - ( 1 - Z ) <= X <= 1 - Z
%      - ( 1 - Z ) <= Y <= 1 - Z
%                0 <= Z <= 1.
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

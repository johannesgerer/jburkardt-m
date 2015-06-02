function value = tetrahedron_unit_volume ( )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_VOLUME returns the volume of the unit tetrahedron.
%
%  Discussion:
%
%    The integration region is:
%
%      0 <= X,
%      0 <= Y,
%      0 <= Z,
%      X + Y + Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the volume.
%
  value = 1.0 / 6.0;

  return
end

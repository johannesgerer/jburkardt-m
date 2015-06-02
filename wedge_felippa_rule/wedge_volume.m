function value = wedge_volume ( )

%*****************************************************************************80
%
%% WEDGE_VOLUME: volume of the unit wedge in 3D.
%
%  Discussion:
%
%    The integration region is defined as:
%
%      0 <= X
%      0 <= Y
%      X + Y <= 1
%      -1 <= Z <= 1.
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
%    Output, real WEDGE_VOLUME, the volume.
%
  value = 1.0;

  return
end

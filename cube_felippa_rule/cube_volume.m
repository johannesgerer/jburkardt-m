function value = cube_volume ( a, b )

%*****************************************************************************80
%
%% CUBE_VOLUME: volume of a cube in 3D.
%
%  Discussion:
%
%    The integration region is:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%      A(3) <= Z <= B(3)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), B(3), the lower and upper limits.
%
%    Output, real VALUE, the volume.
%
  value = prod ( b(1:3) - a(1:3) );

  return
end

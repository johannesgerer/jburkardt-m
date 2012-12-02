function [ x, y, z ] = r8_unswap3 ( x, y, z )

%*****************************************************************************80
%
%% R8_UNSWAP3 unswaps three R8's.
%
%  Example:
%
%    Input:
%
%      X = 2, Y = 3, Z = 1
%
%    Output:
%
%      X = 1, Y = 2, Z = 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, Z, three values to be swapped.
%
%    Output, real X, Y, Z, the swapped values.
%
  w = z;
  z = y;
  y = x;
  x = w;

  return
end

function [ x, y, z ] = r8_swap3 ( x, y, z )

%*****************************************************************************80
%
%% R8_SWAP3 swaps three R8's.
%
%  Example:
%
%    Input:
%
%      X = 1, Y = 2, Z = 3
%
%    Output:
%
%      X = 2, Y = 3, Z = 1
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
%    Output, real X, Y, Z, three values to be swapped.
%
  w = x;
  x = y;
  y = z;
  z = w;

  return
end

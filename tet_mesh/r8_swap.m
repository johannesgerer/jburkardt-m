function [ x, y ] = r8_swap ( x, y )

%*****************************************************************************80
%
%% R8_SWAP swaps two R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, two values to interchange.
%
%    Output, real X, Y, the interchanged values.
%
  z = y;
  y = x;
  x = z;

  return
end

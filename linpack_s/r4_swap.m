function [ x, y ] = r4_swap ( x, y )

%*****************************************************************************80
%
%% R4_SWAP swaps two R4's.
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

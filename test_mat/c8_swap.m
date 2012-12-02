function [ x, y ] = c8_swap ( x, y )

%*****************************************************************************80
%
%% C8_SWAP swaps two C8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, Y, two values to interchange.
%
%    Output, complex X, Y, the interchanged values.
%
  temp = x;
  x = y;
  y = temp;

  return
end

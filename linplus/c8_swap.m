function [ x, y ] = c8_swap ( x, y )

%*****************************************************************************80
%
%% C8_SWAP swaps two complex values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2004
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

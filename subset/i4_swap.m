function [ x, y ] = i4_swap ( x, y )

%*****************************************************************************80
%
%% I4_SWAP swaps two integer values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, Y, two values to interchange.
%
%    Output, integer X, y, the interchanged values.
%
  z = x;
  x = y;
  y = z;

  return
end

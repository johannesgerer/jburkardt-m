function [ c1, c2 ] = ch_swap ( c1, c2 )

%*****************************************************************************80
%
%% CH_SWAP swaps two characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C1, C2, the values to swap.
%
%    Output, character C1, C2, the swapped values.
%
  c3 = c1;
  c1 = c2;
  c2 = c3;

  return
end

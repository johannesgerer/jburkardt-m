function [ i, j, k ] = i4_swap3 ( i, j, k )

%*****************************************************************************80
%
%% I4_SWAP3 swaps three integer values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, K, the values to swap.
%
%    Output, integer I, J, K, the swapped values.
%
  l = i;
  i = j;
  j = k;
  k = l;

  return
end

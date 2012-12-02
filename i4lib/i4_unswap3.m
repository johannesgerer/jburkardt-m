function [ i, j, k ] = i4_unswap3 ( i, j, k )

%*****************************************************************************80
%
%% I4_UNSWAP3 unswaps three integer values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, K, the values to be unswapped.
%
%    Output, integer I, J, K, the unswapped values.
%
  l = k;
  k = j;
  j = i;
  i = l;

  return
end

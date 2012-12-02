function [ a1, a2 ] = i4vec_swap ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC_SWAP swaps the entries of two I4VEC's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the arrays.
%
%    Input, integer A1(N), A2(N), the vectors to swap.
%
%    Output, integer A1(N), A2(N), the swapped vectors.
%
  a3(1:n) = a1(1:n);
  a1(1:n) = a2(1:n);
  a2(1:n) = a3(1:n);

  return
end

function [ a1, a2 ] = r8vec_swap ( n, a1, a2 )

%*****************************************************************************80
%
%% R8VEC_SWAP swaps the entries of two R8VEC's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the arrays.
%
%    Input, real A1(N), A2(N), the vectors to swap.
%
%    Output, real A1(N), A2(N), the swapped vectors.
%
  a3(1:n) = a1(1:n);
  a1(1:n) = a2(1:n);
  a2(1:n) = a3(1:n);

  return
end

function b = i4vec_reverse ( n, a )

%*****************************************************************************80
%
%% I4VEC_REVERSE reverses the elements of an integer vector.
%
%  Example:
%
%    Input:
%
%      N = 5,
%      A = ( 11, 12, 13, 14, 15 ).
%
%    Output:
%
%      A = ( 15, 14, 13, 12, 11 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), the array to be reversed.
%
%    Output, integer B(N), the reversed array.
%
  b(1:n) = a(n:-1:1);

  return
end

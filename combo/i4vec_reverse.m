function a = i4vec_reverse ( n, a )

%*****************************************************************************80
%
%% I4VEC_REVERSE reverses the elements of an I4VEC.
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
%    17 April 2005
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
%    Output, integer A(N), the reversed array.
%
  b(1:n) = a(n:-1:1);
  a(1:n) = b(1:n);

  return
end

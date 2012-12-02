function value = i4vec_eq ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC_EQ is true if two I4VEC's are equal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vectors.
%
%    Input, integer A1(N), A2(N), two vectors to compare.
%
%    Output, logical VALUE, is TRUE if every pair of elements A1(I)
%    and A2(I) are equal, and FALSE otherwise.
%
  value = all ( a1(1:n) == a2(1:n) );

  return
end

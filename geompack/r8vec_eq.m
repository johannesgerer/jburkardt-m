function value = r8vec_eq ( n, a1, a2 )

%*****************************************************************************80
%
%% R8VEC_EQ is true if two R8VEC's are equal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vectors.
%
%    Input, real A1(N), A2(N), two vectors to compare.
%
%    Output, logical VALUE, is TRUE if every pair of elements A1(I)
%    and A2(I) are equal, and FALSE otherwise.
%
  value = all ( a1(1:n) == a2(1:n) );

  return
end

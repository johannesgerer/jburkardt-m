function median = r8vec_median ( n, a )

%*****************************************************************************80
%
%% R8VEC_MEDIAN returns the median of an unsorted R8VEC.
%
%  Discussion:
%
%    Hoare's algorithm is used.  The values of the vector are
%    rearranged by this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), the array to search.
%
%    Output, real MEDIAN, the value of the median of A.
%
  k = round ( ( n + 1 ) / 2 );

  median = r8vec_frac ( n, a, k );

  return
end

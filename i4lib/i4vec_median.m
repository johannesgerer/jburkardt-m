function median = i4vec_median ( n, a )

%*****************************************************************************80
%
%% I4VEC_MEDIAN returns the median of an unsorted I4VEC.
%
%  Discussion:
%
%    Hoare's algorithm is used.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array to search.
%
%    Output, integer MEDIAN, the value of the median of A.
%
  k = floor ( ( n + 1 ) / 2 );

  median = i4vec_frac ( n, a, k );

  return
end

function isgn = i4vec_compare ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC_COMPARE compares two I4VEC's.
%
%  Discussion:
%
%    The lexicographic ordering is used.
%
%  Example:
%
%    Input:
%
%      A1 = ( 2, 6, 2 )
%      A2 = ( 2, 8, 12 )
%
%    Output:
%
%      ISGN = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vectors.
%
%    Input, integer A1(N), A2(N), the vectors to be compared.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, A1 < A2,
%     0, A1 = A2,
%    +1, A2 < A1.
%
  isgn = 0;

  k = 1;

  while ( k <= n )

    if ( a1(k) < a2(k) )
      isgn = -1;
      return
    elseif ( a2(k) < a1(k) )
      isgn = + 1;
      return
    end

    k = k + 1;

  end

  return
end

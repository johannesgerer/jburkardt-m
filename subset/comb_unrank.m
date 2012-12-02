function a = comb_unrank ( m, n, rank )

%*****************************************************************************80
%
%% COMB_UNRANK returns the RANK-th combination of N things out of M.
%
%  Discussion:
%
%    Going from a rank to a thing is called "unranking".
%
%    The combinations are ordered lexically.
%
%    Lexical order can be illustrated for the general case of N and M as
%    follows:
%
%    1:       1,     2,     3,     ..., N-2, N-1, N
%    2:       1,     2,     3,     ..., N-2, N-1, N+1
%    3:       1,     2,     3,     ..., N-2, N-1, N+2
%    ...
%    M-N+1:   1,     2,     3,     ..., N-2, N-1, M
%    M-N+2:   1,     2,     3,     ..., N-2, N,   N+1
%    M-N+3:   1,     2,     3,     ..., N-2, N,   N+2
%    ...
%    LAST-2:  M-N,   M-N+1, M-N+3, ..., M-2, M-1, M
%    LAST-1:  M-N,   M-N+2, M-N+3, ..., M-2, M-1, M
%    LAST:    M-N+1, M-N+2, M-N+3, ..., M-2, M-1, M
%
%    There are a total of M!/(N!*(M-N)!) combinations of M
%    things taken N at a time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    B P Buckles, M Lybanon,
%    Algorithm 515,
%    Generation of a Vector from the Lexicographical Index,
%    ACM Transactions on Mathematical Software,
%    Volume 3, Number 2, pages 180-182, June 1977.
%
%  Parameters:
%
%    Input, integer M, the size of the set.
%
%    Input, integer N, the number of things in the combination.
%    N must be greater than 0, and no greater than M.
%
%    Input, integer RANK, the lexicographical rank of the combination
%    sought.  RANK must be at least 1, and no greater than M!/(N!*(M-N)!).
%
%    Output, integer A(N), the combination.
%

%
%  Initialize the lower bound index.
%
  k = 0;
%
%  Select elements in ascending order.
%
  for i = 1 : n - 1
%
%  Set the lower bound element number for next element value.
%
    a(i) = 0;

    if ( 1 < i )
      a(i) = a(i-1);
    end
%
%  Check each element value.
%
    while ( 1 )

      a(i) = a(i) + 1;
      j = i4_choose ( m-a(i), n-i );
      k = k + j;

      if ( rank <= k )
        break;
      end

    end

    k = k - j;

  end

  a(n) = a(n-1) + rank - k;

  return
end

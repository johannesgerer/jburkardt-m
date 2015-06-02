function rank = mono_rank_grlex ( m, x )

%*****************************************************************************80
%
%% MONO_RANK_GRLEX returns the grlex rank of a monomial in M dimensions.
%
%  Discussion:
%
%    The graded lexicographic ordering is used, over all D dimensional
%    vectors with sum 0, then 1, then 2, ...
%
%    For example, if M = 3, the monomials will be generated in
%    a sequence that begins
%
%    #  X(1)  X(2)  X(3)     SUM
%      +------------------------
%    1 |  0     0     0        0
%      |
%    2 |  0     0     1        1
%    3 |  0     1     0        1
%    4 |  1     0     0        1
%      |
%    5 |  0     0     2        2
%    6 |  0     1     1        2
%    7 |  0     2     0        2
%    8 |  1     0     1        2
%    9 |  1     1     0        2
%   10 |  2     0     0        2
%      |
%   11 |  0     0     3        3
%   12 |  0     1     2        3
%   13 |  0     2     1        3
%   14 |  0     3     0        3
%   15 |  1     0     2        3
%   16 |  1     1     1        3
%   17 |  1     2     0        3
%   18 |  2     0     1        3
%   19 |  2     1     0        3
%   20 |  3     0     0        3
%      |
%   21 |  0     0     4        4
%   22 |  0     1     3        4
%   23 |  0     2     2        4
%   24 |  0     3     1        4
%   25 |  0     4     0        4
%   26 |  1     0     3        4
%   27 |  1     1     2        4
%   28 |  1     2     1        4
%   29 |  1     3     0        4
%   30 |  2     0     2        4
%   31 |  2     1     1        4
%   32 |  2     2     0        4
%   33 |  3     0     1        4
%   34 |  3     1     0        4
%   35 |  4     0     0        4
%
%    The monomial (1,0,3) has rank 26, and we could determine this by the call
%      rank = mono_rank_grlex ( 3, [ 1, 0, 3 ] );
%    The monomial (0,1,0) has rank 3, and we could determine this by the call
%      rank = mono_rank_grlex ( 3, [ 0, 1, 0 ] );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer X(M), the monomial.
%
%    Output, integer RANK, the rank of the monomial.
%

%
%  Ensure that 1 <= M.
%
  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_RANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  M < 1\n' );
    error ( 'MONO_RANK_GRLEX - Fatal error!' );
  end
%
%  Ensure that 0 <= X(I).
%
  for i = 1 : m
    if ( x(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MONO_RANK_GRLEX - Fatal error!' );
      fprintf ( 1, '  X(I) < 0\n' );
      error ( 'MONO_RANK_GRLEX - Fatal error!' );
    end
  end
%
%  NM = sum ( X )
%
  nm = sum ( x(1:m) );
%
%  Convert to KSUBSET format.
%
  ns = nm + m - 1;
  ks = m - 1;
  xs = cumsum ( x(1:m-1) + 1 );
%
%  Compute the rank.
%
  rank = 1;

  for i = 1 : ks

    if ( i == 1 )
      tim1 = 0;
    else
      tim1 = xs(i-1);
    end

    if ( tim1 + 1 <= xs(i) - 1 )
      for j = tim1 + 1 : xs(i) - 1
        rank = rank + i4_choose ( ns - j, ks - i );
      end
    end

  end

  for n = 0 : nm - 1
    rank = rank + i4_choose ( n + m - 1, n );
  end

  return
end

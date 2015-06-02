function rank = comp_rank_grlex ( kc, xc )

%*****************************************************************************80
%
%% COMP_RANK_GRLEX computes the graded lexicographic rank of a composition.
%
%  Discussion:
%
%    The graded lexicographic ordering is used, over all KC-compositions
%    for NC = 0, 1, 2, ...
%
%    For example, if KC = 3, the ranking begins:
%
%    Rank  Sum    1  2  3
%    ----  ---   -- -- --
%       1    0    0  0  0
%
%       2    1    0  0  1
%       3    1    0  1  0
%       4    1    1  0  1
%
%       5    2    0  0  2
%       6    2    0  1  1
%       7    2    0  2  0
%       8    2    1  0  1
%       9    2    1  1  0
%      10    2    2  0  0
%
%      11    3    0  0  3
%      12    3    0  1  2
%      13    3    0  2  1
%      14    3    0  3  0
%      15    3    1  0  2
%      16    3    1  1  1
%      17    3    1  2  0
%      18    3    2  0  1
%      19    3    2  1  0
%      20    3    3  0  0
%
%      21    4    0  0  4
%      ..   ..   .. .. ..
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer KC, the number of parts in the composition.
%    1 <= KC.
%
%    Input, integer XC(KC), the composition.
%    For each 1 <= I <= KC, we have 0 <= XC(I).
%
%    Output, integer RANK, the rank of the composition.
%

%
%  Ensure that 1 <= KC.
%
  if ( kc < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_RANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  KC < 1\n' );
    error ( 'COMP_RANK_GRLEX - Fatal error!' );
  end
%
%  Ensure that 0 <= XC(I).
%
  for i = 1 : kc
    if ( xc(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'COMP_RANK_GRLEX - Fatal error!' );
      fprintf ( 1, '  XC(I) < 0\n' );
      error ( 'COMP_RANK_GRLEX - Fatal error!' );
    end
  end
%
%  NC = sum ( XC )
%
  nc = sum ( xc(1:kc) );
%
%  Convert to KSUBSET format.
%
  ns = nc + kc - 1;
  ks = kc - 1;
  xs = cumsum ( xc(1:kc-1) + 1 );
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

  for n = 0 : nc - 1
    rank = rank + i4_choose ( n + kc - 1, n );
  end

  return
end


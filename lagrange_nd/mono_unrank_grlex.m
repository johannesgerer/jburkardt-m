function x = mono_unrank_grlex ( d, rank )

%*****************************************************************************80
%
%% MONO_UNRANK_GRLEX computes the composition of given grlex rank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the dimension.
%    1 <= D.
%
%    Input, integer RANK, the rank of the composition.
%    1 <= RANK.
%
%    Output, integer X(D), the composition of the given rank.
%    For each I, 0 <= X(I) <= NM, and 
%    sum ( 1 <= I <= D ) X(I) = NM.
%

%
%  Ensure that 1 <= D.
%
  if ( d < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_UNRANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  D < 1\n' );
    error ( 'MONO_UNRANK_GRLEX - Fatal error!' );
  end
%
%  Ensure that 1 <= RANK.
%
  if ( rank < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_UNRANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  RANK < 1\n' );
    error ( 'MONO_UNRANK_GRLEX - Fatal error!' );
  end
%
%  Special action if D = 1.
%
  if ( d == 1 )
    x(1) = rank - 1;
    return
  end
%
%  Determine the appropriate value of NM.
%  Do this by adding up the number of compositions of sum 0, 1, 2, 
%  ..., without exceeding RANK.  Moreover, RANK - this sum essentially
%  gives you the rank of the composition within the set of compositions
%  of sum NM.  And that's the number you need in order to do the
%  unranking.
%
  rank1 = 1;
  nm = -1;
  while ( 1 ) 
    nm = nm + 1;
    r = i4_choose ( nm + d - 1, nm );
    if ( rank < rank1 + r )
      break
    end
    rank1 = rank1 + r;
  end

  rank2 = rank - rank1;
%
%  Convert to KSUBSET format.
%  Apology: an unranking algorithm was available for KSUBSETS,
%  but not immediately for compositions.  One day we will come back
%  and simplify all this.
%
  ks = d - 1;
  ns = nm + d - 1;

  nksub = i4_choose ( ns, ks );

  xs = zeros ( ks, 1 );
  j = 1;

  for i = 1 : ks

    r = i4_choose ( ns - j, ks - i );

    while ( r <= rank2 && 0 < r )
      rank2 = rank2 - r;
      j = j + 1;
      r = i4_choose ( ns - j, ks - i );
    end

    xs(i) = j;
    j = j + 1;

  end
%
%  Convert from KSUBSET format to COMP format.
%
  x = zeros ( d, 1 );
  x(1) = xs(1) - 1;
  for i = 2 : d - 1
    x(i) = xs(i) - xs(i-1) - 1;
  end
  x(d) = ns - xs(ks);

  return
end


function xc = comp_unrank_grlex ( kc, rank )

%*****************************************************************************80
%
%% COMP_UNRANK_GRLEX computes the composition of given grlex rank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer KC, the number of parts of the composition.
%    1 <= KC.
%
%    Input, integer RANK, the rank of the composition.
%    1 <= RANK.
%
%    Output, integer XC(KC), the composition of the given rank.
%    For each I, 0 <= XC(I) <= NC, and 
%    sum ( 1 <= I <= KC ) XC(I) = NC.
%

%
%  Ensure that 1 <= KC.
%
  if ( kc < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_UNRANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  KC < 1\n' );
    error ( 'COMP_UNRANK_GRLEX - Fatal error!' );
  end
%
%  Ensure that 1 <= RANK.
%
  if ( rank < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_UNRANK_GRLEX - Fatal error!' );
    fprintf ( 1, '  RANK < 1\n' );
    error ( 'COMP_UNRANK_GRLEX - Fatal error!' );
  end
%
%  Determine the appropriate value of NC.
%  Do this by adding up the number of compositions of sum 0, 1, 2, 
%  ..., without exceeding RANK.  Moreover, RANK - this sum essentially
%  gives you the rank of the composition within the set of compositions
%  of sum NC.  And that's the number you need in order to do the
%  unranking.
%
  rank1 = 1;
  nc = -1;
  while ( 1 ) 
    nc = nc + 1;
    r = i4_choose ( nc + kc - 1, nc );
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
  ks = kc - 1;
  ns = nc + kc - 1;

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
  xc = zeros ( kc, 1 );

  xc(1) = xs(1) - 1;
  for i = 2 : kc - 1
    xc(i) = xs(i) - xs(i-1) - 1;
  end
  xc(kc) = ns - xs(ks);

  return
end


function result = part_sf_majorize ( n, nparta, a, npartb, b )

%*****************************************************************************80
%
%% PART_SF_MAJORIZE determines if partition A majorizes partition B.
%
%  Discussion:
%
%    The partitions must be in standard form.
%
%    If A, with NPARTA parts, and B, with NPARTB parts, are both partitions
%    of the same positive integer N, then we say that A majorizes B if,
%    for every index K from 1 to N, it is true that
%
%      sum ( 1 <= I <= K ) B(I) <= sum ( 1 <= I <= K ) A(I)
%
%    where entries of A beyond index NPARTA, and of B beyond BPARTB
%    are assumed to be 0.  We say that A strictly majorizes B if
%    A majorizes B, and for at least one index K the inequality is strict.
%
%    For any two partitions of N, it is possible that A majorizes B,
%    B majorizes A, both partitions majorize each other (in which case
%    they are equal), or that neither majorizes the other.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack vanLint, Richard Wilson,
%    A Course in Combinatorics,
%    Cambridge, 1992,
%    ISBN: 0-521-42260-4,
%    LC: QA164.L56.
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%    N must be positive.
%
%    Input, integer NPARTA, the number of parts in partition A.
%    1 <= NPARTA <= N.
%
%    Input, integer A(NPARTA), contains partition A in standard
%    form.  A(1) through A(NPARTA) contain nonzero integers which sum to N.
%
%    Input, integer NPARTB, the number of parts in partition B.
%    1 <= NPARTB <= N.
%
%    Input, integer B(NPARTB), contains partition B in standard
%    form.  B(1) through B(NPARTB) contain nonzero integers which sum to N.
%
%    Output, integer RESULT, the result of the comparison.
%    -2, A and B are incomparable, would have been -1.
%    -1, A < B, (A is strictly majorized by B),
%     0, A = B, (A and B are identical),
%    +1, A > B, (A strictly majorizes B),
%    +2, A and B are incomparable, would have been +1.
%

%
%  Check.
%
  ierror = part_sf_check ( n, nparta, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PART_SF_MAJORIZE - Fatal error!\n' );
    fprintf ( 1, '  The input array A is illegal.\n' );
    error ( 'PART_SF_MAJORIZE - Fatal error!' );
  end

  ierror = part_sf_check ( n, npartb, b );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PART_SF_MAJORIZE - Fatal error!\n' );
    fprintf ( 1, '  The input array B is illegal.\n' );
    error ( 'PART_SF_MAJORIZE - Fatal error!' );
  end

  result = 0;
  suma = 0;
  sumb = 0;

  for i = 1 : min ( nparta, npartb )

    if ( i <= nparta )
      suma = suma + a(i);
    end

    if ( i <= npartb )
      sumb = sumb + b(i);
    end

    if ( result == -1 )

      if ( sumb < suma )
        result = -2;
        return
      end

    elseif ( result == 0 )

      if ( suma < sumb )
        result = -1;
      elseif ( sumb < suma )
        result = +1;
      end

    elseif ( result == + 1 )

      if ( suma < sumb )
        result = +2;
        return
      end

    end

  end

  return
end

function gray = gray_unrank2 ( rank )

%*****************************************************************************80
%
%% GRAY_UNRANK2 unranks a Gray code.
%
%  Discussion:
%
%    In contrast to GRAY_UNRANK, this routine is entirely arithmetical,
%    and does not require access to bit testing and setting routines.
%
%    The binary values of the Gray codes of successive integers differ in
%    just one bit.
%
%    The sequence of Gray codes for 0 to (2**N)-1 can be interpreted as a
%    Hamiltonian cycle on a graph of the cube in N dimensions.
%
%  Example:
%
%    Rank  Gray  Gray
%          (Dec) (Bin)
%
%     0     0       0
%     1     1       1
%     2     3      11
%     3     2      10
%     4     6     110
%     5     7     111
%     6     5     101
%     7     4     100
%     8    12    1100
%     9    14    1001
%    10    12    1010
%    11    13    1011
%    12     8    1100
%    13     9    1101
%    14    11    1110
%    15    10    1111
%    16    31   10000
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RANK, the integer whose Gray code is desired.
%
%    Output, integer GRAY, the Gray code of the given rank.
%
  if ( rank <= 0 )
    gray = 0;
    return
  end

  k = 0;
  two_k = 1;
  while ( 2 * two_k <= rank )
    two_k = two_k * 2;
    k = k + 1;
  end

  gray = two_k;
  rank = rank - two_k;
  next = 1;

  while ( 0 < k )

    two_k = floor ( two_k / 2 );
    k = k - 1;

    last = next;
    next = ( two_k <= rank & rank <= two_k * 2 );

    if ( next ~= last )
      gray = gray + two_k;
    end

    if ( next )
      rank = rank - two_k;
    end

  end

  return
end

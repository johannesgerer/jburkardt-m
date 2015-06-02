function rank = ksubset_lex_rank ( k, n, t )

%*****************************************************************************80
%
%% KSUBSET_LEX_RANK computes the lexicographic rank of a K subset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer K, the number of elements each K subset must
%    have.  1 <= K <= N.
%
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Input, integer T(K), describes a K subset.  T(I) is the I-th
%    element.  The elements must be listed in ascending order.
%
%    Output, integer RANK, the rank of the K subset.
%

%
%  Check.
%
  ierror = ksubset_lex_check ( k, n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_LEX_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'KSUBSET_LEX_RANK - Fatal error!' );
  end

  rank = 0;

  for i = 1 : k

    if ( i == 1 )
      tim1 = 0;
    else
      tim1 = t(i-1);
    end

    if ( tim1 + 1 <= t(i) - 1 )
      for j = tim1 + 1 : t(i) - 1
        rank = rank + i4_choose ( n - j, k - i );
      end
    end

  end

  return
end

function rank = ksubset_revdoor_rank ( k, n, t )

%*****************************************************************************80
%
%% KSUBSET_REVDOOR_RANK computes the revolving door rank of a K subset.
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
    fprintf ( 1, 'KSUBSET_REVDOOR_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'KSUBSET_REVDOOR_RANK - Fatal error!' );
  end

  if ( mod ( k, 2 ) == 0 )

    rank = 0;

  else

    rank = - 1;

  end

  s = 1;

  for i = k : -1 : 1
    rank = rank + s * i4_choose ( t(i), i );
    s = - s;
  end

  return
end

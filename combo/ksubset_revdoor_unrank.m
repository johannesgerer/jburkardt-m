function t = ksubset_revdoor_unrank ( rank, k, n )

%*****************************************************************************80
%
%% KSUBSET_REVDOOR_UNRANK computes the K subset of given revolving door rank.
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
%    Input, integer RANK, the rank of the K subset.
%
%    Input, integer K, the number of elements each K subset must
%    have.  1 <= K <= N.
%
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Output, integer T(K), describes the K subset of the given
%    rank.  T(I) is the I-th element.  The elements must be listed in
%    ascending order.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_REVDOOR_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'KSUBSET_REVDOOR_UNRANK - Fatal error!' );
  end

  if ( k < 1 || n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_REVDOOR_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input K is illegal.\n' );
    error ( 'KSUBSET_REVDOOR_UNRANK - Fatal error!' );
  end

  nksub = ksubset_enum ( k, n );

  if ( rank < 0 || nksub < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_REVDOOR_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'KSUBSET_REVDOOR_UNRANK - Fatal error!' );
  end

  x = n;

  for i = k : -1 : 1

    while ( rank < binomial ( x, i ) )
      x = x - 1;
    end

    t(i) = x + 1;
    rank = binomial ( x + 1, i ) - rank - 1;

  end

  return
end

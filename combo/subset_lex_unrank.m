function t = subset_lex_unrank ( rank, n )

%*****************************************************************************80
%
%% SUBSET_LEX_UNRANK computes the subset of given lexicographic rank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    Input, integer RANK, the rank of the subset.
%
%    Input, integer N, the number of items in the master set.
%    N must be positive.
%
%    Output, integer T(N), the subset of the given rank.
%    If T(I) = 0, item I is not in the subset; if T(I) = 1, item I is in
%    the subset.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUBSET_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'SUBSET_LEX_UNRANK - Fatal error!' );
  end

  nsub = subset_enum ( n );

  if ( rank < 0 || nsub < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUBSET_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'SUBSET_LEX_UNRANK - Fatal error!' );
  end


  for i = n : -1 : 1

    if ( mod ( rank, 2 ) == 1 )
      t(i) = 1;
    else
      t(i) = 0;
    end

    rank = floor ( rank / 2 );

  end

  return
end

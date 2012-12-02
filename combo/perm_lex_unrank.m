function p = perm_lex_unrank ( rank, n )

%*****************************************************************************80
%
%% PERM_LEX_UNRANK computes the permutation of given lexicographic rank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2011
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
%    Input, integer RANK, the rank of the permutation.
%
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Output, integer P(N), describes the permutation.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'PERM_LEX_UNRANK - Fatal error!' );
  end

  nperm = perm_enum ( n );

  if ( rank < 0 || nperm < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'PERM_LEX_UNRANK - Fatal error!' );
  end

  p(n) = 1;

  for j = 1 : n - 1

    d = mod ( rank, i4_factorial ( j + 1 ) ) / i4_factorial ( j );
    rank = rank - d * i4_factorial ( j );
    p(n-j) = d + 1;

    for i = n - j + 1 : n

      if ( d < p(i) )
        p(i) = p(i) + 1;
      end

    end

  end

  return
end

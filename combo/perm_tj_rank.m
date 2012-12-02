function rank = perm_tj_rank ( n, p )

%*****************************************************************************80
%
%% PERM_TJ_RANK computes the Trotter-Johnson rank of a permutation.
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
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Input, integer P(N), describes the permutation.
%    P(I) is the item which is permuted into the I-th place
%    by the permutation.
%
%    Output, integer RANK, the rank of the permutation.
%

%
%  Check.
%
  missing = perm_check ( n, p );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_TJ_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_TJ_RANK - Fatal error!' );
  end

  rank = 0;

  for j = 2 : n

    k = 1;
    i = 1;

    while ( p(i) ~= j ) 
      if ( p(i) < j )
        k = k + 1;
      end
      i = i + 1;
    end
    
    if ( mod ( rank, 2 ) == 0 )
      rank = j * rank + j - k;
    else
      rank = j * rank + k - 1;
    end

  end

  return
end

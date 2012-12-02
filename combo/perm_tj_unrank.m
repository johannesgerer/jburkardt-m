function p = perm_tj_unrank ( rank, n )

%*****************************************************************************80
%
%% PERM_TJ_UNRANK computes the permutation of given Trotter-Johnson rank.
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
    fprintf ( 1, 'PERM_TJ_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'PERM_TJ_UNRANK - Fatal error!' );
  end

  nperm = perm_enum ( n );

  if ( rank < 0 || nperm < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_TJ_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'PERM_TJ_UNRANK - Fatal error!' );
  end

  p(1) = 1;
  r2 = 0;

  for j = 2 : n
%
%  Replace this ratio of factorials!
%
    r1 = ( rank * i4_factorial ( j ) ) / i4_factorial ( n );
    k = r1 - j * r2;

    if ( mod ( r2, 2 ) == 0 )
      jhi = j - k;
    else
      jhi = k + 1;
    end

    for i = j - 1 : -1 : jhi
      p(i+1) = p(i);
    end
    p(jhi) = j;

    r2 = r1;

  end

  return
end

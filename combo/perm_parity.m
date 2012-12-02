function parity = perm_parity ( n, p )

%*****************************************************************************80
%
%% PERM_PARITY computes the parity of a permutation.
%
%  Discussion:
%
%    The routine requires the use of a temporary array.
%
%    A permutation is called "even" or "odd", depending on whether
%    it is equivalent to an even or odd number of pairwise 
%    transpositions.  This is known as the "parity" of the 
%    permutation.
%
%    The "sign" of a permutation is +1 if it has even parity,
%    and -1 if it has odd parity.
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
%    Output, integer PARITY, the parity of the permutation.
%    0, the permutation has even parity.
%    1, the permutation has odd parity.
%

%
%  Check.
%
  missing = perm_check ( n, p );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_PARITY - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_PARITY - Fatal error!' );
  end

  a(1:n) = 0;

  c = 0;

  for j = 1 : n

    if ( a(j) == 0 )

      c = c + 1;
      a(j) = 1;
      i = j;

      while ( p(i) ~= j ) 
        i = p(i);
        a(i) = 1;
      end

    end

  end

  parity = mod ( n - c, 2 );

  return
end

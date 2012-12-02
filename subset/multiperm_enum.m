function number = multiperm_enum ( n, k, counts )

%*****************************************************************************80
%
%% MULTIPERM_ENUM enumerates multipermutations.
%
%  Discussion:
%
%    A multipermutation is a permutation of objects, some of which are
%    identical.
%
%    While there are 6 permutations of the distinct objects A,B,C, there
%    are only 3 multipermutations of the objects A,B,B.
%
%    In general, there are N% permutations of N distinct objects, but
%    there are N% / ( ( M1% ) ( M2% ) ... ( MK% ) ) multipermutations
%    of N objects, in the case where the N objects consist of K
%    types, with M1 examples of type 1, M2 examples of type 2 and so on,
%    and for which objects of the same type are indistinguishable.
%
%  Example:
%
%    Input:
%
%      N = 5, K = 3, COUNTS = (/ 1, 2, 2 /)
%
%    Output:
%
%      Number = 30
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items in the multipermutation.
%
%    Input, integer K, the number of types of items.
%    1 <= K.  Ordinarily, K <= N, but we allow any positive K, because
%    we also allow entries in COUNTS to be 0.
%
%    Input, integer COUNTS(K), the number of items of each type.
%    0 <= COUNTS(1:K) <= N and sum ( COUNTS(1:K) ) = N.
%
%    Output, integer NUMBER, the number of multipermutations.
%
  if ( n < 0 )
    number = -1;
    return
  end

  if ( n == 0 )
    number = 1;
    return
  end

  if ( k < 1 )
    number = -1;
    return
  end

  if ( any ( counts(1:k) < 0 ) )
    number = -1;
    return
  end

  if ( sum ( counts(1:k) ) ~= n )
    number = -1;
    return
  end
%
%  Ready for computation.
%  By design, the integer division should never have a remainder.
%
  top = 0;
  number = 1;

  for i = 1 : k

    for j = 1 : counts ( i )
      top = top + 1;
      number = round ( ( number * top ) / j );
    end

  end

  return
end

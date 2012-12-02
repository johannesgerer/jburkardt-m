function p_sign = perm_sign ( n, p )

%*****************************************************************************80
%
%% PERM_SIGN returns the sign of a permutation.
%
%  Discussion:
%
%    A permutation can always be replaced by a sequence of pairwise
%    transpositions.  A given permutation can be represented by
%    many different such transposition sequences, but the number of
%    such transpositions will always be odd or always be even.
%    If the number of transpositions is even or odd, the permutation is
%    said to be even or odd.
%
%  Example:
%
%    Input:
%
%      N = 9
%      P = 2, 3, 9, 6, 7, 8, 5, 4, 1
%
%    Output:
%
%      P_SIGN = +1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of objects permuted.
%
%    Input, integer P(N), a permutation, in standard index form.
%
%    Output, integer P_SIGN, the "sign" of the permutation.
%    +1, the permutation is even,
%    -1, the permutation is odd.
%
  ierror = perm_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_SIGN - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_SIGN - Fatal error!' );
  end
%
%  Make a temporary copy of the permutation.
%
  q(1:n) = p(1:n);
%
%  Start with P_SIGN indicating an even permutation.
%  Restore each element of the permutation to its correct position,
%  updating P_SIGN as you go.
%
  p_sign = 1;

  for i = 1 : n - 1

    j = i4vec_index ( n, q, i );

    if ( j ~= i )
      temp = q(i);
      q(i) = q(j);
      q(j) = temp;
      p_sign = - p_sign;
    end

  end

  return
end

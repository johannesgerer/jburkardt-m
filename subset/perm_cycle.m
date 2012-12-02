function [ p, isgn, ncycle ] = perm_cycle ( n, iopt, p )

%*****************************************************************************80
%
%% PERM_CYCLE analyzes a permutation.
%
%  Discussion:
%
%    The routine will count cycles, find the sign of a permutation,
%    and tag a permutation.
%
%  Example:
%
%    Input:
%
%      N = 9
%      IOPT = 1
%      P = 2, 3, 9, 6, 7, 8, 5, 4, 1
%
%    Output:
%
%      NCYCLE = 3
%      ISGN = +1
%      P = -2, 3, 9, -6, -7, 8, 5, 4, 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 August 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer IOPT, requests tagging.
%    0, the permutation will not be tagged.
%    1, the permutation will be tagged.
%
%    Input, integer P(N), the permutation to be analyzed.  
%
%    Output, integer P(N).  If IOPT = 0, then P will be the same as P.
%    by this routine.  If IOPT = 1, then on output, P will be "tagged".  
%    That is, one element of every cycle in P will be negated.  In this way,
%    a user can traverse a cycle by starting at any entry I1 of P
%    which is negative, moving to I2 = ABS(P(I1)), then to
%    P(I2), and so on, until returning to I1.
%
%    Output, integer ISGN, the "sign" of the permutation, which is
%    +1 if the permutation is even, -1 if odd.  Every permutation
%    may be produced by a certain number of pairwise switches.
%    If the number of switches is even, the permutation itself is
%    called even.
%
%    Output, integer NCYCLE, the number of cycles in the permutation.
%
  ierror = perm_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_CYCLE - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_CYCLE - Fatal error!' );
  end

  is = 1;
  ncycle = n;

  for i = 1 : n

    i1 = p(i);

    while ( i < i1 )
      ncycle = ncycle - 1;
      i2 = p(i1);
      p(i1) = -i2;
      i1 = i2;
    end

    if ( iopt ~= 0 )
      is = - i4_sign ( p(i) );
    end

    p(i) = i4_sign ( is ) * abs ( p(i) );

  end

  isgn = 1 - 2 * mod ( n - ncycle, 2 );

  return
end


function p = perm_unrank ( n, rank )

%*****************************************************************************80
%
%% PERM_UNRANK produces the permutation of given rank.
%
%  Discussion:
%
%    That is, given a rank, it computes the corresponding permutation.
%    This is the same as asking for the permutation which PERM_NEXT2
%    would compute at the RANK-th step.
%
%    The value of the rank should be between 1 and N!.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%
%    Input, integer RANK, the desired rank of the permutation.  This
%    gives the order of the given permutation in the set of all
%    the permutations on N elements, using the ordering of PERM_NEXT2.
%
%    Output, integer P(N), the permutation, in standard index form.
%
  p(1:n) = 0;

  nfact = 1;

  for i = 1 : n
    nfact = nfact * i;
  end

  if ( rank < 1 | nfact < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value for RANK.\n' );
    fprintf ( 1, '  RANK must be between 1 and %d\n', nfact );
    fprintf ( 1, '  but the input value is %d\n', rank );
    error ( 'PERM_UNRANK - Fatal error!' );
  end

  jrank = rank - 1;

  for i = 1 : n

    iprev = n + 1 - i;
    irem = mod ( jrank, iprev );
    jrank = floor ( jrank / iprev );

    if ( mod ( jrank, 2 ) == 1 )
      j = 0;
      jdir = 1;
    else
      j = n + 1;
      jdir = -1;
    end

    icount = 0;

    while ( 1 )

      j = j + jdir;

      if ( p(j) == 0 )
        icount = icount + 1;
      end

      if ( irem < icount )
        break;
      end

    end

    p(j) = iprev;

  end

  return
end

function rank = perm_rank ( n, p )

%*****************************************************************************80
%
%% PERM_RANK computes the rank of a given permutation.
%
%  Discussion:
%
%    This is the same as asking for the step at which PERM_NEXT2
%    would compute the permutation.  The value of the rank will be
%    between 1 and N!.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set that
%    is permuted by P.
%
%    Input, integer P(N), a permutation, in standard index form.
%
%    Output, integer IRANK, the rank of the permutation.  This
%    gives the order of the given permutation in the set of all
%    the permutations on N elements.
%

%
%  Make sure the permutation is a legal one.
%  (This is not an efficient way to do so!)
%
  ierror = perm_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_RANK - Fatal error!' );
  end
%
%  Compute the inverse permutation.
%
  inverse = perm_inverse2 ( n, p );

  rank = 0;

  for i = 1 : n

    count = 0;

    for j = 1 : inverse(i)
      if ( p(j) < i )
        count = count + 1;
      end
    end

    if ( mod ( rank, 2 ) == 1 )
      rem = count;
    else
      rem = i - 1 - count;
    end

    rank = i * rank + rem;

  end

  rank = rank + 1;

  return
end

function [ npart, jarray, iarray ] = perm_to_equiv ( n, p )

%*****************************************************************************80
%
%% PERM_TO_EQUIV computes the partition induced by a permutation.
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
%      NPART = 3
%      JARRAY = 4, 3, 2
%      IARRAY = 1, 1, 1, 2  3  2  3  2, 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), a permutation, in standard index form.
%
%    Output, integer NPART, number of subsets in the partition.
%
%    Output, integer JARRAY(N).  JARRAY(I) is the number of elements
%    in the I-th subset of the partition.
%
%    Output, integer IARRAY(N).  IARRAY(I) is the class to which
%    element I belongs.
%
  ierror = perm_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM__TO_EQUIV - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_TO_EQUIV - Fatal error!' );
  end
%
%  Initialize.
%
  iarray(1:n) = 0;
  jarray(1:n) = 0;

  npart = 0;
%
%  Search for the next item J which has not been assigned a subset/orbit.
%
  for j = 1 : n 

    if ( iarray(j) ~= 0 )
      continue
    end
%
%  Begin a new subset/orbit.
%
    npart = npart + 1;
    k = j;
%
%  Add the item to the subset/orbit.
%
    while ( 1 )

      jarray(npart) = jarray(npart) + 1;
      iarray(k) = npart;
%
%  Apply the permutation.  If the permuted object isn't already in the
%  subset/orbit, add it.
%
      k = p(k);

      if ( iarray(k) ~= 0 )
        break
      end

    end

  end

  return
end

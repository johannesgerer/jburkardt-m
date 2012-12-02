function x = i4vec_part2 ( n, npart )

%*****************************************************************************80
%
%% I4VEC_PART2 partitions an integer N into NPART nearly equal parts.
%
%  Example:
%
%    Input:
%
%      N = 17, NPART = 5
%
%    Output:
%
%      X = ( 4, 4, 3, 3, 3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.  N
%    may be positive, zero, or negative.
%
%    Input, integer NPART, the number of entries in the array.
%    1 <= NPART
%
%    Output, integer X(NPART), the partition of N.  The entries of
%    X add up to N.  The entries of X are either all equal, or
%    differ by at most 1.  The entries of X all have the same sign
%    as N, and the "largest" entries occur first.
%
  if ( npart < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_PART2 - Fatal error!\n' );
    fprintf ( 1, '  The input value of NPART is illegal.\n' );
    error ( 'I4VEC_PART2 - Fatal error!' );
  end

  x(1:npart) = 0;

  if ( 0 < n )

    j = 1;
    for i = 1 : n
      x(j) = x(j) + 1;
      j = j + 1;
      if ( npart < j )
        j = 1;
      end
    end

  elseif ( n < 0 )

    j = 1;
    for i = n : -1
      x(j) = x(j) - 1;
      j = j + 1;
      if ( npart < j )
        j = 1;
      end
    end

  end

  return
end

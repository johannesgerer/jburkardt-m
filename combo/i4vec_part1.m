function x = i4vec_part1 ( n, npart )

%*****************************************************************************80
%
%% I4VEC_PART1 partitions an integer N into NPART parts.
%
%  Example:
%
%    Input:
%
%      N = 17, NPART = 5
%
%    Output:
%
%      X = ( 13, 1, 1, 1, 1 ).
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
%    1 <= NPART <= N.
%
%    Output, integer X(NPART), the partition of N.  The entries of
%    X add up to N.  X(1) = N + 1 - NPART, and all other entries
%    are equal to 1.
%
  if ( npart < 1 || n < npart )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_PART1 - Fatal error!\n' );
    fprintf ( 1, '  The input value of NPART is illegal.\n' );
    error ( 'I4VEC_PART1 - Fatal error!' );
  end

  x(1) = n + 1 - npart;
  x(2:npart) = 1;

  return
end

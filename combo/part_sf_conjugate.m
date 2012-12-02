function [ npart2, b ] = part_sf_conjugate ( n, npart, a )

%*****************************************************************************80
%
%% PART_SF_CONJUGATE computes the conjugate of a partition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    Input, integer N, the integer to be partitioned.
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Input, integer A(N), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.
%
%    Output, integer NPART2, the number of parts of the conjugate
%    partition.
%
%    Output, integer B(N), contains the conjugate partition.
%

%
%  Check.
%
  ierror = part_sf_check ( n, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PART_SF_CONJUGATE - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'PART_SF_CONJUGATE - Fatal error!' );
  end

  npart2 = a(1);
  b(1:npart2) = 0;

  for i = 1 : npart
    for j = 1 : a(i)
      b(j) = b(j) + 1;
    end
  end

  return
end

function rank = npart_rsf_lex_rank ( n, npart, a )

%*****************************************************************************80
%
%% NPART_RSF_LEX_RANK computes the lex rank of an RSF NPART partition.
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
%    Input, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.
%
%    Output, integer RANK, the rank of the partition.
%
  offset = 1;
%
%  Check.
%
  ierror = part_rsf_check ( n, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_RSF_LEX_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror )
    error ( 'NPART_RSF_LEX_RANK - Fatal error!' );
  end
%
%  Get the table of partitions of N with NPART parts.
%
  p = npart_table ( n, npart );
%
%  Copy the partition "backwards".
%
  b(1:npart) = a(npart:-1:1);

  rank = 0;

  while ( 0 < n && 0 < npart )

    if ( b(npart) == 1 )

      n = n - 1;
      npart = npart - 1;

    else

      b(1:npart) = b(1:npart) - 1;
      rank = rank + p(n-1+offset,npart-1+offset);
      n = n - npart;

    end

  end

  return
end

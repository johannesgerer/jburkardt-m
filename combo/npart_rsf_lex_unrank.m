function a = npart_rsf_lex_unrank ( rank, n, npart )

%*****************************************************************************80
%
%% NPART_RSF_LEX_UNRANK unranks an RSF NPART partition in the lex ordering.
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
%    Input, integer RANK, the rank of the partition.
%
%    Input, integer N, the integer to be partitioned.
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Output, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.
%
  offset = 1;
%
%  Check.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_RSF_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input N is illegal.\n' );
    error ( 'NPART_RSF_LEX_UNRANK - Fatal error!' );
  end

  if ( npart < 1 || n < npart )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_RSF_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input NPART is illegal.\n' );
    error ( 'NPART_RSF_LEX_UNRANK - Fatal error!' );
  end

  npartitions = npart_enum ( n, npart );

  if ( rank < 0 || npartitions < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_RSF_LEX_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'NPART_RSF_LEX_UNRANK - Fatal error!' );
  end
%
%  Get the table of partitions of N with NPART parts.
%
  p = npart_table ( n, npart );

  a(1:npart) = 0;
  npartcopy = npart;

  while ( 0 < n )

    if ( rank < p(n-1+offset,npartcopy-1+offset) )
      a(npart+1-npartcopy) = a(npart+1-npartcopy) + 1;
      n = n - 1;
      npartcopy = npartcopy - 1;
    else
      for i = 1 : npartcopy
        a(npart+1-i) = a(npart+1-i) + 1;
      end
      rank = rank - p(n-1+offset,npartcopy-1+offset);
      n = n - npartcopy;
    end

  end

  return
end

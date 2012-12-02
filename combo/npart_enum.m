function npartitions = npart_enum ( n, npart )

%*****************************************************************************80
%
%% NPART_ENUM enumerates the number of partitions of N with NPART parts.
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
%    Normally N must be positive, but for this routine any
%    N is allowed.
%
%    Input, integer NPART, the number of parts of the partition.
%    Normally, 1 <= NPART <= N is required,
%    but for this routine any value of NPART is allowed.
%
%    Output, integer NPARTITIONS is the number of partitions of N
%    with NPART parts.
%
  if ( n <= 0 )

    npartitions = 0;

  elseif ( npart <= 0 || n < npart )

    npartitions = 0;

  else

    offset = 1;

    p = npart_table ( n, npart );

    npartitions = p(n+offset,npart+offset);

  end

  return
end

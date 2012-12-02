function npartitions = partn_enum ( n, nmax )

%*****************************************************************************80
%
%% PARTN_ENUM enumerates the partitions of N with maximum element NMAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
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
%    Input, integer NMAX, the maximum element in the partition.
%    Normally, 1 <= NMAX <= N is required,
%    but for this routine any value of NMAX is allowed.
%
%    Output, integer NPARTITIONS is the number of partitions of N
%    with maximum element NMAX.
%
  if ( n <= 0 )

    npartitions = 0;

  elseif ( nmax <= 0 || n < nmax )

    npartitions = 0;

  else

    offset = 1;

    p = npart_table ( n, nmax );

    npartitions = p(n+offset,nmax+offset);

  end

  return
end

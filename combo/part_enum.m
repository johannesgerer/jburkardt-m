function npartitions = part_enum ( n )

%*****************************************************************************80
%
%% PART_ENUM enumerates the number of partitions of N.
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
%    Output, integer NPARTITIONS is the number of partitions of N.
%
  offset = 1;

  if ( n < 0 )

    npartitions = 0;

  else

    p = part_table ( n );

    npartitions = p(n+offset);

  end

  return
end

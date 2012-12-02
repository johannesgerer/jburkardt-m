function p = npart_table ( n, npart )

%*****************************************************************************80
%
%% NPART_TABLE tabulates the number of partitions of N having NPART parts.
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
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Output, integer P(1:N+1,1:NPART+1), P(I+1,J+1) is the number of
%    partitions of I having J parts.
%
  offset = 1;

  p = zeros ( n + 1, npart + 1 );

  p(0+offset,0+offset) = 1;
  p(1+offset:n+offset,0+offset) = 0;

  for i = 1 : n
    for j = 1 : npart
      if ( i < j )
        p(i+offset,j+offset) = 0;
      elseif ( i < 2 * j )
        p(i+offset,j+offset) = p(i-1+offset,j-1+offset);
      else
        p(i+offset,j+offset) = p(i-1+offset,j-1+offset) + p(i-j+offset,j+offset);
      end
    end
  end

  return
end

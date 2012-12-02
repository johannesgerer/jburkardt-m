function p = part_table ( n )

%*****************************************************************************80
%
%% PART_TABLE tabulates the number of partitions of N.
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
%    Output, integer P(1:N+1), P(I+1) is the number of partitions of I.
%
  offset = 1;

  p = zeros ( n + 1, 1 );

  p(0+offset) = 1;
  p(1+offset) = 1;

  for i = 2 : n

    sign = 1;
    psum = 0;
    w = 1;
    j = 1;
    wprime = w + j;

    while ( w < n )

      if ( 0 <= i - w )
        if ( sign == 1 )
          psum = psum + p(i-w+offset);
        else
          psum = psum - p(i-w+offset);
        end
      end

      if ( wprime <= i )

        if ( sign == 1 )
          psum = psum + p(i-wprime+offset);
        else
          psum = psum - p(i-wprime+offset);
        end

      end

      w = w + 3 * j + 1;
      j = j + 1;
      wprime = w + j;
      sign = - sign;

    end

    p(i+offset) = psum;

  end

  return
end

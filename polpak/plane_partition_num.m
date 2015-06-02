function value = plane_partition_num ( n )

%*****************************************************************************80
%
%% PLANE_PARTITION_NUM returns the number of plane partitions of the integer N.
%
%  Discussion:
%
%    A plane partition of a positive integer N is a partition of N in which
%    the parts have been arranged in a 2D array that is nonincreasing across
%    rows and columns.  There are six plane partitions of 3:
%
%      3   2 1   2   1 1 1   1 1   1
%                1           1     1
%                                  1
%
%  First Values:
%
%     N PP(N)
%     0    1
%     1    1
%     2    3
%     3    6
%     4   13
%     5   24
%     6   48
%     7   86
%     8  160
%     9  282
%    10  500
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Frank Olver, Daniel Lozier, Ronald Boisvert, Charles Clark,
%    NIST Handbook of Mathematical Functions,
%    Cambridge University Press, 2010,
%    ISBN: 978-0521140638,
%    LC: QA331.N57.
%    
%  Parameters:
%
%    Input, integer N, the number, which must be at least 0.
%
%    Output, integer VALUE, the number of plane partitions of N.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_PARTITION_NUM - Fatal error!\n' );
    fprintf ( 1, '  0 <= N is required.\n' );
    error ( 'PLANE_PARTITION_NUM - Fatal error!' );
  end

  O = 1;

  pp = zeros ( n + 1, 1 );

  nn = 0;
  pp(nn+O) = 1;

  nn = 1;
  if ( nn <= n )
    pp(nn+O) = 1;
  end

  for nn = 2 : n
    for j = 1 : nn
      s2 = 0;
      for k = 1 : j
        if ( mod ( j, k ) == 0 )
          s2 = s2 + k * k;
        end
      end
      pp(nn+O) = pp(nn+O) + pp(nn-j+O) * s2;
    end
    pp(nn+O) = pp(nn+O) / nn;
  end

  value = pp(n+O);

  return
end

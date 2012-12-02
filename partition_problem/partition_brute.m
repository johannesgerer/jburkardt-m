function [ c, discrepancy ] = partition_brute ( n, w )

%*****************************************************************************80
%
%% PARTITION_BRUTE approaches the partition problem using brute force.
%
%  Discussion:
%
%    We are given a set of N integers W.
%
%    We seek to partition W into subsets W0 and W1, such that the subsets
%    have equal sums.
%
%    The "discrepancy" is the absolute value of the difference between the
%    two sums, and will be zero if we have solved the problem.
%
%    For a given set of integers, there may be zero, one, or many solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the set.
%
%    Input, integer W(N), the integers.
%
%    Output, integer C(N), indicates the proposed solution.
%    C(I) is 0 for items in set W0 and 1 for items in set W1.
%
%    Output, integer DISCREPANCY, the discrepancy.
%
  w = w(:);
  w_sum = sum ( w(1:n) );
  discrepancy = w_sum;

  d = [];
  rank = -1;

  while ( 1 )

    [ d, rank ] = subset_next ( n, d, rank );

    if ( rank == -1 )
      break
    end

    d_discrepancy = abs ( w_sum - 2 * d' * w );

    if ( d_discrepancy < discrepancy )
      discrepancy = d_discrepancy;
      c(1:n) = d(1:n);
    end

    if ( discrepancy == 0 )
      break
    end

  end

  return
end

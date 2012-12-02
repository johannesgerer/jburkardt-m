function count = partition_count ( n, w )

%*****************************************************************************80
%
%% PARTITION_COUNT counts the solutions to a partition problem.
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
%    In the case where the weights are distinct, the count returned by this
%    function may be regarded as twice as big as it should be, since the
%    partition (W0,W1) is counted a second time as (W1,W0).  A more serious
%    overcount can occur if the set W contains duplicate elements - in the
%    extreme case, W might be entirely 1's, in which case there is really
%    only one (interesting) solution, but this function will count many.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the set.
%
%    Input, integer W(N,1), the integers.
%
%    Output, integer COUNT, the number of solutions.
%
  w = w(:);

  w_sum = sum ( w(1:n) );

  c = [];
  rank = -1;
  count = 0;

  while ( 1 )

    [ c, rank ] = subset_next ( n, c, rank );

    if ( rank == -1 )
      break;
    end

    discrepancy = abs ( w_sum - 2 * c' * w );

    if ( discrepancy == 0 )
      count = count + 1;
    end

  end

  return
end

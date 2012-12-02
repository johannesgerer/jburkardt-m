function [ a, index, sum_achieved ] = subsetsum_swap ( n, a, sum_desired )

%*****************************************************************************80
%
%% SUBSETSUM_SWAP seeks a solution of the subset sum problem by swapping.
%
%  Discussion:
%
%    Given a collection of N not necessarily distinct positive integers A(I),
%    and a positive integer SUM_DESIRED, select a subset of the values so that
%    their sum is as close as possible to SUM_DESIRED without exceeding it.
%
%  Algorithm:
%
%    Start with no values selected, and SUM_ACHIEVED = 0.
%
%    Consider each element A(I):
%
%      If A(I) is not selected and SUM_ACHIEVED + A(I) <= SUM_DESIRED,
%        select A(I).
%
%      If A(I) is still not selected, and there is a selected A(J)
%      such that SUM_GOT < SUM_ACHIEVED + A(I) - A(J),
%        select A(I) and deselect A(J).
%
%      If no items were selected on this sweep,
%        exit.
%      Otherwise,
%        repeat the search.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
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
%    Input, integer N, the number of values.  N must be positive.
%
%    Input/output, integer A(N), a collection of positive values.
%    On output, A has been sorted into descending order.
%
%    Input, integer SUM_DESIRED, the desired sum.
%
%    Output, integer INDEX(N); INDEX(I) is 1 if A(I) is part of the
%    sum, and 0 otherwise.
%
%    Output, integer SUM_ACHIEVED, the sum of the selected
%    elements.
%

%
%  Initialize.
%
  sum_achieved = 0;
  index(1:n) = 0;
%
%  Sort into descending order.
%
  a = i4vec_sort_insert_d ( n, a );

  while ( 1 )

    nmove = 0;

    for i = 1 : n

      if ( index(i) == 0 )

        if ( sum_achieved + a(i) <= sum_desired )
          index(i) = 1;
          sum_achieved = sum_achieved + a(i);
          nmove = nmove + 1;
          continue
        end

      end

      if ( index(i) == 0 )

        for j = 1 : n

          if ( index(j) == 1 )

            if ( sum_achieved < sum_achieved + a(i) - a(j) && ...
              sum_achieved + a(i) - a(j) <= sum_desired )
              index(j) = 0;
              index(i) = 1;
              nmove = nmove + 2;
              sum_achieved = sum_achieved + a(i) - a(j);
              break
            end

          end

        end

      end

    end

    if ( nmove <= 0 )
      break
    end

  end

  return
end

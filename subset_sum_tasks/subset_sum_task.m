function [ i_choose, w_choose ] = subset_sum_task ( weights, target, range )

%*****************************************************************************80
%
%% SUBSET_SUM_TASK seeks a subset of a set that has a given sum.
%
%  Discussion:
%
%    This function tries to compute a target value as the sum of
%    a selected subset of a given set of weights.
%
%    This function works by brute force, that is, it tries every
%    possible subset to see if it sums to the desired value.
%
%    Given N weights, every possible selection can be described by 
%    one of the N-digit binary numbers from 0 to 2^N-1.
%
%    This function includes a range, which allows the user to 
%    control which subsets are to be checked.  Thus, if there are 
%    N weights, specifying a range of [ 0, 2^N-1] indicates that
%    all subsets should be checked.  On the other hand, this full
%    range could be broken down into smaller subranges, each of
%    which could be checked independently.
%
%    It is possible that, in the given range, there may be multiple
%    solutions of the problem.  This function will only return
%    one such solution, if found.
%
%  Example:
%
%    [ c, wv ] = subset_sum_task ( [1 2 4 8 16 32], 22, [0 2^6 - 1] )
%
%    c = 2 3 5
%    wv = 2 4 16
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer WEIGHTS(N), a set of weights.
%
%    Input, integer TARGET, the target value.
%
%    Input, integer RANGE(2), the lower and upper limits to be searched.
%
%    Output, integer I_CHOOSE(K), the indices of the chosen weights.
%
%    Output, integer W_CHOOSE(K), the values of the chosen weights.
%

%
%  Initialize the output to empty matrices.
%
  i_choose = [];
  w_choose = [];
%
%  Iterate through all possible combinations in the provided range.
%
  n = length ( weights );

  for i = range(1) : range(2)
%
%  Find the combination of weights represented by the current attempt.
%
    choose = find ( bitget ( i, 1:n ) );
%
%  If the sum of those weights matches the target, return combination.
%
    if ( sum ( weights(choose) ) == target )
      i_choose = choose;
      w_choose = weights(choose);
      return
    end
    
  end

  return
end

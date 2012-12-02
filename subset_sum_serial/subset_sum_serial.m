function [ combination, weightvalue ] = subset_sum_serial ( weights, target )

%*****************************************************************************80
%
%% SUBSET_SUM_SERIAL seeks a subset of a set that has a given sum.
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
%    It is possible that there may be multiple solutions of the problem.  
%    This function will only return the first solution found.
%
%  Example:
%
%    [ c, wv ] = subset_sum_serial ( [1 2 4 8 16 32], 22 )
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
%    22 March 2011
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
%    Output, integer I_CHOOSE(K), the indices of the chosen weights.
%
%    Output, integer W_CHOOSE(K), the values of the chose weights.
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

  for i = 0 : 2^n - 1
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

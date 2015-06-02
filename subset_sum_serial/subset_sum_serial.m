function choose = subset_sum_serial ( n, weight, target )

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
%    c = subset_sum_serial ( 6, [1 2 4 8 16 32], 22 )
%
%    c = [ 0 1 1 0 1 0 ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of weights.
%
%    Input, integer WEIGHT(N), a set of weights.
%
%    Input, integer TARGET, the target value.
%
%    Output, integer CHOOSE(N), contains a 1 for each weight that is
%    chosen, 0 for weights not chosen.  If no solution was found,
%    all entries are -1.
%
  weight = weight(:);
%
%  Iterate through all possible combinations in the provided range.
%
  for i = 0 : 2^n - 1
%
%  Find the combination of weights represented by the current attempt.
%
    choose = i4_to_digits_binary ( i, n );
%
%  If the sum of those weights matches the target, return combination.
%
    w_sum = choose(:)' * weight(:);

    if ( w_sum == target )
      return
    end
    
  end

  choose(1:n) = -1;

  return
end
function c = i4_to_digits_binary ( i, n )

%*****************************************************************************80
%
%% I4_TO_DIGITS_BINARY produces the binary digits of an I4.
%
%  Discussion:
%
%    An I4 is an integer.
%
%  Example:
%
%     I    N     C               Binary
%    --  ---   ---         ------------
%     0    1   0                      0
%     0    2   0, 0                  00
%     1    3   1, 0, 0              100
%     2    3   0, 1, 0              010
%     3    3   1, 1, 0              011
%     4    3   0, 0, 1              100
%     8    3   0, 0, 0           (1)000
%     8    5   0, 0, 0, 1, 0      01000
%    -8    5   0, 0, 0, 1, 0  (-) 01000
%
%     0    3   0, 0, 0
%     1    3   1, 0, 0
%     2    3   0, 1, 0
%     3    3   1, 1, 0
%     4    3   0, 0, 1
%     5    3   1, 0, 1
%     6    3   0, 1, 1
%     7    3   1, 1, 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, an integer to be represented.
%
%    Input, integer N, the number of binary digits to produce.
%
%    Output, integer C(N), the first N binary digits of I,
%    with C(1) being the units digit.
%
  i_copy = floor ( abs ( i ) );

  c = zeros ( n, 1 );

  for j = 1 : n

    c(j) = mod ( i_copy, 2 );
    i_copy = floor ( i_copy / 2 );

  end

  return
end

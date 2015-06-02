function value = triangle_num ( n )

%*****************************************************************************80
%
%% TRIANGLE_NUM returns the N-th triangular number.
%
%  Discussion:
%
%    The N-th triangular number T(N) is formed by the sum of the first
%    N integers:
%
%      T(N) = sum ( 1 <= I <= N ) I
%
%    By convention, T(0) = 0.
%
%    T(N) = ( N * ( N + 1 ) ) / 2
%
%  First Values:
%
%     0
%     1
%     3
%     6
%    10
%    15
%    21
%    28
%    36
%    45
%    55
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the index of the desired number, which must be
%    at least 0.
%
%    Output, integer VALUE, the N-th triangular number.
%
  value = ( n * ( n + 1 ) ) / 2;

  return
end

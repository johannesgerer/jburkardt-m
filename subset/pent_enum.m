function p = pent_enum ( n )

%*****************************************************************************80
%
%% PENT_ENUM computes the N-th pentagonal number.
%
%  Discussion:
%
%    The pentagonal number P(N) counts the number of dots in a figure of
%    N nested pentagons.  The pentagonal numbers are defined for both
%    positive and negative N.
%
%    The pentagonal numbers are also useful in determining the
%    number of partitions of an integer.
%
%  First values:
%
%     N    P
%
%    -5   40
%    -4   26
%    -3   15
%    -2    7
%    -1    2
%     0    0
%     1    1
%     2    5
%     3   12
%     4   22
%     5   35
%     6   51
%     7   70
%     8   92
%     9  117
%    10  145
%
%  Formula:
%
%    P(N) = ( N * ( 3 * N - 1 ) ) / 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the index of the pentagonal number desired.
%
%    Output, integer P, the value of the N-th pentagonal number.
%
  p = ( n * ( 3 * n - 1 ) ) / 2;

  return
end

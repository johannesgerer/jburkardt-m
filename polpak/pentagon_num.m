function p = pentagon_num ( n )

%*****************************************************************************80
%
%% PENTAGON_NUM computes the N-th pentagonal number.
%
%  Definition:
%
%    The pentagonal number P(N) counts the number of dots in a figure of
%    N nested pentagons.  The pentagonal numbers are defined for both
%    positive and negative N.
%
%  First values:
%
%    N   P
%
%   -5  40
%   -4  26
%   -3  15
%   -2   7
%   -1   2
%    0   0
%    1   1
%    2   5
%    3  12
%    4  22
%    5  35
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
%    26 July 2004
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

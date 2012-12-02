function [ a, b, c, i, j ] = pythag_triple_next ( i, j )

%*****************************************************************************80
%
%% PYTHAG_TRIPLE_NEXT computes the next Pythagorean triple.
%
%  Example:
%
%     I       J       A       B       C    A^2+B^2 = C^2
%
%     2       1       3       4       5      25
%     3       2       5      12      13     169
%     4       1      15       8      17     289
%     4       3       7      24      25     625
%     5       2      21      20      29     841
%     5       4       9      40      41    1681
%     6       1      35      12      37    1369
%     6       3      27      36      45    2025
%     6       5      11      60      61    3721
%     7       2      45      28      53    2809
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the generators.
%    On first call, set I = J = 0.  On repeated calls, set I and J
%    to the output values of I and J from the previous call.
%
%    Output, integer A, B, C, the next Pythagorean triple.
%    A, B, and C are positive integers which have no common factors,
%    and A**2 + B**2 = C**2.
%
%    Output, integer I, J, the updated values of the generators,
%    which should be used as the input values of I and J if the routine
%    is to be called again.
%

%
%  I starts at 2, and when it increases, increases by 1 and resets J;
%
%  When I is reset, J starts out at 2 if I is odd, or 1 if I is even;
%  Then I is held fixed and J increases by 2, as long as it remains less than I.
%
  if ( i == 0 & j == 0 )
    i = 2;
    j = 1;
  elseif ( j + 2 < i )
    j = j + 2;
  else
    i = i + 1;
    j = mod ( i, 2 ) + 1;
  end

  a = i^2 - j^2;
  b = 2 * i * j;
  c = i^2 + j^2;

  return
end

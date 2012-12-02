function [ a, b ] = rat_farey2 ( n, a, b )

%*****************************************************************************80
%
%% RAT_FAREY2 computes the next row of the Farey fraction table.
%
%  Example:
%
%    Input:
%
%      N = 3
%      A =  0  1  1  2  1
%      B =  1  3  2  3  1
%
%    Output:
%
%      A =  0  1  1  2  1  3  2  3  1
%      B =  1  4  3  5  2  5  3  4  1
%
%  Discussion:
%
%    In this form of the Farey fraction table, fractions in row N lie between
%    0 and 1, and are in lowest terms.  For every adjacent pair of input
%    fractions, A1/B1 and A2/B2, the mediant (A1+A2)/(B1+B2) is computed
%    and inserted between them.
%
%    The number of items in the N-th row is 1+2**(N-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the input row number.  N must be nonnegative.
%    If N is zero, then the input values A and B are ignored, and the entries of
%    row 1 are computed directly.
%
%    Input, integer A(1+2**(N-1)), B(1+2**(N-1)),the entries of row N.
%
%    Output, integer A(1+2**N), B(1+2**N), the entries of row N+1.
%
  if ( n == 0 )
    a2(1) = 0;
    b2(1) = 1;
    a2(2) = 1;
    b2(2) = 1;
    return
  end
%
%  Shift the current data.
%
  for i = 1+2^(n-1) : -1 : 1
    a2(2*i-1) = a(i);
    b2(2*i-1) = b(i);
  end
%
%  Compute the mediants.
%
  for i = 2 : 2 : 2^n
    a2(i) = a2(i-1) + a2(i+1);
    b2(i) = b2(i-1) + b2(i+1);
  end

  a = a2;
  b = b2;

  return
end

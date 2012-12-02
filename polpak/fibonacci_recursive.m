function f = fibonacci_recursive ( n )

%*****************************************************************************80
%
%% FIBONACCI_RECURSIVE computes the first N Fibonacci numbers.
%
%  Algebraic equation:
%
%    The 'golden ratio' PHI = (1+sqrt(5))/2 satisfies the equation
%
%      X*X-X-1=0
%
%    which is often written as:
%
%       X        1
%      --- =  ------
%       1      X - 1
%
%    expressing the fact that a rectangle, whose sides are in proportion X:1,
%    is similar to the rotated rectangle after a square of side 1 is removed.
%
%      <----X---->
%
%      +-----*---*
%      :     :   :  1
%      :     :   :
%      +-----*---+
%      <--1-><X-1>
%
%  Formula:
%
%    Let
%
%      PHIP = ( 1 + sqrt(5) ) / 2
%      PHIM = ( 1 - sqrt(5) ) / 2
%
%    Then
%
%      F(N) = ( PHIP**N + PHIM**N ) / sqrt(5)
%
%    Moreover, F(N) can be computed by computing PHIP**N / sqrt(5) and rounding
%    to the nearest whole number.
%
%  First terms:
%
%      1
%      1
%      2
%      3
%      5
%      8
%     13
%     21
%     34
%     55
%     89
%    144
%
%    The 40th number is                  102,334,155.
%    The 50th number is               12,586,269,025.
%    The 100th number is 354,224,848,179,261,915,075.
%
%  Recursion:
%
%    F(1) = 1
%    F(2) = 1
%
%    F(N) = F(N-1) + F(N-2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the highest Fibonacci number to compute.
%
%    Output, integer F(N), the first N Fibonacci numbers.
%
  if ( n <= 0 )
    f = [];
    return
  end

  f(1) = 1;

  if ( n <= 1 )
    return
  end

  f(2) = 1;

  for i = 3 : n
    f(i) = f(i-1) + f(i-2);
  end

  return
end

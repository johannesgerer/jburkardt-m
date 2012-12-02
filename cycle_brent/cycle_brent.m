function [ lam, mu ] = cycle_brent ( f, x0 )

%*****************************************************************************80
%
%% CYCLE_BRENT finds a cycle in an iterated mapping using Brent's method.
%
%  Discussion:
%
%    Suppose we a repeatedly apply a function f(), starting with the argument
%    x0, then f(x0), f(f(x0)) and so on.  Suppose that the range of f is finite.
%    Then eventually the iteration must reach a cycle.  Once the cycle is reached,
%    succeeding values stay within that cycle.
%
%    Starting at x0, there is a "nearest element" of the cycle, which is
%    reached after MU applications of f.
%
%    Once the cycle is entered, the cycle has a length LAM, which is the number
%    of steps required to first return to a given value.
%
%    This function uses Brent's method to determine the values of MU and LAM,
%    given F and X0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    An improved Monte Carlo factorization algorithm,
%    BIT,
%    Volume 20, Number 2, 1980, pages 176-184.
%
%  Parameters:
%
%    Input, integer F ( integer I ), the name of the function
%    to be analyzed.
%
%    Input, integer X0, the starting point.
%
%    Output, integer LAM, the length of the cycle.
%
%    Output, integer MU, the index in the sequence starting
%    at X0, of the first appearance of an element of the cycle.
%
  power = 1;
  lam = 1;
  tortoise = x0;
  hare = f ( x0 );

  while ( tortoise ~= hare )
    if ( power == lam )
      tortoise = hare;
      power = power * 2;
      lam = 0;
    end
    hare = f ( hare );
    lam = lam + 1;
  end

  mu = 0;
  tortoise = x0;
  hare = x0;

  for i = 0 : lam - 1
    hare = f ( hare );
  end

  while ( tortoise ~= hare )
    tortoise = f ( tortoise );
    hare = f ( hare );
    mu = mu + 1;
  end

  return
end

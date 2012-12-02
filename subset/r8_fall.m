function value = r8_fall ( x, n )

%*****************************************************************************80
%
%% R8_FALL computes the falling factorial function [X]_N.
%
%  Discussion:
%
%    Note that the number of "injections" or 1-to-1 mappings from
%    a set of N elements to a set of M elements is [M]_N.
%
%    The number of permutations of N objects out of M is [M]_N.
%
%    Moreover, the Stirling numbers of the first kind can be used
%    to convert a falling factorial into a polynomial, as follows:
%
%      [X]_N = S^0_N + S^1_N * X + S^2_N * X^2 + ... + S^N_N X^N.
%
%  Formula:
%
%    [X]_N = X * ( X - 1 ) * ( X - 2 ) * ... * ( X - N + 1 ).
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
%    Input, real X, the argument of the falling factorial function.
%
%    Input, integer N, the order of the falling factorial function.
%    If N = 0, FALL = 1, if N = 1, FALL = X.  Note that if N is
%    negative, a "rising" factorial will be computed.
%
%    Output, real VALUE, the value of the falling factorial function.
%
  value = 1.0;

  arg = x;

  if ( 0 < n )

    for i = 1 : n
      value = value * arg;
      arg = arg - 1.0;
    end

  elseif ( n < 0 )

    for i = -1 : -1 : n
      value = value * arg;
      arg = arg + 1.0;
    end

  end

  return
end

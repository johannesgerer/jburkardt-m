function s = collatz ( seed )

%*****************************************************************************80
%
%% COLLATZ computes the Collatz sequence for a given starting point.
%
%  Discussion:
%
%    The Collatz sequence is defined recursively as follows:
%
%      Let T be the current entry of the sequence, and U the next:
%
%      If T = 1, the sequence terminates (or U = 1, your choice);
%      Else if T is even, U = T / 2;
%      Else (if T is odd, and greater than 1) U = 3 * T + 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, the starting point for the sequence.
%    SEED must be positive.
%
%    Output, integer S[*], the Collatz sequence, starting with SEED.
%    Once the sequence reaches the value 1, no more entries are computed.
%
  if ( seed <= 0 )
    s = [];
    return
  end

  n = 1;
  t = seed;
  s(n) = t;

  while ( t ~= 1 )

    if ( 2 * round ( t / 2 ) == t )
      t = t / 2;
    else
      t = 3 * t + 1;
    end

    n = n + 1;
    s(n) = t;

  end

  return
end

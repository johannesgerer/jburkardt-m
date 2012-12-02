function m = collatz_max ( seed )

%*****************************************************************************80
%
%% COLLATZ_MAX returns the largest element of a Collatz sequence.
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
%    22 May 2012
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
%    Output, integer M, the maximum element of the sequence.
%
  m = seed;

  if ( seed <= 0 )
    return
  end

  t = seed;

  while ( t ~= 1 )

    if ( 2 * round ( t / 2 ) == t )
      t = t / 2;
    else
      t = 3 * t + 1;
    end

    m = max ( m, t );

  end

  return
end

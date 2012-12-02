function j_max = collatz_fun ( n )

%*****************************************************************************80
%
%% COLLATZ_PARFOR seeks the maximum Collatz count for 1 through N.
%
%  Discussion:
%
%    For each integer I, we compute a sequence of values that 
%    terminate when we reach 1.  The number of steps required to
%    reach 1 is the "rank" of I, and we are searching the numbers
%    from 1 to N for the number with maximum rank.
%
%    For a given I, the sequence is produced by:
%
%    1) J = 1, X(J) = I;
%    2) If X(J) = 1, stop.
%    3) J = J + 1; 
%       if X(J-1) was even, X(J) = X(J-1)/2;
%       else                X(J) = 3 * X(J-1) + 1;
%    4) Go to 3
%
%  Example:
%
%            N     I_MAX J_MAX
%
%           10         9    20
%          100        97   119
%        1,000       871   179
%       10,000     6,171   262
%      100,000    77,031   351
%    1,000,000   837,799   525
%   10,000,000 8,400,511   686
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the maximum integer to check.
%
%    Output, integer J_MAX, the length of the longest Collatz sequence
%    starting from I between 1 and N.
%
  j_max = -1;

  parfor i = 1 : n

    j = 1;
    x = i;

    while ( x ~= 1 )
      j = j + 1;
      if ( mod ( x, 2 ) == 0 )
        x = x / 2;
      else
        x = 3 * x + 1;
      end
    end

    j_max = max ( j_max, j );

  end

  return
end


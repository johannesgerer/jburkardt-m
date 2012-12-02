function p = prime_ge ( n )

%*****************************************************************************80
%
%% PRIME_GE returns the smallest prime greater than or equal to N.
%
%  Discussion:
%
%    The MATLAB version of this program is made much simpler
%    because of the availability of the IS_PRIME logical function.
%
%  Example:
%
%    N     PRIME_GE
%
%    -10    2
%      1    2
%      2    2
%      3    3
%      4    5
%      5    5
%      6    7
%      7    7
%      8   11
%      9   11
%     10   11
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number to be bounded.
%
%    Output, integer P, the smallest prime number that is greater
%    than or equal to N.  
%
  p = max ( ceil ( n ), 2 );
  
  while ( ~ isprime ( p ) )
      p = p + 1;
  end

  return
end

  

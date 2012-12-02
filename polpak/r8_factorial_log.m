function value = r8_factorial_log ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL_LOG computes the natural logarithm of the factorial N!
%
%  Discussion:
%
%    LOG ( FACTORIAL ( N ) )
%      = LOG ( product ( 1 <= I <= N ) I )
%      = sum ( ( 1 <= I <= N ) LOG ( I ) )
%
%    Since 
%
%      FACTORIAL ( N ) = GAMMA ( N + 1 ),
%
%    and since MATLAB supplies in GAMMLN the logarithm of the Gamma
%    function, we may replace the calculation by a call to GAMMLN.
%
%    Thanks to Michael Baudin for suggesting this improvement,
%    which is faster and more accurate and vectorizes, 09 February 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the factorial function.
%    If N is less than 1, VALUE is returned as 0.
%
%    Output, real VALUE, the logarithm of the factorial of N.
%
  value = gammaln ( n + 1 );

  return
end

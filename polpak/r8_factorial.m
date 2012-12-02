function value = r8_factorial ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL returns N factorial.
%
%  Discussion:
%
%    factorial ( N ) = Product ( 1 <= I <= N ) I
%
%    Since
%
%      factorial ( N ) = GAMMA ( N + 1 )
%
%    and MATLAB provides a GAMMA function, we can use that instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%    0 <= N.
%
%    Output, real VALUE, the factorial of N.
%
  value = gamma ( n + 1 );

  return
end


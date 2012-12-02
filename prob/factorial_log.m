function value = factorial_log ( n )

%*****************************************************************************80
%
%% FACTORIAL_LOG returns the logarithm of N!.
%
%  Discussion:
%
%    N! = Product ( 1 <= I <= N ) I
%
%    N! = Gamma(N+1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
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
%    Output, real FACTORIAL_LOG, the logarithm of N!.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FACTORIAL_LOG - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'FACTORIAL_LOG - Fatal error!' );
  end

  value = 0.0;

  for i = 2 : n
    value = value + log ( i );
  end

  return
end

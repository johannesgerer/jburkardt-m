function [ x, w ] = cce ( l )

%*****************************************************************************80
%
%% CCE computes a Clenshaw Curtis Exponential quadrature rule based on level.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [0,1].
%
%    The integral to approximate:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The input value of L selects the size of the rule as follows:
%    L = 1, N = 1;
%    1 < L, N = 2^(L-1)+1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level of the rule.
%    1 <= L.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CCE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'CCE - Fatal error!' );
  end
%
%  Find the value of N according to the level.
%
  n = cce_order ( l );
%
%  Compute the points and weights.
%
  [ x, w ] = cc ( n );

  return
end

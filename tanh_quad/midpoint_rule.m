function [ x, w ] = midpoint_rule ( n )

%*****************************************************************************80
%
%% MIDPOINT_RULE computes a midpoint quadrature rule.
%
%  Discussion:
%
%    2*N+1 equally spaced points in [-1,1] are defined, but the endpoints
%    are not used in the rule.
%
%    This rule is useful in cases where there is a singularity at one
%    or both endpoints of the interval.
%
%    This rule will nest, with N = 0, 1, 3, 7, 15, 31, ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the quadrature order.
%
%    Output, real X(-N:N), the abscissas.
%
%    Output, real W(-N:N), the weights.
%
  offset = n + 1;

  i = [ -n : n ];

  x(i+offset) = ( i ) / ( n + 1 );

  w(-n+offset:n+offset) = 2.0 / ( 2 * ( n + 1 ) );
%
%  If I correct W(-N) and W(N) in this slightly awkward way,
%  I correctly include the special case where N = 0.
%
  w(-n+offset) = w(-n+offset) + 1.0 / ( 2 * ( n + 1 ) );
  w( n+offset) = w( n+offset) + 1.0 / ( 2 * ( n + 1 ) );

  return
end

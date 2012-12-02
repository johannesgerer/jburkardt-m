function [ x, w ] = tanh_rule ( n, h )

%*****************************************************************************80
%
%% TANH_RULE computes a tanh-sinh quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the quadrature order.
%
%    Input, real H, the spacing.
%
%    Output, real X(-N:N), the abscissas.
%
%    Output, real W(-N:N), the weights.
%
  offset = n + 1;

  i = [ -n : n ];

  t = i * h / 2.0;

  ct = cosh ( t );

  x(i+offset) = tanh ( t );
  w(i+offset) = 0.5 * h ./ ct ./ ct;

  return
end

function [ x, w ] = tanh_sinh_rule ( n, h )

%*****************************************************************************80
%
%% TANH_SINH_RULE computes a tanh-sinh quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2009
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

  t = i * h;

  ct = cosh ( t );
  st = sinh ( t );
  ct2 = cosh ( 0.5 * pi * st );

  x(i+offset) = tanh ( 0.5 * pi * st );

  w(i+offset) = 0.5 * pi * h * ct ./ ct2 ./ ct2;

  return
end

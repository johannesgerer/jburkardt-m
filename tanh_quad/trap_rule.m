function [ x, w ] = trap_rule ( n )

%*****************************************************************************80
%
%% TRAP_RULE computes a trapezoid quadrature rule.
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
%    Output, real X(-N:N), the abscissas.
%
%    Output, real W(-N:N), the weights.
%
  offset = n + 1;

  for i = -n : n
    x(i+offset) = i / n;
  end

  w(-n+offset)              = 1.0;
  w(-n+1+offset:n-1+offset) = 2.0;
  w(+n+offset)              = 1.0;

  w(-n+offset:n+offset) = w(-n+offset:n+offset) /  ( 2 * n );

  return
end

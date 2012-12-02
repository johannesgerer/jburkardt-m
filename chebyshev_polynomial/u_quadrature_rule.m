function [ t, w ] = u_quadrature_rule ( n )

%*****************************************************************************80
%
%% U_QUADRATURE_RULE: quadrature rule for U(n,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real T(N,1), W(N,1), the points and weights of the rule.
%
  aj = zeros ( n, 1 );

  bj = 0.5 * ones ( n, 1 );

  w = zeros ( n, 1 );
  w(1,1) = sqrt ( pi / 2.0 );

  [ t, w ] = imtqlx ( n, aj, bj, w );

  w(1:n,1) = w(1:n,1).^2;

  return
end


function weight = nc_rule ( norder, a, b, xtab )

%*****************************************************************************80
%
%% NC_RULE computes the weights of a Newton-Cotes quadrature rule.
%
%  Discussion:
%
%    For the interval [A,B], the Newton-Cotes quadrature rule estimates
%
%      Integral ( A <= X <= B ) F(X) dX
%
%    using NORDER equally spaced abscissas XTAB(I) and a weight vector
%    WEIGHT(I):
%
%      Sum ( 1 <= I <= N ) WEIGHT(I) * F ( XTAB(I) ).
%
%    For the CLOSED rule, the abscissas include the points A and B.
%    For the OPEN rule, the abscissas do not include A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real A, B, the left and right endpoints of the interval
%    over which the quadrature rule is to be applied.
%
%    Input, real XTAB(NORDER), the abscissas of the rule.
%
%    Output, real WEIGHT(NORDER), the weights of the rule.
%
  for i = 1 : norder
%
%  Compute the Lagrange basis polynomial which is 1 at XTAB(I),
%  and zero at the other nodes.
%
    poly_cof = r8poly_basis_1 ( i, norder, xtab );
%
%  Evaluate the antiderivative of the polynomial at the left and
%  right endpoints.
%
    yvala = r8poly_ant_val ( norder-1, poly_cof, a );

    yvalb = r8poly_ant_val ( norder-1, poly_cof, b );

    weight(i) = yvalb - yvala;

  end

  return
end

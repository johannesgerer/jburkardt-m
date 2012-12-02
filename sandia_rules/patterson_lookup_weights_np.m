function w = patterson_lookup_weights_np ( n, np, p )

%*****************************************************************************80
%
%% PATTERSON_LOOKUP_WEIGHTS_NP sets weights for a Patterson rule.
%
%  Discussion:
%
%    The zeroth rule, of order 1, is the standard Gauss-Legendre rule.
%
%    The first rule, of order 3, is the standard Gauss-Legendre rule.
%
%    The second rule, of order 7, includes the abscissas of the previous
%    rule.
%
%    Each subsequent rule is nested in a similar way.  Rules are available
%    of orders 1, 3, 7, 15, 31, 63, 127, 255 and 511.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Prem Kythe, Michael Schaeferkotter,
%    Handbook of Computational Methods for Integration,
%    Chapman and Hall, 2004,
%    ISBN: 1-58488-428-2,
%    LC: QA299.3.K98.
%
%    Thomas Patterson,
%    The Optimal Addition of Points to Quadrature Formulae,
%    Mathematics of Computation,
%    Volume 22, Number 104, October 1968, pages 847-856.
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%    Legal values are 1, 3, 7, 15, 31, 63, 127, 255 and 255.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real W(ORDER), the weights of the rule.
%    The weights are positive, symmetric and should sum to 2.
%
  w = patterson_lookup_weights ( n );

  return
end

function x = patterson_lookup_points_np ( n, np, p )

%*****************************************************************************80
%
%% PATTERSON_LOOKUP_POINTS_NP returns abscissas of a Patterson rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [-1,1];
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2011
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
%    Legal values are 1, 3, 7, 15, 31, 63, 127, 255 and 511.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real X(N), the abscissas.
%
  x = patterson_lookup_points ( n );

  return
end

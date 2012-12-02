function x = hermite_compute_points_np ( order, np, p )

%*****************************************************************************80
%
%% HERMITE_COMPUTE_POINTS_NP computes the abscissas of a Hermite quadrature rule.
%
%  Discussion:
%
%    This is simply a convenient user interface.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2009
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real X(ORDER), the abscissas of the rule.
%
  [ x, w ] = hermite_compute ( order );

  return
end

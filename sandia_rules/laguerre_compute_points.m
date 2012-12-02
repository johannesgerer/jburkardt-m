function x = laguerre_compute_points ( order )

%*****************************************************************************80
%
%% LAGUERRE_COMPUTE_POINTS computes the abscissas of a Laguerre quadrature rule.
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
%    12 August 2009.
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
%    ORDER must be greater than 0.
%
%    Output, real X(ORDER), the abscissas of the rule.
%
  [ x, w ] = laguerre_compute ( order );

  return
end

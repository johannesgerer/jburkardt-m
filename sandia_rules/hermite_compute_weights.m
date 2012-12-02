function w = hermite_compute_weights ( order )

%*****************************************************************************80
%
%% HERMITE_COMPUTE_WEIGHTS computes the weights of a Hermite quadrature rule.
%
%  Discussion:
%
%    This is simply a convenient interface.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2009
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
%    Output, real W(ORDER), the weights of the rule.
%
  [ x, w ] = hermite_compute ( order );

  return
end

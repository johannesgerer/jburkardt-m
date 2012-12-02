function w = composite_weights ( order )

%*****************************************************************************80
%
%% COMPOSITE_WEIGHTS computes weights for a composite midpoint rule.
%
%  Discussion:
%
%     Right now, our composite rule is assumed to be a composition of
%     1 point rules, applied to the interval [-1,1], with equal spacing.
%
%     Except for the rule of order 1, the endpoints are included
%     as abscissas.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  a = -1.0;
  b = +1.0;

  if ( order == 1 )
    w(1) = b - a;
  else
    w(1)         = ( b - a ) / ( order - 1 ) / 2.0;
    w(2:order-1) = ( b - a ) / ( order - 1 );
    w(order)     = ( b - a ) / ( order - 1 ) / 2.0;
  end

  return
end

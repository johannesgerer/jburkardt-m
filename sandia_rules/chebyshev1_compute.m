function [ x, w ] = chebyshev1_compute ( order )

%*****************************************************************************80
%
%% CHEBYSHEV1_COMPUTE computes a Chebyshev type 1 quadrature rule.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function is w(x) = 1.0 / sqrt ( 1 - x^2 ).
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) / sqrt ( 1 - x^2 ) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2008
%
%  Author:
%
%    John Burkardt
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
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV1_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'CHEBYSHEV1_COMPUTE - Fatal error!' );
  end

  w(1:order,1) = pi / order;

  x = zeros ( order, 1 );

  for i = 1 : order
    x(i) = cos ( pi * ( 2 * order + 1 - 2 * i ) / ( 2 * order ) );
  end

  return
end

function [ x, w ] = clenshaw_curtis_compute ( order )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_COMPUTE computes a Clenshaw Curtis quadrature rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [-1,1].
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
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
%    15 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    1 <= ORDER.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLENSHAW_CURTIS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'CLENSHAW_CURTIS_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );

  if ( order == 1 )
    x(1) = 0.0;
    w(1) = 2.0;
    return
  end

  for i = 1 : order
    x(i) = cos ( ( order - i ) * pi / ( order - 1 ) );
  end

  x(1) = -1.0;
  if ( mod ( order, 2 ) == 1 )
    x((order+1)/2) = 0.0;
  end
  x(order) = +1.0;

  for i = 1 : order

    theta = ( i - 1 ) * pi / ( order - 1 );

    w(i) = 1.0;

    for j = 1 : ( order - 1 ) / 2

      if ( 2 * j == ( order - 1 ) )
        b = 1.0;
      else
        b = 2.0;
      end

      w(i) = w(i) - b * cos ( 2.0 * j * theta ) / ( 4 * j * j - 1 );

    end

  end

  w(1)         =       w(1)         / ( order - 1 );
  w(2:order-1) = 2.0 * w(2:order-1) / ( order - 1 );
  w(order)     =       w(order)     / ( order - 1 );

  return
end

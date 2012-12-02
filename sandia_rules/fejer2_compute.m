function [ x, w ] = fejer2_compute ( order )

%*****************************************************************************80
%
%% FEJER2_COMPUTE computes a Fejer Type 2 quadrature rule.
%
%  Discussion:
%
%    Our convention is that the points are numbered from left to right.
%
%    The rule is defined on [-1,+1].
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
    fprintf ( 1, 'FEJER2_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'FEJER2_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );

  if ( order == 1 )
    x(1) = 0.0;
    w(1) = 2.0;
    return
  end

  for i = 1 : order
    x(i) = cos ( ( order + 1 - i ) * pi / ( order + 1 ) );
  end

  if ( mod ( order, 2 ) == 1 )
    x((order+1)/2) = 0.0;
  end

  if ( order == 2 )

    w(1:2) = 1.0;

  else

    for i = 1 : order

      theta = ( order + 1 - i ) * pi / ( order + 1 );

      w(i) = 1.0;

      for j = 1 : ( ( order - 1 ) / 2 )
        w(i) = w(i) - 2.0 * cos ( 2.0 * j * theta ) / ( 4 * j * j - 1 );
      end

      p = 2.0 * ( ( order + 1 ) / 2 ) - 1.0;
      w(i) = w(i) - cos ( ( p + 1.0 ) * theta ) / p;

    end

    w(1:order) = 2.0 * w(1:order) / ( order + 1 );

  end

  return
end

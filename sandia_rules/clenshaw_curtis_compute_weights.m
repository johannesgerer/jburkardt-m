function w = clenshaw_curtis_compute_weights ( order )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_COMPUTE_WEIGHTS computes Clenshaw Curtis weights.
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
%    John Burkardt
%
%  Reference:
%
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLENSHAW_CURTIS_COMPUTE_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'CLENSHAW_CURTIS_COMPUTE_WEIGHTS - Fatal error!' );
  end

  w = zeros ( order, 1 );

  if ( order == 1 )
    w(1) = 2.0;
    return
  end

  for i = 1 : order

    theta = ( i - 1 ) * pi / ( order - 1 );

    w(i) = 1.0;

    for j = 1 : floor ( ( order - 1 ) / 2 )

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

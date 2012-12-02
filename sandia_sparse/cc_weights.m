function w = cc_weights ( n )

%*****************************************************************************80
%
%% CC_WEIGHTS computes Clenshaw Curtis weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
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
%    Input, integer N, the order of the rule.
%
%    Output, real W(N), the weights of the rule.
%
  if ( n == 1 )
    w(1) = 2.0;
    return
  end

  for i = 1 : n
    theta(i) = ( i - 1 ) * pi / ( n - 1 );
  end

  for i = 1 : n

    w(i) = 1.0;

    for j = 1 : floor ( ( n - 1 ) / 2 )

      if ( 2 * j == ( n - 1 ) )
        b = 1.0;
      else
        b = 2.0;
      end

      w(i) = w(i) - b * cos ( 2.0 * j * theta(i) ) / ( 4 * j * j - 1 );

    end

  end

  w(1)     =       w(1)     / ( n - 1 );
  w(2:n-1) = 2.0 * w(2:n-1) / ( n - 1 );
  w(n)     =       w(n)     / ( n - 1 );

  return
end

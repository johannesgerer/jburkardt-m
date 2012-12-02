function [ x, w ] = ccc_rule ( n )

%*****************************************************************************80
%
%% CCC_RULE computes a Clenshaw Curtis closed rule.
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
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
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
%    Input, integer N, the order of the rule.
%    1 <= N.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  w = zeros ( n, 1 );
  x = zeros ( n, 1 );

  if ( n == 1 )
    x(1) = 0.0;
    w(1) = 2.0;
    return
  end

  x = ( n - 1 : -1 : 0 )';
  x = x / ( n - 1 );
%
%  Chebyshev tranformation from [0,1] to [-1,+1].
%
  x = cos ( pi * x );
%
%  Compute the weights.
%
  for i = 1 : n

    theta = ( i - 1 ) * pi / ( n - 1 );

    w(i) = 1.0;

    for j = 1 : ( n - 1 ) / 2

      if ( 2 * j == ( n - 1 ) )
        b = 1.0;
      else
        b = 2.0;
      end

      w(i) = w(i) - b * cos ( 2.0 * j * theta ) / ( 4 * j * j - 1 );

    end

  end

  w(1)     =       w(1)     / ( n - 1 );
  w(2:n-1) = 2.0 * w(2:n-1) / ( n - 1 );
  w(n)     =       w(n)     / ( n - 1 );

  return
end

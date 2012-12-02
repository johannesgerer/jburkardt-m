function [ x, w ] = ccu ( l )

%*****************************************************************************80
%
%% CCU computes a Clenshaw Curtis quadrature rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [0,1].
%
%    The integral to approximate:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The input value of L selects the size of the rule as follows:
%    L = 1, N = 1;
%    1 < L, N = 2^(L-1)+1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level of the rule.
%    1 <= L.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  if ( l == 1 )
    n = 1;
  else
    n = 2^(l-1) + 1;
  end

  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CCU - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'CCU - Fatal error!' );
  end

  w = zeros ( n, 1 );
  x = zeros ( n, 1 );

  if ( n == 1 )

    x(1) = 0.0;
    w(1) = 2.0;

  else

    for i = 1 : n
      x(i) = cos ( ( n - i ) * pi / ( n - 1 ) );
    end

    x(1) = -1.0;
    if ( mod ( n, 2 ) == 1 )
      x((n+1)/2) = 0.0;
    end
    x(n) = +1.0;

    w(1:n) = 1.0;

    for i = 1 : n

      theta = ( i - 1 ) * pi / ( n - 1 );

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

  end
%
%  Shift from [-1,+1] to [0,1].
%
  x(1:n) = 0.5 * ( x(1:n) + 1.0 );
  w(1:n) = 0.5 * w(1:n);

  return
end

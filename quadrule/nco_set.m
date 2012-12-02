function [ x, w ] = nco_set ( n )

%*****************************************************************************80
%
%% NCO_SET sets abscissas and weights for open Newton-Cotes quadrature.
%
%  Discussion:
%
%    The open Newton-Cotes rules use equally spaced abscissas, and
%    hence may be used with equally spaced data.
%
%    The rules are called "open" because they do not include the interval
%    endpoints.
%
%    Most of the rules involve negative weights.  These can produce loss
%    of accuracy due to the subtraction of large, nearly equal quantities.
%
%    The integral:
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
%    02 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Abramowitz and Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%    Daniel Zwillinger, editor,
%    Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be between 1 and 7, and 9.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    w(1) = 2.0;

  elseif ( n == 2 )

    w(1) = 1.0;
    w(2) = 1.0;

  elseif ( n == 3 )

    d = 3.0;

    w(1) =   4.0 / d;
    w(2) = - 2.0 / d;
    w(3) =   4.0 / d;

  elseif ( n == 4 )

    d = 12.0;

    w(1) = 11.0 / d;
    w(2) =  1.0 / d;
    w(3) =  1.0 / d;
    w(4) = 11.0 / d;

  elseif ( n == 5 )

    d = 10.0;

    w(1) =   11.0 / d;
    w(2) = - 14.0 / d;
    w(3) =   26.0 / d;
    w(4) = - 14.0 / d;
    w(5) =   11.0 / d;

  elseif ( n == 6 )

    d = 1440.0;

    w(1) =  1222.0 / d;
    w(2) = - 906.0 / d;
    w(3) =  1124.0 / d;
    w(4) =  1124.0 / d;
    w(5) = - 906.0 / d;
    w(6) =  1222.0 / d;

  elseif ( n == 7 )

    d = 945.0;

    w(1) =    920.0 / d;
    w(2) = - 1908.0 / d;
    w(3) =   4392.0 / d;
    w(4) = - 4918.0 / d;
    w(5) =   4392.0 / d;
    w(6) = - 1908.0 / d;
    w(7) =    920.0 / d;

  elseif ( n == 9 )

    d = 4536.0;

    w(1) =    4045.0 / d;
    w(2) = - 11690.0 / d;
    w(3) =   33340.0 / d;
    w(4) = - 55070.0 / d;
    w(5) =   67822.0 / d;
    w(6) = - 55070.0 / d;
    w(7) =   33340.0 / d;
    w(8) = - 11690.0 / d;
    w(9) =    4045.0 / d;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCO_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    fprintf ( 1, '  Legal values are 1 to 7, and 9.\n' );
    error ( 'NCO_SET - Fatal error!' );

  end
%
%  Set the abscissas.
%
  for i = 1 : n
    x(i) = ( 2 * i - n - 1 ) / ( n + 1 );
  end

  return
end

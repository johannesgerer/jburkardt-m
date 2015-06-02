function l = lobatto_polynomial_value ( m, n, x )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_VALUE evaluates the completed Lobatto polynomials Lo(n,x).
%
%  Discussion:
%
%    L(N,X) = ( 1 - X^2 ) * P'(N,X)
%           = N * ( P(N-1,X) - X * P(N,X) ) 
%
%    The Lobatto polynomials are 0 at -1 and +1.
%
%    L( 1,x) = (1-x^2) * 1
%    L( 2,x) = (1-x^2) * 3X
%    L( 3,x) = (1-x^2) * ( -3 + 15x^2 ) / 2
%    L( 4,x) = (1-x^2) * ( -60x + 140x^3 ) / 8
%    L( 5,x) = (1-x^2) * ( -15 - 210x^2 + 315x^4 ) / 8
%    L( 6,x) = (1-x^2) * ( 210x - 1260x^3 + 1386x^5 ) / 16
%    L( 7,x) = (1-x^2) * ( -35 + 945x^2 - 3465x^4 + 3003x^6 ) / 16
%    L( 8,x) = (1-x^2) * ( -2520x + 27720x^3 - 72072x^5 + 51480x^7 ) / 128
%    L( 9,x) = (1-x^2) * ( 315 - 13860x^2 + 90090x^4 - 180180x^6 + 109395x^8 ) / 128
%    L(10,x) = (1-x^2) * ( 6930x - 120120x^3 + 540540x^5 - 875160x^7 + 461890x^9 ) / 256
%
%    Mathematica: (replacing "n" by desired index):
%
%      Expand [ ( 1-x^2) * D [ LegendreP[n,x], {x} ] ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Larry Andrews,
%    Special Functions of Mathematics for Engineers,
%    Second Edition,
%    Oxford University Press, 1998,
%    ISBN: 0819426164,
%    LC: QA351.A75.
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real L(M,N), the values of the completed Lobatto
%    polynomials of order 1 through N at the point X.
%
  l = zeros ( m, n );

  if ( 1 <= n )

    x = x(:);
    l(1:m,1) = ( 1.0 - x(1:m,1).^2 );

    if ( 2 <= n )

      p = zeros ( m, n + 1 );
 
      p(1:m,1) = 1.0;
      p(1:m,2) = x(1:m,1);

      for j = 2 : n
        p(1:m,j+1) = ( ( 2 * j - 1 ) * x(1:m,1) .* p(1:m,j)     ...
                     - (     j - 1 ) *             p(1:m,j-1) ) ...
                     / (     j     );
      end

      for j = 2 : n
        l(1:m,j) = j * ( p(1:m,j) - x(1:m,1) .* p(1:m,j+1) );
      end

    end

  end

  return
end

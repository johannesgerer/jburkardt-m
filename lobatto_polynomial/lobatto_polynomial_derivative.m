function lp = lobatto_polynomial_derivative ( m, n, x )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_DERIVATIVE: derivative of completed Lobatto polynomial.
%
%  Discussion:
%
%    L(N,X)  =  N * ( P(N-1,X) - X * P(N,X) ) 
%    L'(N,X) =  N * ( P'(N-1,X) - P(N,X) - X * P'(N,X) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 November 2014
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
%    Output, real LP(M,N), the derivative of the completed Lobatto
%    polynomials of order 1 through N at the point X.
%
  lp = zeros ( m, n );

  if ( 1 <= n )

    x = x(:);

    lp(1:m,1) = - 2.0 * x(1:m,1);

    if ( 2 <= n )

      p = zeros ( m, n + 1 );
      p(1:m,1) = 1.0;
      p(1:m,2) = x(1:m,1);
      for j = 2 : n
        p(1:m,j+1) = ( ( 2 * j - 1 ) * x(1:m,1) .* p(1:m,j)     ...
                     - (     j - 1 ) *             p(1:m,j-1) ) ...
                     / (     j     );
      end

      pp = zeros ( m, n + 1 );
      pp(1:m,1) = 0.0;
      pp(1:m,2) = 1.0;
      for j = 2 : n
        pp(1:m,j+1) = ( ( 2 * j - 1 ) * ( p(1:m,j) + x(1:m,1) .* pp(1:m,j) )   ...
                      - (     j - 1 ) *                          pp(1:m,j-1) ) ...
                      / (     j     );
      end

      for j = 2 : n
        lp(1:m,j) = ...
          j * ( pp(1:m,j) - p(1:m,j+1) - x(1:m,1) .* pp(1:m,j+1) );
      end

    end

  end

  return
end

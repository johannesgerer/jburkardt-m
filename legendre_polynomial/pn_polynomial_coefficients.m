function c = pn_polynomial_coefficients ( n )

%*****************************************************************************80
%
%% PN_POLYNOMIAL_COEFFICIENTS: coefficients of normalized Legendre Pn(n,x).
%
%  Discussion:
%
%    Pn(n,x) = P(n,x) * sqrt ( (2n+1)/2 )
%
%          1       x       x^2     x^3     x^4      x^5    x^6     x^7
%
%    0   0.707
%    1   0.000   1.224
%    2  -0.790   0.000   2.371
%    3   0.000  -2.806   0.000   4.677
%    4   0.795   0.000  -7.954   0.000   9.280
%    5   0.000   4.397   0.000 -20.520   0.000   18.468
%    6  -0.796   0.000  16.731   0.000 -50.193    0.000  36.808
%    7   0.000  -5.990   0.000  53.916   0.000 -118.616   0.000  73.429 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the normalized Legendre 
%    polynomials of degree 0 through N.  Each polynomial is stored as a row.
%
  if ( n < 0 )
    c = [];
    return
  end
%
%  Compute P(n,x) coefficients.
%
  c(1:n+1,1:n+1) = 0.0;

  c(1,1) = 1.0;

  if ( 0 < n )
    c(2,2) = 1.0;
  end

  for i = 2 : n
    c(i+1,1:i-1) =                (   - i + 1 ) * c(i-1,1:i-1) / ( i );
    c(i+1,2:i+1) = c(i+1,2:i+1) + ( i + i - 1 ) * c(i  ,1:i  ) / ( i );
  end
%
%  Normalize them.
%
  for i = 0 : n
    t = sqrt ( ( 2 * i + 1 ) / 2.0 );
    c(i+1,0+1:i+1) = c(i+1,0+1:i+1) * t;
  end

  return
end

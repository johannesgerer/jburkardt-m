function p = he_polynomial_value ( m, n, x )

%*****************************************************************************80
%
%% HE_POLYNOMIAL_VALUE evaluates He(i,x).
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
%
%  Differential equation:
%
%    ( exp ( - 0.5 * x^2 ) * He(n,x)' )' + n * exp ( - 0.5 * x^2 ) * He(n,x) = 0
%
%  First terms:
%
%   1
%   X
%   X^2  -  1
%   X^3  -  3 X
%   X^4  -  6 X^2 +   3
%   X^5  - 10 X^3 +  15 X
%   X^6  - 15 X^4 +  45 X^2 -   15
%   X^7  - 21 X^5 + 105 X^3 -  105 X
%   X^8  - 28 X^6 + 210 X^4 -  420 X^2 +  105
%   X^9  - 36 X^7 + 378 X^5 - 1260 X^3 +  945 X
%   X^10 - 45 X^8 + 630 X^6 - 3150 X^4 + 4725 X^2 - 945
%
%  Recursion:
%
%    He(0,X) = 1,
%    He(1,X) = X,
%    He(N,X) = X * He(N-1,X) - (N-1) * He(N-2,X)
%
%  Orthogonality:
%
%    Integral ( -oo < X < +oo ) exp ( - 0.5 * X^2 ) * He(M,X) He(N,X) dX 
%    = sqrt ( 2 * pi ) * N! * delta ( N, M )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2012
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
%    Frank Olver, Daniel Lozier, Ronald Boisvert, Charles Clark,
%    NIST Handbook of Mathematical Functions,
%    Cambridge University Press, 2010,
%    ISBN: 978-0521192255,
%    LC: QA331.N57.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real P(M,N+1), the values of the probabilist's Hermite polynomials 
%    of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = x(1:m,1) .* p(1:m,j) - ( j - 1 ) * p(1:m,j-1);
  end
 
  return
end

function p = h_polynomial_value ( m, n, x )

%*****************************************************************************80
%
%% H_POLYNOMIAL_VALUE evaluates H(i,x).
%
%  Discussion:
%
%    H(i,x) is the physicist's Hermite polynomial of degree I.
%
%  Differential equation:
%
%    Y'' - 2 X Y' + 2 N Y = 0
%
%  First terms:
%
%      1
%      2 X
%      4 X^2     -  2
%      8 X^3     - 12 X
%     16 X^4     - 48 X^2     + 12
%     32 X^5    - 160 X^3    + 120 X
%     64 X^6    - 480 X^4    + 720 X^2    - 120
%    128 X^7   - 1344 X^5   + 3360 X^3   - 1680 X
%    256 X^8   - 3584 X^6  + 13440 X^4  - 13440 X^2   + 1680
%    512 X^9   - 9216 X^7  + 48384 X^5  - 80640 X^3  + 30240 X
%   1024 X^10 - 23040 X^8 + 161280 X^6 - 403200 X^4 + 302400 X^2 - 30240
%
%  Recursion:
%
%    H(0,X) = 1,
%    H(1,X) = 2*X,
%    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
%
%  Orthogonality:
%
%    Integral ( -oo < X < +oo ) exp ( - X^2 ) * H(M,X) H(N,X) dX 
%    = sqrt ( pi ) * 2^N * N! * delta ( N, M )
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
%    Output, real P(M,N+1), the values of the physicist's Hermite polynomials 
%    of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = 2.0 * x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = 2.0 * x(1:m,1) .* p(1:m,j) - 2.0 * ( j - 1 ) * p(1:m,j-1);
  end
 
  return
end

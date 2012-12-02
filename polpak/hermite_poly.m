function cx = hermite_poly ( n, x )

%*****************************************************************************80
%
%% HERMITE_POLY evaluates the Hermite polynomials at X.
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
%  Norm:
%
%    Integral ( -oo < X < oo ) exp ( - X^2 ) * H(N,X)^2 dX
%    = sqrt ( pi ) * 2^N * N!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
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
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, real X, the point at which the polynomials are to be evaluated.
%
%    Output, real CX(1:N+1,1), the values of the first N+1 Hermite
%    polynomials at the point X.
%
  if ( n < 0 )
    cx = [];
    return
  end

  cx = zeros ( n + 1, 1 );

  cx(1) = 1.0;

  if ( n == 0 )
    return
  end

  cx(2) = 2.0 * x;
 
  for i = 2 : n
    cx(i+1) = 2.0 * x * cx(i) - 2.0 * ( i - 1 ) * cx(i-1);
  end
 
  return
end

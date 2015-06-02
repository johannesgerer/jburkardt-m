function a = colleague ( n, c )

%*****************************************************************************80
%
%% COLLEAGUE returns the COLLEAGUE matrix.
%
%  Discussion:
%
%    The colleague matrix is an analog of the companion matrix, adapted
%    for use with polynomials represented by a sum of Chebyshev polynomials.
%
%    Let the N-th degree polynomial be defined by
%
%      P(X) = C(N)*T_N(X) + C(N-1)*T_(N-1)(X) + ... + C(1)*T1(X) + C(0)*T0(X)
%
%    where T_I(X) is the I-th Chebyshev polynomial.
%
%    Then the roots of P(X) are the eigenvalues of the colleague matrix A(C):
%
%        0   1   0   ...  0                        0    0    0   ...   0
%       1/2  0  1/2  ...  0                        0    0    0   ...   0
%        0  1/2  0   ...  0      - 1/(2*C(N)) *    0    0    0   ...   0
%       ... ... ...  ... ...                      ...  ...  ...  ...  ...
%       ... ... ...   0  1/2                      ...  ...  ...  ...   0
%       ... ... ...  1/2  0                       C(0) C(1) C(2) ... C(N-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    I J Good,
%    The Colleague Matrix: A Chebyshev Analogue of the Companion Matrix,
%    The Quarterly Journal of Mathematics,
%    Volume 12, Number 1, 1961, pages 61-68.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real C(1:N+1), the coefficients of the polynomial.
%    C(N+1) should not be zero.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  if ( n == 1 )

    a(1,1) = - c(1) / c(2);

  else

    a(1,2) = 1.0;
 
    for i = 2 : n
      a(i,i-1) = 0.5;
    end

    for i = 2 : n - 1
      a(i,i+1) = 0.5;
    end

    a(n,1:n) = a(n,1:n) - 0.5 * c(1:n) / c(n+1);
 
  end

  return
end

function a = cheby_van1 ( m, a, b, n, x )

%*****************************************************************************80
%
%% CHEBY_VAN1 returns the Chebyshev Vandermonde-like matrix for [A,B].
%
%  Discussion:
%
%    Normally, the Chebyshev polynomials are defined on -1 <= XI <= +1.
%    Here, we assume the Chebyshev polynomials have been defined on the
%    interval A <= X <= B, using the mapping
%      XI = ( - ( B - X ) + ( X - A ) ) / ( B - A )
%    so that
%      ChebyAB(A,B;X) = Cheby(XI).
%
%    if ( I == 1 ) then
%      V(1,1:N) = 1;
%    elseif ( I == 2 ) then
%      V(2,1:N) = XI(1:N);
%    else
%      V(I,1:N) = 2.0 * XI(1:N) * V(I-1,1:N) - V(I-2,1:N);
%
%  Example:
%
%    M = 5, A = -1, B = +1, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  1   1    1    1
%    1  2   3    4    5
%    1  7  17   31   49
%    1 26  99  244  485
%    1 97 577 1921 4801
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nicholas Higham,
%    Stability analysis of algorithms for solving confluent
%    Vandermonde-like systems,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 11, 1990, pages 23-41.
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%
%    Input, real A, B, the interval.
%
%    Input, integer N, the number of values in X, and the number
%    of columns in the matrix.
%
%    Input, real X(N), the abscissas.
%
%    Output, real V(M,N), the matrix.
%

%
%  It is convenient to force X to be a row vector.
%
  x = ( x ( : ) )';
%
%  Compute the normalized abscissas in [-1,+1].
%
  xi(1,1:n) = ( - 1.0 * ( b - x(1,1:n)     )   ...
                + 1.0 * (     x(1,1:n) - a ) ) ...
              /         ( b            - a );
%
%  Compute the matrix.
%
  v = zeros ( m, n );

  v(1,1:n) = 1.0;
  v(2,1:n) = xi(1,1:n);

  for i = 3 : m
    v(i,1:n) = 2.0 * xi(1,1:n) .* v(i-1,1:n) - v(i-2,1:n);
  end

  return
end

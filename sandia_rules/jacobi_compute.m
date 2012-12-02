function [ x, w ] = jacobi_compute ( n, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_COMPUTE: Elhay-Kautsky method for Gauss-Jacobi quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      integral ( -1 <= x <= 1 ) (1-x)^alpha * (1+x)^beta * f(x) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2011
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real ALPHA, BETA, the exponents of (1-X) and
%    (1+X) in the quadrature rule.  For simple Gauss-Legendre quadrature,
%    set ALPHA = BETA = 0.0.  -1.0 < ALPHA and -1.0 < BETA are required.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the zero-th moment.
%
  zemu = 2.0^( alpha + beta + 1.0 ) ...
    * gamma ( alpha + 1.0 ) ...
    * gamma ( beta + 1.0 ) ...
    / gamma ( 2.0 + alpha + beta );
%
%  Define the Jacobi matrix.
%
  x(1) = ( beta - alpha ) / ( 2.0 + alpha + beta );

  bj(1) = 4.0 * ( 1.0 + alpha ) * ( 1.0 + beta ) ...
    / ( ( 3.0 + alpha + beta ) * ( 2.0 + alpha + beta )^2 );

  for i = 2 : n
    abi = 2.0 * i + alpha + beta;
    x(i) = ( beta + alpha ) * ( beta - alpha ) / ( ( abi - 2.0 ) * abi );
    bj(i) = 4.0 * i * ( i + alpha ) * ( i + beta ) ...
      * ( i + alpha + beta ) ...
      / ( ( abi - 1.0 ) * ( abi + 1.0 ) * abi * abi );
  end

  bj(1:n) = sqrt ( bj(1:n) );

  w = zeros(n,1);

  w(1) = sqrt ( zemu );
  w(2:n) = 0.0;
%
%  Diagonalize the Jacobi matrix.
%
  [ x, w ] = imtqlx ( n, x, bj, w );

  w(1:n) = w(1:n).^2;

  return
end

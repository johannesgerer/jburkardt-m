function [ x, w ] = j_quadrature_rule ( n, alpha, beta )

%*****************************************************************************80
%
%% J_QUADRATURE_RULE: Gauss-Jacobi quadrature based on J(n,a,b,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt.
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
%    Input, real ALPHA, BETA, the parameters.
%    -1 < ALPHA, BETA.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  ab = alpha + beta;
  abi = 2.0 + ab;
%
%  Define the zero-th moment.
%
  zemu = 2.0^( ab + 1.0 ) * gamma ( alpha + 1.0 ) ...
    * gamma ( beta + 1.0 ) / gamma ( abi );
%
%  Define the Jacobi matrix.
%
  x = zeros ( n, 1 );
  bj = zeros ( n, 1 );

  x(1) = ( beta - alpha ) / abi;
  bj(1) = 4.0 * ( 1.0 + alpha ) * ( 1.0 + beta ) ...
    / ( ( abi + 1.0 ) * abi * abi );
  a2b2 = beta * beta - alpha * alpha;

  for i = 2 : n
    abi = 2.0 * i + ab;
    x(i) = a2b2 / ( ( abi - 2.0 ) * abi );
    abi = abi^2;
    bj(i) = 4.0 * i * ( i + alpha ) * ( i + beta ) * ( i + ab ) ...
      / ( ( abi - 1.0 ) * abi );
  end
  bj(1:n) =  sqrt ( bj(1:n) );

  w = zeros ( n, 1 );
  w(1) = sqrt ( zemu );
%
%  Diagonalize the Jacobi matrix.
%
  [ x, w ] = imtqlx ( n, x, bj, w );

  w(1:n) = w(1:n).^2;

  return
end

function [ x , w ] = radau_compute ( n )

%*****************************************************************************80
%
%% RADAU_COMPUTE computes a Radau quadrature rule.
%
%  Discussion:
%
%    The Radau rule is distinguished by the fact that the left endpoint
%    (-1) is always an abscissa.
%
%    The integral:
%
%      integral ( -1 <= x <= 1 ) f(x) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%    The quadrature rule will integrate exactly all polynomials up to
%    X**(2*N-2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2007
%
%  Author:
%
%    Original MATLAB code by Greg von Winckel.
%    This MATLAB version by John Burkardt.
%
%  References:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Claudio Canuto, Yousuff Hussaini, Alfio Quarteroni, Thomas Zang,
%    Spectral Methods in Fluid Dynamics,
%    Springer, 1993,
%    ISNB13: 978-3540522058,
%    LC: QA377.S676.
%
%    Francis Hildebrand, 
%    Section 8.11,
%    Introduction to Numerical Analysis,
%    Dover, 1987,
%    ISBN13: 978-0486653631,
%    LC: QA300.H5.
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996,
%    ISBN: 0-8493-2479-3,
%    LC: QA47.M315.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be at least 1.
%
%    Output, real X(N), the abscissas
%
%    Output, real W(N), the weights.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RADAU_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    fprintf ( 1, '  N must be at least 1.\n' );
    error ( 'RADAU_COMPUTE - Fatal error!' );
  end
  
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  tolerance = 100.0 * eps;
%
%  Initial estimate for the abscissas is the Chebyshev-Gauss-Radau nodes.
%
  x(1:n,1) = - cos ( 2.0 * pi * ( 0 : n-1 ) / ( 2 * n - 1 ) )';
%
%  The Legendre Vandermonde matrix.
%
  p = zeros ( n, n+1 );
%
%  Compute P using the recursion relation.
%  Compute its first and second derivatives and 
%  update X using the Newton-Raphson method.
%
  xold(1:n,1) = 2.0;

  while ( tolerance < max ( abs ( x(1:n,1) - xold(1:n,1) ) ) )

    xold = x;
     
    p(1,1:n+1) = ( -1.0 ).^(0:n);

    p(2:n,1) = 1.0;
    p(2:n,2) = x(2:n,1);
       
    for j = 2 : n
      p(2:n,j+1) = ( ( 2 * j - 1 ) * x(2:n,1) .* p(2:n,j) ...
                    + (  - j + 1 ) *             p(2:n,j-1) ) ...
                    /      j;
    end
     
    x(2:n,1) = xold(2:n,1) - ( ( 1.0 - xold(2:n,1) ) / n ) ...
      .* ( p(2:n,n) + p(2:n,n+1) ) ./ ( p(2:n,n) - p(2:n,n+1) );
  end
% 
%  Compute the weights.
%
  w = zeros ( n, 1 );
  w(1) = 2 / n^2;
  w(2:n) = ( 1.0 - x(2:n,1) ) ./ ( n * p(2:n,n) ).^2;

  return
end

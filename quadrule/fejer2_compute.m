function [ x, w ] = fejer2_compute ( n )

%*****************************************************************************80
%
%% FEJER2_COMPUTE computes a Fejer type 2 quadrature rule.
%
%  Discussion:
%
%    This method uses a direct approach.  The paper by Waldvogel
%    exhibits a more efficient approach using Fourier transforms.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Walter Gautschi,
%    Numerical Quadrature in the Presence of a Singularity,
%    SIAM Journal on Numerical Analysis,
%    Volume 4, Number 3, 1967, pages 357-362.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  theta(1:n) = ( n : -1 : 1 ) * pi / ( n + 1 );
  x(1:n) = cos ( theta(1:n) );

  for i = 1 : n

    w(i) = 1;

    for j = 1 : floor ( ( n - 1 ) / 2 )
      w(i) = w(i) - 2 * cos ( 2 * j * theta(i) ) / ( 4 * j * j - 1 );
    end

    if ( 2 < n )
      p = 2 * floor ( ( n + 1 ) / 2 ) - 1;
      w(i) = w(i) - cos ( ( p + 1 ) * theta(i) ) / p;
    end

  end

  w(1:n) = 2 * w(1:n) / ( n + 1 );

  return
end

function e = legendre_monomial_quadrature ( n, x, w, p )

%*****************************************************************************80
%
%% LEGENDRE_MONOMIAL_QUADRATURE applies a quadrature rule to a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points in the rule.
%
%    Input, real X(N), the quadrature points.
%
%    Input, real W(N), the quadrature weights.
%
%    Input, integer P, the exponent.
%
%    Output, real E, the quadrature error.
%

%
%  Get the exact value of the integral.
%
  t = legendre_integral ( p );
%
%  Evaluate the monomial at the quadrature points.
%
  v(1:n,1) = x(1:n).^p;
%
%  Compute the weighted sum.
%
  q = w' * v;
%
%  Error:
%
  if ( t == 0.0 )
    e = abs ( q - t );
  else
    e = abs ( ( q - t ) / t );
  end

  return
end

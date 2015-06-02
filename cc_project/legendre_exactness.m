function legendre_exactness ( n, x, w, p_max )

%*****************************************************************************80
%
%% LEGENDRE_EXACTNESS: quadrature rule exactness for Legendre integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2014
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
%    Input, integer P_MAX, the maximum exponent.
%    0 <= P_MAX.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature rule of order %d for the Legendre integral.\n', n );
  fprintf ( 1, '  Degree          Relative Error\n' );
  fprintf ( 1, '\n' );

  for p = 0 : p_max

    e = legendre_monomial_quadrature ( n, x, w, p );

    fprintf ( 1, '  %6d  %24.16f\n', p, e );

  end

  return
end


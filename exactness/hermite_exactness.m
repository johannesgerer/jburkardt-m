function hermite_exactness ( n, x, w, p_max )

%*****************************************************************************80
%
%% HERMITE_EXACTNESS investigates exactness of Hermite quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 May 2014
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
  fprintf ( 1, '  Quadrature rule for Hermite integral\n' );
  fprintf ( 1, '  Rule of order N = %d\n', n );
  fprintf ( 1, '  Degree          Relative Error\n' );
  fprintf ( 1, '\n' );

  for p = 0 : p_max

    s = hermite_integral ( p );

    v(1:n,1) = x(1:n) .^ p;

    q = w' * v;

    if ( s == 0.0 )
      e = abs ( q - s );
    else
      e = abs ( ( q - s ) / s );
    end

    fprintf ( 1, '  %6d  %24.16f\n', p, e );

  end

  return
end

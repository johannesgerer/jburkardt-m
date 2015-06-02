function legendre_3d_exactness ( a, b, n, x, y, z, w, t )

%*****************************************************************************80
%
%% LEGENDRE_3D_EXACTNESS: monomial exactness for the 3D Legendre integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), the lower limits of integration.
%
%    Input, real B(3), the upper limits of integration.
%
%    Input, integer N, the number of points in the rule.
%
%    Input, real X(N), Y(N), Z(N), the quadrature points.
%
%    Input, real W(N), the quadrature weights.
%
%    Input, integer T, the maximum total degree.
%    0 <= T.
%
  x = x(:);
  y = y(:);
  z = z(:);
  w = w(:);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature rule for the 3D Legendre integral.\n' );
  fprintf ( 1, '  Number of points in rule is %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D   I       J       K          Relative Error\n' );

  for tt = 0 : t

    fprintf ( 1, '  %2d\n', tt );

    for k = 0 : tt

      for j = 0 : tt - k

        i = tt - j - k;

        p(1) = i;
        p(2) = j;
        p(3) = k;

        s = legendre_3d_monomial_integral ( a, b, p );

        v(1:n,1) = x(1:n,1) .^ p(1) .* y(1:n,1) .^ p(2) .* z(1:n,1) .^ p(3);

        q = w' * v;

        if ( s == 0.0 )
          e = abs ( q );
        else
          e = abs ( q - s ) / abs ( s );
        end

        fprintf ( 1, '  %6d  %6d  %6d  %24.16f\n', p(1:3), e );

      end

    end

  end

  return
end


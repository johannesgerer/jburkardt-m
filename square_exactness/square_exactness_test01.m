function square_exactness_test01 ( )

%*****************************************************************************80
%
%% SQUARE_EXACTNESS_TEST01: product Gauss-Legendre rules for Legendre 2D integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2014
%
%  Author:
%
%    John Burkardt
%
  a(1:2) = -1.0;
  b(1:2) = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_EXACTNESS_TEST01\n' );
  fprintf ( 1, '  Product Gauss-Legendre rules for the 2D Legendre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Region: -1 <= y <= +1.\n' );
  fprintf ( 1, '  Level: L\n' );
  fprintf ( 1, '  Exactness: 2*L+1\n' );
  fprintf ( 1, '  Order: N = (L+1)*(L+1)\n' );

  for l = 0 : 5

    n_1d = l + 1;
    n = n_1d * n_1d;
    t = 2 * l + 1;

    [ w, x, y ] = legendre_2d_set ( a, b, n_1d, n_1d );

    p_max = t + 1;
    legendre_2d_exactness ( a, b, n, x, y, w, p_max );

  end

  return
end

function cube_exactness_test01 ( )

%*****************************************************************************80
%
%% CUBE_EXACTNESS_TEST01 tests product Gauss-Legendre rules for the Legendre 3D integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2014
%
%  Author:
%
%    John Burkardt
%
  a(1:3) = -1.0;
  b(1:3) = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_EXACTNESS_TEST01\n' );
  fprintf ( 1, '  Product Gauss-Legendre rules for the 3D Legendre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '          -1 <= y <= +1.\n' );
  fprintf ( 1, '          -1 <= z <= +1.\n' );
  fprintf ( 1, '  Level: L\n' );
  fprintf ( 1, '  Exactness: 2*L+1\n' );
  fprintf ( 1, '  Order: N = (L+1)*(L+1)*(L+1)\n' );

  for l = 0 : 5

    nx = l + 1;
    ny = l + 1;
    nz = l + 1;
    n = nx * ny * nz;
    t = 2 * l + 1;

    [ x, y, z, w ] = legendre_3d_set ( a, b, nx, ny, nz );

    p_max = t + 1;
    legendre_3d_exactness ( a, b, n, x, y, z, w, p_max );

  end

  return
end

function cube_exactness_test02 ( )

%*****************************************************************************80
%
%% CUBE_EXACTNESS_TEST02 tests product Gauss-Legendre rules for the Legendre 3D integral.
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
  a(1:3) = -1.0;
  b(1:3) = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_EXACTNESS_TEST02\n' );
  fprintf ( 1, '  Product Gauss-Legendre rules for the 3D Legendre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '          -1 <= y <= +1.\n' );
  fprintf ( 1, '          -1 <= z <= +1.\n' );
  fprintf ( 1, '  Exactness: 3 = 2 * min ( 2, 3, 4 ) - 1\n' );
  fprintf ( 1, '  Order: N = 2 * 3 * 4\n' );

  nx = 2;
  ny = 3;
  nz = 4;
  n = nx * ny * nz;

  [ x, y, z, w ] = legendre_3d_set ( a, b, nx, ny, nz );

  p_max = 4;

  legendre_3d_exactness ( a, b, n, x, y, z, w, p_max );

  return
end

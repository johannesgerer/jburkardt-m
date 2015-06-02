function zernike_poly_test ( )

%*****************************************************************************80
%
%% ZERNIKE_POLY_TEST tests ZERNIKE_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZERNIKE_POLY_TEST\n' );
  fprintf ( 1, '  ZERNIKE_POLY evaluates a Zernike polynomial directly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Table of polynomial coefficients:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   M\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 5

    fprintf ( 1, '\n' );

    for m = 0 : n
      c = zernike_poly_coef ( m, n );
      fprintf ( 1, '  %2d  %2d', n, m );
      for i = 1 : n+1
        fprintf ( 1, '  %7f', c(i) );
      end
      fprintf ( 1, '\n' );
    end

  end

  rho = 0.987654321;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Z1: Compute polynomial coefficients,\n' );
  fprintf ( 1, '  then evaluate by Horner''s method;\n' );
  fprintf ( 1, '  Z2: Evaluate directly by recursion.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   M       Z1              Z2\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 5

    fprintf ( 1, '\n' );

    for m = 0 : n

      c = zernike_poly_coef ( m, n );
      z1 = r8poly_value_horner ( n, c, rho );

      z2 = zernike_poly ( m, n, rho );

      fprintf ( 1, '  %2d  %2d  %16f  %16f\n', n, m, z1, z2 );

    end

  end

  return
end

function zernike_poly_coef_test ( )

%*****************************************************************************80
%
%% ZERNIKE_POLY_COEF_TEST tests ZERNIKE_POLY_COEF.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZERNIKE_POLY_COEF_TEST\n' );
  fprintf ( 1, '  ZERNIKE_POLY_COEF determines the Zernike \n' );
  fprintf ( 1, '  polynomial coefficients.\n' );

  for m = 0 : n

    c = zernike_poly_coef ( m, n );
 
    r8poly_print ( n, c, '  Zernike polynomial' );

  end

  return
end

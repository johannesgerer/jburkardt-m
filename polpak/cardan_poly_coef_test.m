function cardan_poly_coef_test ( )

%*****************************************************************************80
%
%% CARDAN_POLY_COEF_TEST tests CARDAN_POLY_COEF.
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
  n_max = 10;

  s = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARDAN_POLY_COEF_TEST\n' );
  fprintf ( 1, '  CARDAN_POLY_COEF returns the coefficients of a\n' );
  fprintf ( 1, '  Cardan polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the parameter S = %f\n', s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Table of polynomial coefficients:\n' );
  fprintf ( 1, '\n' );

  for n = 0 : n_max
    c = cardan_poly_coef ( n, s );
    fprintf ( 1, '  %2d  ', n );
    for i = 0 : n
      fprintf ( 1, '  %9f', c(i+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

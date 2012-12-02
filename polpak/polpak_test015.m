function polpak_test015 ( )

%*****************************************************************************80
%
%% TEST015 tests CARDAN, CARDAN_POLY_COEF.
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
  fprintf ( 1, 'TEST015\n' );
  fprintf ( 1, '  CARDAN_POLY_COEF returns the coefficients of a\n' );
  fprintf ( 1, '    Cardan polynomial.\n' );
  fprintf ( 1, '  CARDAN evaluates a Cardan polynomial directly.\n' );
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

  s = 0.5;
  x = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compare CARDAN_POLY_COEF + R8POLY_VAL_HORNER\n' );
  fprintf ( 1, '  versus CARDAN alone.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate polynomials at X = %f\n', x );
  fprintf ( 1, '  We use the parameter S = %f\n', s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order    Horner       Direct\n' );
  fprintf ( 1, '\n' );

  cx2 = cardan ( n, x, s );

  for n = 0 : n_max

    c = cardan_poly_coef ( n, s );
    cx1 = r8poly_val_horner ( n, c, x );

    fprintf ( 1, '  %2d  %12f  %12f\n', n, cx1, cx2(n+1) );

  end

  return
end

function cardan_poly_test ( )

%*****************************************************************************80
%
%% CARDAN_POLY_TEST tests CARDAN_POLY.
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
  s = 0.5;
  x = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARDAN_POLY_TEST\n' );
  fprintf ( 1, '  CARDAN_POLY evaluates a Cardan polynomial directly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compare CARDAN_POLY_COEF + R8POLY_VALUE_HORNER\n' );
  fprintf ( 1, '  versus CARDAN_POLY alone.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate polynomials at X = %f\n', x );
  fprintf ( 1, '  We use the parameter S = %f\n', s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order    Horner       Direct\n' );
  fprintf ( 1, '\n' );

  cx2 = cardan_poly ( n_max, x, s );

  for n = 0 : n_max

    c = cardan_poly_coef ( n, s );
    cx1 = r8poly_value_horner ( n, c, x );

    fprintf ( 1, '  %2d  %12f  %12f\n', n, cx1, cx2(n+1) );

  end

  return
end

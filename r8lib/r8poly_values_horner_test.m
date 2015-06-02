function r8poly_values_horner_test ( )

%*****************************************************************************80
%
%% R8POLY_VALUES_HORNER_TEST tests R8POLY_VALUES_HORNER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_VALUES_HORNER_TEST\n' );
  fprintf ( 1, '  R8POLY_VALUES_HORNER evaluates a polynomial at a\n' );
  fprintf ( 1, '  point, using Horner''s method.\n' );

  m = 4;
  c = [ 24.0, -50.0, +35.0, -10.0, 1.0 ];
  r8poly_print ( m, c, '  The polynomial:' );

  n = 16;
  x_lo = 0.0;
  x_hi = 5.0;
  x = r8vec_linspace ( n, x_lo, x_hi );

  p = r8poly_values_horner ( m, c, n, x );

  r8vec2_print ( n, x, p, '  X, P(X):' );

  return
end

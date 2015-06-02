function r8poly_value_horner_test ( )

%*****************************************************************************80
%
%% R8POLY_VALUE_HORNER_TEST tests R8POLY_VALUE_HORNER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 16;

  c = [ 24.0, -50.0, +35.0, -10.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_VALUE_HORNER_TEST\n' );
  fprintf ( 1, '  R8POLY_VALUE_HORNER evaluates a polynomial at\n' );
  fprintf ( 1, '  one point, using Horner''s method.\n' );

  r8poly_print ( m, c, '  The polynomial coefficients:' );

  x_lo = 0.0;
  x_hi = 5.0;
  x = r8vec_linspace ( n, x_lo, x_hi );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I    X    P(X)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    p = r8poly_value_horner ( m, c, x(i) );
    fprintf ( 1, '  %2d  %8.4f  %14.6g\n', i, x(i), p );
  end

  return
end

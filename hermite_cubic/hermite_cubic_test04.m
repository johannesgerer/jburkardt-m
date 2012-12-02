function hermite_cubic_test04 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST04 tests HERMITE_CUBIC_SPLINE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST04:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_SPLINE_VALUE evaluates a Hermite cubic spline.\n' );

  x1 = 0.0;
  x2 = 10.0;

  nn = 11;
  xn = linspace ( x1, x2, nn );
  fn = sin ( xn );
  dn = cos ( xn );

  n = 51;
  x = linspace ( x1, x2, n );
  [ f, d, s, t ] = hermite_cubic_spline_value ( nn, xn, fn, dn, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X       F computed     F exact      Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    u = sin ( x(i) );
    v = abs ( f(i) - u );
    fprintf ( 1, '  %4d  %10f  %10f  %10f  %10.2e\n', i, x(i), f(i), u, v );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X       D computed     D exact      Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    u = cos ( x(i) );
    v = abs ( d(i) - u );
    fprintf ( 1, '  %4d  %10f  %10f  %10f  %10.2e\n', i, x(i), d(i), u, v );
  end

  return
end

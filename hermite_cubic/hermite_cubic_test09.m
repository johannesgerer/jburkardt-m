function hermite_cubic_test09 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST09 tests HERMITE_CUBIC_SPLINE_INTEGRATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST09:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_SPLINE_INTEGRATE integrates a Hermite\n' );
  fprintf ( 1, '  cubic spline from A to B.\n' );
%
%  Define the cubic spline.
%
  x1 = 0.0;
  x2 = 10.0;

  nn = 11;
  xn = linspace ( x1, x2, nn );
  [ fn, dn, sn, tn ] = cubic_value ( xn );

  n = 25;
  a = linspace ( 2.5, 2.5, n );
  b = linspace ( x1 - 1.0, x2 + 1.0, n );

  q = hermite_cubic_spline_integrate ( nn, xn, fn, dn, n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                                 Exact       Computed\n' );
  fprintf ( 1, '    I      A           B         Integral    Integral\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n

    q_exact = cubic_integrate ( a(i), b(i) );

    fprintf ( 1, '  %3d  %10f  %10f  %10.6g  %10.6g\n', ...
      i, a(i), b(i), q_exact, q(i) );

  end

  return
end

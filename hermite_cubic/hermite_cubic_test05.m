function hermite_cubic_test05 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST05 tests HERMITE_CUBIC_TO_POWER_CUBIC
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST05:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_TO_POWER_CUBIC converts the Hermite data\n' );
  fprintf ( 1, '  to the coefficients of the power form of the polynomial;\n' );
  fprintf ( 1, '  POWER_CUBIC_TO_HERMITE_CUBIC converts the power form\n' );
  fprintf ( 1, '  to Hermite form;\n' );

  x1 = -1.0;
  x2 = +1.0;

  [ f1, d1, s1, t1 ] = cubic_value ( x1 );
  [ f2, d2, s2, t2 ] = cubic_value ( x2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hermite data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X1, F1, D1:  %10f  %10f  %10f\n', x1, f1, d1 );
  fprintf ( 1, '  X2, F2, D2:  %10f  %10f  %10f\n', x2, f2, d2 );


  [ c0, c1, c2, c3 ] = hermite_cubic_to_power_cubic ( x1, f1, d1, ...
    x2, f2, d2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Power form:\n' );
  fprintf ( 1, '    p(x) = %f + %f * x + %f * x^2 + %f * x^3\n', c0, c1, c2, c3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X       F (Hermite)  F (power)\n' );
  fprintf ( 1, '\n' );

  for j = - 3 : 12
    x = ( ( 10 - j ) * x1   ...
        +        j   * x2 ) ...
        / 10.0;

    [ f, d, s, t ] = hermite_cubic_value ( x1, f1, d1, x2, f2, d2, 1, x );
    fp = c0 + x * ( c1 + x * ( c2 + x * c3 ) );

    fprintf ( 1, '  %10f  %10f  %10f\n', x, f, fp );

  end

  [ f1r, d1r, f2r, d2r ] = power_cubic_to_hermite_cubic ( c0, c1, c2, c3, ...
    x1, x2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use POWER_CUBIC_TO_HERMITE_CUBIC to recover the\n' );
  fprintf ( 1, '  original Hermite data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Original   Recovered\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F1:  %10f  %10f\n', f1, f1r );
  fprintf ( 1, '  D1:  %10f  %10f\n', d1, d1r );
  fprintf ( 1, '  F2:  %10f  %10f\n', f2, f2r );
  fprintf ( 1, '  D2:  %10f  %10f\n', d2, d2r );
  return
end

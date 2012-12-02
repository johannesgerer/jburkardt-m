function hermite_cubic_test08 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST08 tests HERMITE_CUBIC_SPLINE_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST08:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_SPLINE_INTEGRAL integrates a Hermite\n' );
  fprintf ( 1, '  cubic spline over the definition interval [X1,XNN].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                            Exact       Computed\n' );
  fprintf ( 1, '     X1          XNN        Integral    Integral\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 3

    if ( test == 1 )
      nn = 11;
      xn = linspace ( 0.0, 1.0, nn );
      fn = xn .* ( 4.0 * xn - 1.0 ) .* ( xn - 1.0 );
      dn = 1.0 + xn .* ( - 10.0 + xn * 12.0 );
      q_exact = ...
        ( xn(nn) * xn(nn) * ( 0.5 + xn(nn) * ( - ( 5.0 / 3.0 ) + xn(nn) ) ) ) ...
      - ( xn(1)  * xn(1)  * ( 0.5 + xn(1)  * ( - ( 5.0 / 3.0 ) + xn(1)  ) ) );
%
%  Use variable spacing.
%
    elseif ( test == 2 )
      nn = 11;
      xn = linspace ( 0.0, 1.0, nn );
      xn = sqrt ( xn );
      fn = xn .* ( 4.0 * xn - 1.0 ) .* ( xn - 1.0 );
      dn = 1.0 + xn .* ( - 10.0 + xn * 12.0 );
      q_exact = ...
        ( xn(nn) * xn(nn) * ( 0.5 + xn(nn) * ( - ( 5.0 / 3.0 ) + xn(nn) ) ) ) ...
      - ( xn(1)  * xn(1)  * ( 0.5 + xn(1)  * ( - ( 5.0 / 3.0 ) + xn(1)  ) ) );
%
%  Try a non-cubic.
%
    elseif ( test == 3 )
      nn = 11;
      xn = linspace ( 0.0, pi, nn );
      fn = sin ( xn );
      dn = cos ( xn );
      q_exact = - cos ( xn(nn) ) + cos ( xn(1) );
    end

    q_computed = hermite_cubic_spline_integral ( nn, xn, fn, dn );

    fprintf ( 1, '  %10f  %10f  %10.6g  %10.6g\n', ...
      xn(1), xn(nn), q_exact, q_computed );

  end

  return
end

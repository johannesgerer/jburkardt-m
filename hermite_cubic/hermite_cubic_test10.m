function hermite_cubic_test10 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST10 tests HERMITE_CUBIC_SPLINE_INTEGRAL.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST10:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_SPLINE_INTEGRAL integrates a Hermite\n' );
  fprintf ( 1, '  cubic spline over the definition interval [X1,XNN].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If the subintervals are equally spaced, the derivative\n' );
  fprintf ( 1, '  information has no effect on the result, except for\n' );
  fprintf ( 1, '  the first and last values, DN(1) and DN(NN).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                            Exact       Computed\n' );
  fprintf ( 1, '     X1          XNN        Integral    Integral  Comment\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 5
%
%  Equal spacing.
%
    if ( test == 1 )
      nn = 11;
      xn = linspace ( 0.0, pi, nn );
      fn = sin ( xn );
      dn = cos ( xn );
      integral_exact = - cos ( xn(nn) ) + cos ( xn(1) );
      comment = 'Equal spacing, correct DN';
%
%  Equal spacing, reset DN(2:NN-1) to random numbers.
%
    elseif ( test == 2 )
      nn = 11;
      xn = linspace ( 0.0, pi, nn );
      fn = sin ( xn );
      dn = cos ( xn );
      [ dn(2:nn-1), seed ] = r8vec_uniform_01 ( nn - 2, seed );
      dn(2:nn-1) = 1000.0 * dn(2:nn-1);
      integral_exact = - cos ( xn(nn) ) + cos ( xn(1) );
      comment = 'Equal spacing, DN(2:N-1) random';
%
%  Equal spacing, now reset all of DN to random numbers.
%
    elseif ( test == 3 )

      nn = 11;
      xn = linspace ( 0.0, pi, nn );
      fn = sin ( xn );
      [ dn, seed ] = r8vec_uniform_01 ( nn, seed );
      dn(1:nn) = 1000.0 * dn(1:nn);
      integral_exact = - cos ( xn(nn) ) + cos ( xn(1) );
      comment = 'Equal spacing, DN(1:N) random';
%
%  Variable spacing, correct data.
%
    elseif ( test == 4 )
      nn = 11;
      xn = linspace ( 0.0, pi^2, nn );
      xn = sqrt ( xn );
      fn = sin ( xn );
      dn = cos ( xn );
      integral_exact = - cos ( xn(nn) ) + cos ( xn(1) );
      comment = 'Variable spacing, correct DN';
%
%  Variable spacing, change one entry in DN.
%
    elseif ( test == 5 )
      nn = 11;
      xn = linspace ( 0.0, pi^2, nn );
      xn = sqrt ( xn );
      fn = sin ( xn );
      dn = cos ( xn );
      [ r, seed ] = r8_uniform_01 ( seed );
      dn( floor ( nn + 1 ) / 2 ) = 1000.0 * r;
      integral_exact = - cos ( xn(nn) ) + cos ( xn(1) );
      comment = 'Variable spacing, a single internal DN randomized.';
    end

    integral_computed = hermite_cubic_spline_integral ( nn, xn, fn, dn );

    fprintf ( 1, '  %10f  %10f  %10.6g  %10.6g  %s\n', ...
      xn(1), xn(nn), integral_exact, integral_computed, comment );

  end

  return
end

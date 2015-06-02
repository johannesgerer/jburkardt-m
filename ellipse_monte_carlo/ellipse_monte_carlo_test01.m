function ellipse_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% ELLIPSE_MONTE_CARLO_TEST01 uses ELLIPSE01_SAMPLE with an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2014
%
%  Author:
%
%    John Burkardt
%
  a = [ ...
    9.0, 1.0; ...
    1.0, 4.0 ]';
  e_test = [ ...
    0, 0; ...
    1, 0; ...
    0, 1; ...
    2, 0; ...
    1, 1; ...
    0, 2; ...
    3, 0 ]';
  r = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSE_MONTE_CARLO_TEST01\n' );
  fprintf ( 1, '  Use ELLIPSE01_SAMPLE to estimate integrals\n' );
  fprintf ( 1, '  in the ellipse x'' * A * x <= r^2.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1              X               Y  ' );
  fprintf ( 1, '             X^2               XY             Y^2             X^3\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = ellipse_sample ( n, a, r, seed );

    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e(1:2) = e_test(1:2,j);

      value = monomial_value ( 2, n, e, x );

      result = ellipse_area1 ( a, r ) * sum ( value(1:n) ) / n;
      fprintf ( '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  return
end

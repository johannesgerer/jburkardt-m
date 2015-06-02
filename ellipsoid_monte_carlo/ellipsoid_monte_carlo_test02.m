function ellipsoid_monte_carlo_test02 ( )

%*****************************************************************************80
%
%% ELLIPSOID_MONTE_CARLO_TEST02 uses ELLIPSOID_SAMPLE on a 2D ellipse centered at (2,3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
  m = 2;
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
  r = 0.5;
  v = [ 2.0, 3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSOID_MONTE_CARLO_TEST02\n' );
  fprintf ( 1, '  Use ELLIPSOID_SAMPLE to estimate integrals\n' );
  fprintf ( 1, '  in a 2D ellipse (x-v)'' * A * (x-v) <= r^2.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ellipsoid radius R = %g\n', r );
  r8vec_print ( m, v, '  Ellipsoid center V:' )
  r8mat_print ( m, m, a, '  Ellipsoid matrix A:' )

  volume = ellipsoid_volume ( m, a, v, r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ellipsoid volume = %g\n', volume );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1              X               Y  ' );
  fprintf ( 1, '             X^2               XY             Y^2             X^3\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = ellipsoid_sample ( m, n, a, v, r, seed );

    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e(1:m) = e_test(1:m,j);

      value = monomial_value ( m, n, e, x );

      result = volume * sum ( value(1:n) ) / n;

      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  return
end

function tetrahedron_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_MONTE_CARLO_TEST01 uses TETRAHEDRON_SAMPLE_01 with an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  e_test = [ ...
    0, 0, 0; ...
    1, 0, 0; ...
    0, 1, 0; ...
    0, 0, 1; ...
    2, 0, 0; ...
    1, 1, 0; ...
    1, 0, 1; ...
    0, 2, 0; ...
    0, 1, 1; ...
    0, 0, 2 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Use TETRAHEDRON01_SAMPLE for a Monte Carlo estimate of an\n' );
  fprintf ( 1, '  integral over the interior of the unit tetrahedron in 3D.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1               X               Y ' );
  fprintf ( 1, '              Z               X^2              XY             XZ' );
  fprintf ( 1, '              Y^2             YZ               Z^2\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    fprintf ( 1, '  %8d', n );

    [ x, seed ] = tetrahedron01_sample ( n, seed );

    for j = 1 : 10

      e(1:m) = e_test(1:m,j);

      value = monomial_value ( m, n, e, x );

      result = tetrahedron01_volume ( ) * sum ( value(1:n) ) / n;
      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 10

    e(1:m) = e_test(1:m,j);

    result = tetrahedron01_monomial_integral ( e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

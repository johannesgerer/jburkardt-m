function wedge_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% WEDGE_MONTE_CARLO_TEST01 uses WEDGE01_SAMPLE with an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2014
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
    0, 0, 2; ...
    3, 0, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_MONTE_CARLO_TEST01\n' );
  fprintf ( 1, '  Use WEDGE01_SAMPLE for a Monte Carlo estimate of an\n' );
  fprintf ( 1, '  integral over the interior of the unit wedge in 3D.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        1               X               Y ' );
  fprintf ( 1, '              Z                X^2            XY              Z^2    ' );
  fprintf ( 1, '        X^3\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = wedge01_sample ( n, seed );

    fprintf ( 1, '  %8d', n );

    for j = 1 : 8

      e(1:m,1) = e_test(1:m,j);

      value = monomial_value ( m, n, e, x );

      result = wedge01_volume ( ) * sum ( value(1:n) ) / n;
      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 8

    e(1:m,1) = e_test(1:m,j);
    result = wedge01_integral ( e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

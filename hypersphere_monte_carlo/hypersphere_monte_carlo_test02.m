function hypersphere_monte_carlo_test02 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_MONTE_CARLO_TEST02 tests HYPERSPHERE01_SAMPLE in dimension 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 6;

  e_test(1:m,1:7) = [ ...
    0, 0, 0, 0, 0, 0; ...
    1, 0, 0, 0, 0, 0; ...
    0, 2, 0, 0, 0, 0; ...
    0, 2, 2, 0, 0, 0; ...
    0, 0, 0, 4, 0, 0; ...
    2, 0, 0, 0, 2, 2; ...
    0, 0, 0, 0, 0, 6 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Use HYPERSPHERE02_SAMPLE to estimate integrals over \n' );
  fprintf ( 1, '  the surface of the unit hypersphere in M dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N' );
  fprintf ( 1, '        1      ' );
  fprintf ( 1, '        U      ' );
  fprintf ( 1, '         V^2   ' );
  fprintf ( 1, '         V^2W^2' );
  fprintf ( 1, '         X^4   ' );
  fprintf ( 1, '         Y^2Z^2' );
  fprintf ( 1, '         Z^6\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = hypersphere01_sample ( m, n, seed );

    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e(1:m,1) = e_test(1:m,j);

      value(1:n,1) = monomial_value ( m, n, e, x );

      result = hypersphere01_area ( m ) * sum ( value(1:n) ) / n;

    fprintf ( 1, '  %14f', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );
  for j = 1 : 7

    e(1:m,1) = e_test(1:m,j);

    result = hypersphere01_monomial_integral ( m, e );

    fprintf ( 1, '  %14f', result );

  end
  fprintf ( 1, '\n' );

  return
end

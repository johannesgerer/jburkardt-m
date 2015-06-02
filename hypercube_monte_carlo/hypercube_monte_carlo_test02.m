function hypercube_monte_carlo_test02 ( )

%*****************************************************************************80
%
%% HYPERCUBE_MONTE_CARLO_TEST02 estimates integrals over the unit hypercube in 6D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2014
%
%  Author:
%
%    John Burkardt
%
  m = 6;

  e_test = [ ...
    0, 0, 0, 0, 0, 0; ...
    1, 0, 0, 0, 0, 0; ...
    0, 2, 0, 0, 0, 0; ...
    0, 2, 2, 0, 0, 0; ...
    0, 0, 0, 4, 0, 0; ...
    2, 0, 0, 0, 2, 2; ...
    0, 0, 0, 0, 0, 6 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERCUBE_MONTE_CARLO_TEST02\n' );
  fprintf ( 1, '  Use HYPERCUBE01_SAMPLE to estimate integrals \n' );
  fprintf ( 1, '  along the interior of the unit hypercube in 6D.\n' );

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

    [ x, seed ] = hypercube01_sample ( m, n, seed );
    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e(1:m) = e_test(1:m,j);

      value = monomial_value ( m, n, e, x );

      result = hypercube01_volume ( m ) * sum ( value(1:n) ) / n;

      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 7

    e(1:m) = e_test(1:m,j);

    result = hypercube01_monomial_integral ( m, e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

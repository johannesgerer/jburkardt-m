function square_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% SQUARE_MONTE_CARLO_TEST01 estimates integrals over the unit square in 2D.
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
  e_test = [ ...
    0, 0; ...
    2, 0; ...
    0, 2; ...
    4, 0; ...
    2, 2; ...
    0, 4; ...
    6, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_MONTE_CARLO_TEST01\n' );
  fprintf ( 1, '  Use SQUARE01_SAMPLE to estimate integrals \n' );
  fprintf ( 1, '  along the interior of the unit square in 2D.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N' );
  fprintf ( 1, '           1' );
  fprintf ( 1, '              X^2' );
  fprintf ( 1, '             Y^2' );
  fprintf ( 1, '             X^4' );
  fprintf ( 1, '           X^2Y^2' );
  fprintf ( 1, '             Y^4' );
  fprintf ( 1, '           X^6\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = square01_sample ( n, seed );
    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e(1:2) = e_test(1:2,j);

      value = monomial_value ( 2, n, e, x );

      result = square01_area ( ) * sum ( value(1:n) ) / n;

      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 7

    e(1:2) = e_test(1:2,j);

    result = square01_monomial_integral ( e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

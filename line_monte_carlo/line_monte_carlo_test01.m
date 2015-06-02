function line_monte_carlo_test01 ( )

%*****************************************************************************80
%
%% LINE_MONTE_CARLO_TEST01 estimates integrals in 1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_MONTE_CARLO_TEST01\n' );
  fprintf ( 1, '  Use LINE01_SAMPLE to estimate integrals\n' );
  fprintf ( 1, '  along the length of the unit line in 1D.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N' );
  fprintf ( 1, '        1' );
  fprintf ( 1, '               X' ); 
  fprintf ( 1, '              X^2' );
  fprintf ( 1, '             X^3' ); 
  fprintf ( 1, '             X^4' ); 
  fprintf ( 1, '             X^5' );
  fprintf ( 1, '           X^6\n' );
  fprintf ( 1, '\n' );

  n = 1;

  while ( n <= 65536 )

    [ x, seed ] = line01_sample ( n, seed );

    fprintf ( 1, '  %8d', n );

    for j = 1 : 7

      e = j - 1;

      value = monomial_value_1d ( n, e, x );

      result = line01_length ( ) * sum ( value(1:n) ) / n;

      fprintf ( 1, '  %14.6g', result );

    end

    fprintf ( 1, '\n' );

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Exact' );

  for j = 1 : 7

    e = j - 1;

    result = line01_monomial_integral ( e );
    fprintf ( 1, '  %14.6g', result );

  end

  fprintf ( 1, '\n' );

  return
end

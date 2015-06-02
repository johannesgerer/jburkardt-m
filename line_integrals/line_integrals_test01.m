function line_integrals_test01 ( )

%*****************************************************************************80
%
%% LINE_INTEGRALS_TEST01 compares exact and estimated monomial integrals.
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
  m = 1;
  n = 4192;
  test_num = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_INTEGRALS_TEST01\n' );
  fprintf ( 1, '  Use LINE01_SAMPLE to estimate integrals\n' );
  fprintf ( 1, '  along the length of the unit line in 1D.\n' );
%
%  Get sample points.
%
  seed = 123456789;
  [ x, seed ] = line01_sample ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points used is %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   E     MC-Estimate      Exact           Error\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    e = test - 1;

    value = monomial_value_1d ( n, e, x );

    result = line01_length ( ) * sum ( value(1:n) ) / n;
    exact = line01_monomial_integral ( e );
    error = abs ( result - exact );

    fprintf ( 1, '  %2d  %14.6g  %14.6g  %10.2e\n', ...
      e, result, exact, error );

  end

  return
end

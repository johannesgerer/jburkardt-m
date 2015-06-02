function line_monomial_test ( degree_max )

%*****************************************************************************80
%
%% LINE_MONOMIAL_TEST tests LINE_MONOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREE_MAX, the maximum total degree of the
%    monomials to check.
%
  a = 0.0;
  b = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_MONOMIAL_TEST\n' );
  fprintf ( 1, '  For a line segment in 1D,\n' );
  fprintf ( 1, '  LINE_MONOMIAL returns the exact value of the\n' );
  fprintf ( 1, '  integral of X^ALPHA Y^BETA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', line_volume ( a, b ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    value = line_monomial ( a, b, alpha );
    fprintf ( 1, '  %8d  %14.6e\n', alpha, value );
  end

  return
end

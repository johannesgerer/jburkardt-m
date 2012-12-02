function line_unit_monomial_test ( degree_max )

%*****************************************************************************80
%
%% LINE_UNIT_MONOMIAL_TEST tests LINE_UNIT_MONOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2009
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_UNIT_MONOMIAL_TEST\n' );
  fprintf ( 1, '  For the unit line,\n' );
  fprintf ( 1, '  LINE_UNIT_MONOMIAL returns the exact value of the\n' );
  fprintf ( 1, '  integral of X^ALPHA Y^BETA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', line_unit_volume ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    value = line_unit_monomial ( alpha );
    fprintf ( 1, '  %8d  %14.6e\n', alpha, value );
  end

  return
end

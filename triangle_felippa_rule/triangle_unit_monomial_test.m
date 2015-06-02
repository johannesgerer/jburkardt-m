function triangle_unit_monomial_test ( degree_max )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_MONOMIAL_TEST tests TRIANGLE_UNIT_MONOMIAL.
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
  fprintf ( 1, 'TRIANGLE_UNIT_MONOMIAL_TEST\n' );
  fprintf ( 1, '  For the unit triangle,\n' );
  fprintf ( 1, '  TRIANGLE_UNIT_MONOMIAL returns the exact value of the\n' );
  fprintf ( 1, '  integral of X^ALPHA Y^BETA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', triangle_unit_volume ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    expon(1) = alpha;
    for beta = 0 : degree_max - alpha
      expon(2) = beta;
      value = triangle_unit_monomial ( expon );
      fprintf ( 1, '  %8d  %8d  %14.6e\n', expon(1:2), value );
    end
  end

  return
end

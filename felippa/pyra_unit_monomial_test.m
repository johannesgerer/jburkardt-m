function pyra_unit_monomial_test ( degree_max )

%*****************************************************************************80
%
%% PYRA_UNIT_MONOMIAL_TEST tests PYRA_UNIT_MONOMIAL.
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
  fprintf ( 1, 'PYRA_UNIT_MONOMIAL_TEST\n' );
  fprintf ( 1, '  For the unit pyramid,\n' );
  fprintf ( 1, '  PYRA_UNIT_MONOMIAL returns the exact value of the\n' );
  fprintf ( 1, ' integral of X^ALPHA Y^BETA Z^GAMMA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', pyra_unit_volume ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA     GAMMA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    expon(1) = alpha;
    for beta = 0 : degree_max - alpha
      expon(2) = beta;
      for gamma = 0 : degree_max - alpha - beta
        expon(3) = gamma;
        value = pyra_unit_monomial ( expon );
        fprintf ( 1, '  %8d  %8d  %8d  %14.6e\n', expon(1:3), value );
      end
    end
  end

  return
end

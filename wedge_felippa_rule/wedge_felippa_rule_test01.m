function wedge_felippa_rule_test01 ( degree_max )

%*****************************************************************************80
%
%% WEDGE_FELIPPA_RULE_TEST01 tests WEDGE_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 August 2014
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
  fprintf ( 1, 'WEDGE_FELIPPA_RULE_TEST01\n' );
  fprintf ( 1, '  For the unit wedge,\n' );
  fprintf ( 1, '  WEDGE_INTEGRAL returns the exact value of the\n' );
  fprintf ( 1, ' integral of X^ALPHA Y^BETA Z^GAMMA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', wedge_volume ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA     GAMMA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    expon(1) = alpha;
    for beta = 0 : degree_max - alpha
      expon(2) = beta;
      for gamma = 0 : degree_max - alpha - beta
        expon(3) = gamma;
        value = wedge_integral ( expon );
        fprintf ( 1, '  %8d  %8d  %8d  %14.6e\n', expon(1:3), value );
      end
    end
  end

  return
end

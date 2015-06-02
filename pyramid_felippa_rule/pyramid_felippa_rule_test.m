function pyramid_felippa_rule_test ( )

%*****************************************************************************80
%
%% PYRAMID_FELIPPA_RULE_TEST tests the PYRAMID_FELIPPA_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PYRAMID_FELIPPA_RULE library.\n' );

  degree_max = 4;
  pyramid_unit_monomial_test ( degree_max );

  degree_max = 5;
  pyramid_unit_quad_test ( degree_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

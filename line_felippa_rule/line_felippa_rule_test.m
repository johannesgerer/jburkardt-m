function line_felippa_rule_test ( )

%*****************************************************************************80
%
%% LINE_FELIPPA_RULE_TEST tests the LINE_FELIPPA_RULE library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINE_FELIPPA_RULE library.\n' );

  degree_max = 4;
  line_monomial_test ( degree_max );

  degree_max = 11;
  line_quad_test ( degree_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

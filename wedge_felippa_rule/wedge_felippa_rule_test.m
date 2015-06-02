function wedge_felippa_test ( )

%*****************************************************************************80
%
%% WEDGE_FELIPPA_RULE_TEST tests the WEDGE_FELIPPA_RULE library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the WEDGE_FELIPPA_RULE library.\n' );

  max_degree = 4;

  wedge_felippa_rule_test01 ( max_degree );
  wedge_felippa_rule_test02 ( max_degree );
  wedge_felippa_rule_test03 ( max_degree );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

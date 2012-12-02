function lyness_rule_test ( )

%*****************************************************************************80
%
%% LYNESS_RULE_TEST tests the LYNESS_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNESS_RULE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LYNESS_RULE library.\n' );

  lyness_rule_test01 ( );
  lyness_rule_test02 ( );
  lyness_rule_test03 ( );
  lyness_rule_test04 ( );
  lyness_rule_test05 ( );
  lyness_rule_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNESS_RULE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

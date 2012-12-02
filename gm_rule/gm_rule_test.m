function gm_rule_test ( )

%*****************************************************************************80
%
%% GM_RULE_TEST tests GM_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GM_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the GM_RULE library.\n' );

  gm_rule_test01 ( );
  gm_rule_test02 ( );
  gm_rule_test03 ( );
  gm_rule_test04 ( );
  gm_rule_test05 ( );
  gm_rule_test06 ( );
  gm_rule_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GM_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



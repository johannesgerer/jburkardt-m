function gm_rule_test ( )

%*****************************************************************************80
%
%% SIMPLEX_GM_RULE_TEST tests the SIMPLEX_GM_RULE library.
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
  fprintf ( 1, 'SIMPLEX_GM_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SIMPLEX_GM_RULE library.\n' );

  simplex_gm_rule_test01 ( );
  simplex_gm_rule_test02 ( );
  simplex_gm_rule_test03 ( );
  simplex_gm_rule_test04 ( );
  simplex_gm_rule_test05 ( );
  simplex_gm_rule_test06 ( );
  simplex_gm_rule_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GM_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



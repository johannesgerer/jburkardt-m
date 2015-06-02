function triangle_ncc_rule_test ( )

%*****************************************************************************80
%
%% TRIANGLE_NCC_RULE_TEST tests the TRIANGLE_NCC_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_NCC_RULE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGLE_NCC_RULE library.\n' );

  triangle_ncc_rule_test01 ( );
  triangle_ncc_rule_test02 ( );
  triangle_ncc_rule_test03 ( );
  triangle_ncc_rule_test04 ( );
  triangle_ncc_rule_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_NCC_RULE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

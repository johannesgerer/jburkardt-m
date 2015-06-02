function triangle_wandzura_rule_test ( )

%*****************************************************************************80
%
%% TRIANGLE_WANDZURA_RULE_TEST tests the TRIANGLE_WANDZURA_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_WANDZURA_RULE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGLE_WANDZURA_RULE library.\n' );

  triangle_wandzura_rule_test01 ( );
  triangle_wandzura_rule_test02 ( );
  triangle_wandzura_rule_test03 ( );
  triangle_wandzura_rule_test04 ( );
  triangle_wandzura_rule_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_WANDZURA_RULE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

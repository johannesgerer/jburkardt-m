function triangle_fekete_rule_test ( )

%*****************************************************************************80
%
%% TRIANGLE_FEKETE_RULE_TEST tests the TRIANGLE_FEKETE_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_FEKETE_RULE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGLE_FEKETE_RULE library.\n' );

  triangle_fekete_rule_test01 ( );
  triangle_fekete_rule_test02 ( );
  triangle_fekete_rule_test025 ( );
  triangle_fekete_rule_test03 ( );
  triangle_fekete_rule_test04 ( );
  triangle_fekete_rule_test05 ( );
  triangle_fekete_rule_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_FEKETE_RULE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

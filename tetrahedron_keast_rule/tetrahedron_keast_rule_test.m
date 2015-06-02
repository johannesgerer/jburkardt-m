function tetrahedron_keast_rule_test ( )

%*****************************************************************************80
%
%% TETRAHEDRON_KEAST_RULE_TEST tests the TETRAHEDRON_KEAST_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_KEAST_RULE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TETRAHEDRON_KEAST_RULE library.\n' );

  tetrahedron_keast_rule_test01 ( );
  tetrahedron_keast_rule_test02 ( );
  tetrahedron_keast_rule_test025 ( );
  tetrahedron_keast_rule_test03 ( );
  tetrahedron_keast_rule_test04 ( );
  tetrahedron_keast_rule_test05 ( );
  tetrahedron_keast_rule_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_KEAST_RULE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

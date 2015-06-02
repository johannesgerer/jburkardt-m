function lattice_rule_test ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST tests the LATTICE_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LATTICE_RULE library.\n' );

  lattice_rule_test01 ( );
  lattice_rule_test02 ( );
  lattice_rule_test03 ( );
  lattice_rule_test04 ( );
  lattice_rule_test05 ( );
  lattice_rule_test06 ( );
  lattice_rule_test07 ( );
  lattice_rule_test08 ( );
  lattice_rule_test085 ( );
  lattice_rule_test09 ( );
  lattice_rule_test10 ( );

  lattice_rule_test11 ( );
  lattice_rule_test12 ( );
  lattice_rule_test13 ( );
  lattice_rule_test14 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function sandia_rules_test ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST tests SANDIA_RULES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SANDIA_RULES library.\n' );

  sandia_rules_test01 ( );
  sandia_rules_test02 ( );
  sandia_rules_test03 ( );
  sandia_rules_test04 ( );
  sandia_rules_test05 ( );
  sandia_rules_test06 ( );
  sandia_rules_test07 ( );
  sandia_rules_test08 ( );
  sandia_rules_test09 ( );

  sandia_rules_test10 ( );
  sandia_rules_test11 ( );
  sandia_rules_test12 ( );
  sandia_rules_test13 ( );
  sandia_rules_test14 ( );
  sandia_rules_test15 ( );
  sandia_rules_test16 ( );
  sandia_rules_test17 ( );
  sandia_rules_test18 ( );
  sandia_rules_test19 ( );

  sandia_rules_test20 ( );
  sandia_rules_test21 ( );
  sandia_rules_test22 ( );
%
%  TEST23 accepts one input, a rule index between 1 and 11.
%
  r = 1;
  sandia_rules_test23 ( r );
  r = 3;
  sandia_rules_test23 ( r );
  r = 4;
  sandia_rules_test23 ( r );
  r = 11;
  sandia_rules_test23 ( r );

  sandia_rules_test24 ( );
  sandia_rules_test25 ( );
  sandia_rules_test26 ( );
  sandia_rules_test27 ( );
  sandia_rules_test28 ( );
  sandia_rules_test29 ( );

  sandia_rules_test30 ( );
  sandia_rules_test31 ( );
  sandia_rules_test32 ( );
  sandia_rules_test33 ( );
  sandia_rules_test34 ( );
  sandia_rules_test35 ( );
  sandia_rules_test36 ( );
  sandia_rules_test37 ( );
  sandia_rules_test38 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

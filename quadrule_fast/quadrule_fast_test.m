function quadrule_test ( )

%*****************************************************************************80
%
%% QUADRULE_FAST_TEST tests the QUADRULE_FAST library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_FAST_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QUADRULE_FAST library.\n' );

  quadrule_fast_test01 ( );
  quadrule_fast_test02 ( );
  quadrule_fast_test03 ( );

  quadrule_fast_test04 ( );
  quadrule_fast_test05 ( );
  quadrule_fast_test06 ( );

  quadrule_fast_test07 ( );
  quadrule_fast_test08 ( );
  quadrule_fast_test09 ( );

  quadrule_fast_test10 ( );
  quadrule_fast_test11 ( );
  quadrule_fast_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_FAST_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

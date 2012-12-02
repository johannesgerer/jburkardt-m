function hermite_cubic_test ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST tests HERMITE_CUBIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HERMITE_CUBIC library.\n' );

  hermite_cubic_test01 ( );
  hermite_cubic_test02 ( );
  hermite_cubic_test03 ( );
  hermite_cubic_test04 ( );
  hermite_cubic_test05 ( );
  hermite_cubic_test06 ( );
  hermite_cubic_test07 ( );
  hermite_cubic_test08 ( );
  hermite_cubic_test09 ( );

  hermite_cubic_test10 ( );
  hermite_cubic_test11 ( );
  hermite_cubic_test12 ( );
  hermite_cubic_test13 ( );
  hermite_cubic_test14 ( );
  hermite_cubic_test15 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

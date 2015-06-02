function hermite_test_int_test ( )

%*****************************************************************************80
%
%% HERMITE_TEST_INT_TEST tests the HERMITE_TEST_INT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST_INT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HERMITE_TEST_INT library.\n' );

  hermite_test_int_test01 ( );
  hermite_test_int_test02 ( );
  hermite_test_int_test03 ( );
  hermite_test_int_test04 ( );
  hermite_test_int_test05 ( );
  hermite_test_int_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST_INT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

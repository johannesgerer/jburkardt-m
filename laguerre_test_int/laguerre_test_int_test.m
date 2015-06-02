function laguerre_test_int_test ( )

%*****************************************************************************80
%
%% LAGUERRE_TEST_INT_TEST tests the LAGUERRE_TEST_INT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_TEST_INT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LAGUERRE_TEST_INT library.\n' );

  laguerre_test_int_test01 ( );
  laguerre_test_int_test02 ( );
  laguerre_test_int_test03 ( );
  laguerre_test_int_test04 ( );
  laguerre_test_int_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_TEST_INT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

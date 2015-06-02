function van_der_corput_test ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST tests the VAN_DER_CORPUT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the VAN_DER_CORPUT library.\n' );

  van_der_corput_test01 ( );
  van_der_corput_test02 ( );
  van_der_corput_test03 ( );
  van_der_corput_test04 ( );
  van_der_corput_test045 ( );
  van_der_corput_test05 ( );
  van_der_corput_test06 ( );
  van_der_corput_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



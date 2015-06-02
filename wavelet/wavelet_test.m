function wavelet_test ( )

%*****************************************************************************80
%
%% WAVELET_TEST tests the WAVELET library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WAVELET_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the WAVELET library.\n' );

  wavelet_test01 ( );
  wavelet_test02 ( );
  wavelet_test03 ( );
  wavelet_test04 ( );
  wavelet_test05 ( );
  wavelet_test06 ( );
  wavelet_test07 ( );
  wavelet_test08 ( );
  wavelet_test09 ( );

  wavelet_test10 ( );
  wavelet_test11 ( );
  wavelet_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WAVELET_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end




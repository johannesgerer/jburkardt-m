function asa266_test ( )

%*****************************************************************************80
%
%% ASA266_TEST tests the ASA266 library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA266_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Tests for the ASA266 package.\n' );
 
  asa266_test01 ( );
  asa266_test02 ( );
  asa266_test03 ( );
  asa266_test04 ( );
  asa266_test05 ( );
  asa266_test06 ( );
  asa266_test07 ( );
  asa266_test08 ( );
  asa266_test09 ( );
  asa266_test10 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA266_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function st_to_cc_test ( )

%*****************************************************************************80
%
%% ST_TO_CC_TEST tests the ST_TO_CC library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ST_TO_CC library.\n' );

  st_to_cc_test01 ( );
  st_to_cc_test02 ( );
  st_to_cc_test03 ( );
  st_to_cc_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
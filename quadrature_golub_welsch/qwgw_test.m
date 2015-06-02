function qwgw_test ( )

%*****************************************************************************80
%
%% QWGW_TEST tests the QWGW library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QWGW_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QWGW library.\n' );

  qwgw_test01 ( );
  qwgw_test02 ( );
  qwgw_test03 ( );
  qwgw_test04 ( );
  qwgw_test05 ( );
  qwgw_test06 ( );
  qwgw_test07 ( );
  qwgw_test08 ( );
  qwgw_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QWGW_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
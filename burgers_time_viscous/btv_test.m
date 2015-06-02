function btv_test ( )

%*****************************************************************************80
%
%% BTV_TEST tests the BURGERS_TIME_VISCOUS (BTV) library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTV_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BURGERS_TIME_VISCOUS (BTV) library.\n' );

  btv_test01 ( );
  btv_test02 ( );
  btv_test03 ( );
  btv_test04 ( );
  btv_test05 ( );
  btv_test06 ( );
  btv_test07 ( );
  btv_test08 ( );
  btv_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTV_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function bsv_test ( )

%*****************************************************************************80
%
%% BSV_TEST tests BSV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BSV library.\n' );

  bsv_test01 ( );
  bsv_test02 ( );
  bsv_test03 ( );
  bsv_test04 ( );
  bsv_test05 ( );
  bsv_test06 ( );
  bsv_test07 ( );
  bsv_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end




function normal_test ( )

%*****************************************************************************80
%
%% NORMAL_TEST tests NORMAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 January 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the NORMAL library.\n' );

  normal_test01 ( );
  normal_test02 ( );
  normal_test03 ( );
  normal_test04 ( );
  normal_test05 ( );
  normal_test06 ( );
  normal_test07 ( );
  normal_test08 ( );
  normal_test09 ( );

  normal_test10 ( );
  normal_test11 ( );
  normal_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

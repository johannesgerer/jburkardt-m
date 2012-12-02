function rcm_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for RCM_PRB.
%
%  Discussion:
%
%    RCM_PRB runs the RCM tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RCM_PRB\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the RCM library.\n' );

  rcm_test01 ( );
  rcm_test02 ( );
  rcm_test03 ( );
  rcm_test04 ( );
  rcm_test05 ( );
  rcm_test06 ( );
  rcm_test07 ( );
  rcm_test08 ( );
  rcm_test09 ( );

  rcm_test10 ( );
  rcm_test11 ( );
  rcm_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RCM_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

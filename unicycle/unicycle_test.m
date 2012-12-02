function unicycle_test ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST tests UNICYCLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the UNICYCLE library.\n' );

  unicycle_test01 ( );
  unicycle_test02 ( );
  unicycle_test03 ( );
  unicycle_test04 ( );
  unicycle_test05 ( );
  unicycle_test06 ( );
  unicycle_test07 ( );
  unicycle_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

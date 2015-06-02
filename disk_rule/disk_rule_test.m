function disk_rule_test ( )

%*****************************************************************************80
%
%% DISK_RULE_TEST tests the DISK_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISK_RULE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the DISK_RULE library.\n' );

  disk_rule_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISK_RULE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
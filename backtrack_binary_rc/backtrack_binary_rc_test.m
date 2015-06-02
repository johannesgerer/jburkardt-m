function backtrack_binary_rc_test ( )

%*****************************************************************************80
%
%% BACKTRACK_BINARY_RC_TEST tests BACKTRACK_BINARY_RC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BACKTRACK_BINARY_RC_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BACKTRACK_BINARY_RC library.\n' );

  backtrack_binary_rc_test01 ( );
  backtrack_binary_rc_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BACKTRACK_BINARY_RC_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

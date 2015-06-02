function timestamp_test ( )

%*****************************************************************************80
%
%% TIMESTAMP_TEST tests the TIMESTAMP library.
%
%  Purpose:
%
%    TIMESTAMP_TEST calls the TIMESTAMP sample tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMESTAMP_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TIMESTAMP library.\n' );

  s = timestring ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TIMESTRING returned S = %s\n', s );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMESTAMP_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

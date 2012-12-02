function doomsday_test ( )

%*****************************************************************************80
%
%% DOOMSDAY_TEST tests DOOMSDAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DOOMSDAY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the DOOMSDAY library.\n' );

  doomsday_test01 ( );
  doomsday_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DOOMSDAY_TEST:\n' );
  fprintf ( 1, '  Test the DOOMSDAY library.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

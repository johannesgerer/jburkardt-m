function fd2d_heat_steady_test ( )

%*****************************************************************************80
%
%% FD2D_HEAT_STEADY_TEST tests the FD2D_HEAT_STEADY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD2D_HEAT_STEADY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FD2D_HEAT_STEADY library.'

  fd2d_heat_steady_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD2D_HEAT_STEADY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

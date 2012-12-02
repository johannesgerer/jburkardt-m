function fd1d_wave_test ( )

%*****************************************************************************80
%
%% FD1D_WAVE_TEST tests the FD1D finite difference wave computation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_WAVE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FD1D_WAVE functions.\n' );

  fd1d_wave_test01 ( );
  fd1d_wave_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_WAVE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

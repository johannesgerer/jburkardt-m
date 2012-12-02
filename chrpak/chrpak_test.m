function chrpak_test ( )

%*****************************************************************************80
%
%% CHRPAK_TEST tests CHRPAK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHRPAK_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CHRPAK library.\n' );

  chrpak_test001 ( );
  chrpak_test005 ( );
  chrpak_test006 ( );

  chrpak_test011 ( );
  chrpak_test016 ( );

  chrpak_test021 ( );
  chrpak_test022 ( );
  chrpak_test026 ( );
  chrpak_test029 ( );

  chrpak_test046 ( );

  chrpak_test051 ( );
  chrpak_test054 ( );
  chrpak_test056 ( );
  chrpak_test057 ( );

  chrpak_test065 ( );
  chrpak_test066 ( );
  chrpak_test067 ( );

  chrpak_test083 ( );

  chrpak_test090 ( );
  chrpak_test091 ( );

  chrpak_test1015 ( );
  chrpak_test102 ( );
  chrpak_test105 ( );

  chrpak_test115 ( );
  chrpak_test1155 ( );

  chrpak_test1225 ( );
  chrpak_test1255 ( );
  chrpak_test129 ( );

  chrpak_test137 ( );
  chrpak_test138 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHRPAK_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

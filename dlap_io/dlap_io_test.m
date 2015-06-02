function dlap_io_test ( )

%*****************************************************************************80
%
%% DLAP_IO_TEST tests the DLAP_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DLAP_IO_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the DLAP_IO library.\n' );

  dlap_io_test01 ( );
  dlap_io_test02 ( );
  dlap_io_test03 ( );
  dlap_io_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DLAP_IO_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function st_io_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for ST_IO_TEST.
%
%  Discussion:
%
%    ST_IO_TEST is the main program for the ST_IO tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ST_IO library.\n' );

  st_io_test01 ( );
  st_io_test02 ( );
  st_io_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function mm_io_test ( )

%*****************************************************************************80
%
%% MM_IO_TEST tests the MM_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MM_IO library.\n' );

  mm_io_test01 ( );
  mm_io_test02 ( );
  mm_io_test03 ( );
  mm_io_test04 ( );
  mm_io_test05 ( );
  mm_io_test06 ( );
  mm_io_test07 ( );
  mm_io_test08 ( );
  mm_io_test09 ( );
  mm_io_test10 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

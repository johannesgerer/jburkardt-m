function obj_io_test ( )

%*****************************************************************************80
%
%% OBJ_IO_TEST is the test program for OBJ_IO.
%
%  Discussion:
%
%    OBJ_IO_PRB runs the tests of the OBJ_IO routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'OBJ_IO_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the OBJ_IO library.\n' );

  obj_io_test01 ( 'cube.obj' );
  obj_io_test02 ( 'cube.obj' );
  obj_io_test03  ( 'cube_normals.obj' );
  obj_io_test04 ( 'cube_no_normals.obj' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OBJ_IO_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

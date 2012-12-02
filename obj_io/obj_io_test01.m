function obj_io_test01 ( input_file_name )

%*****************************************************************************80
%
%% TEST01 tests OBJ_SIZE.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  OBJ_SIZE determines the size of various objects\n' );
  fprintf ( 1, '  in an OBJ file.\n' );

  [ node_num, face_num, normal_num, order_max ] = obj_size ( input_file_name );

  obj_size_print ( input_file_name, node_num, face_num, normal_num, order_max );

  return
end

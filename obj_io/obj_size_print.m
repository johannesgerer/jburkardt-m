function obj_size_print ( input_file_name, node_num, face_num, normal_num, ...
  order_max )

%*****************************************************************************80
%
%% OBJ_SIZE_PRINT prints sizes associated with an OBJ file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, integer NODE_NUM, the number of vertices defined.
%
%    Input, integer FACE_NUM, the number of faces defined.
%
%    Input, integer NORMAL_NUM, the number of normal vectors defined.
%
%    Input, integer ORDER_MAX, the maximum number of vertices per face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Object sizes for OBJ file "%s":\n', input_file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes              = %d\n', node_num );
  fprintf ( 1, '  Faces              = %d\n', face_num );
  fprintf ( 1, '  Maximum face order = %d\n', order_max );
  fprintf ( 1, '  Normal vectors     = %d\n', normal_num );

  return
end

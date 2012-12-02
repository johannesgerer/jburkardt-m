function test03 ( input_file_name )

%*****************************************************************************80
%
%% TEST03 tests STLA_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  STLA_READ reads an object in an ASCII STL file.\n' );

  [ solid_num, node_num, face_num, text_num ] = stla_size ( input_file_name );

  [ node_xyz, face_node, face_normal ] = stla_read ( ...
    input_file_name, node_num, face_num );

  stla_size_print ( input_file_name, solid_num, node_num, face_num, ...
    text_num );

  stla_face_node_print ( face_num, face_node );
  stla_face_normal_print ( face_num, face_normal );
  stla_node_xyz_print ( node_num, node_xyz );

  return
end

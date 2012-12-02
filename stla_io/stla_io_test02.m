function test02 ( input_file_name )

%*****************************************************************************80
%
%% TEST02 tests STLA_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  STLA_SIZE determines the size of various objects\n' );
  fprintf ( 1, '  in an ASCII STL file.\n' );

  [ solid_num, node_num, face_num, text_num ] = stla_size ( input_file_name );

  stla_size_print ( input_file_name, solid_num, node_num, face_num, ...
    text_num );

  return
end

function stla_size_print ( input_file_name, solid_num, node_num, face_num, ...
  text_num )

%*****************************************************************************80
%
%% STLA_SIZE_PRINT prints sizes associated with an STLA file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, integer SOLID_NUM, the number of solids defined.
%
%    Input, integer NODE_NUM, the number of vertices defined.
%
%    Input, integer FACE_NUM, the number of faces defined.
%
%    Input, integer TEXT_NUM, the number of lines of text.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Object sizes for STLA file "%s":\n', input_file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solids =                   %d\n', solid_num );
  fprintf ( 1, '  Nodes (may be repeated) =  %d\n', node_num );
  fprintf ( 1, '  Faces (triangular only) =  %d\n', face_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of lines of text =  %d\n', text_num );

  return
end

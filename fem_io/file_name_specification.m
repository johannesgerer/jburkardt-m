function [ node_coord_file_name, element_file_name, node_data_file_name ] = ...
  file_name_specification ( node_coord_file_name, element_file_name, ...
  node_data_file_name )

%*****************************************************************************80
%
%% FILE_NAME_SPECIFICATION determines the names of the input files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character NODE_COORD_FILE_NAME(*), the name of the node coordinate file, if the user
%    supplied it on the command line.
%
%    Input, character ELEMENT_FILE_NAME(*), the name of the element file,
%    if the user supplied it on the command line.
%
%    Input, character NODE_DATA_FILE_NAME(*), the name of the node data file, if the user
%    supplied it on the command line.
%
%    Output, character NODE_FILE_NAME(*), the name of the node coordinate file.
%
%    Output, character ELEMENT_FILE_NAME(*), the name of the element file.
%
%    Output, character NODE_DATA_NAME(*), the name of the node data file.
%
  if ( isempty ( node_coord_file_name ) ) 

    fprintf ( 1, '\n' );
    node_coord_file_name = input ( ...
      '  Please enter the name of the node coordinate file.' );

  end

  if ( isempty ( element_file_name ) )

    fprintf ( 1, '\n' );
    element_file_name = input ( ...
      '  Please enter the name of the element file.' );

  end

  if ( isempty ( node_data_file_name ) ) 

    fprintf ( 1, '\n' );
    node_data_file_name = input ( ...
      '  Please enter the name of the node data file.' );

  end

  return
end

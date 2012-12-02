function delete_count = file_sequence_delete ( file_name )

%*****************************************************************************80
%
%% FILE_SEQUENCE_DELETE deletes a file sequence.
%
%  Discussion:
%
%    We suppose the user has a set of files whose names differ only
%    in some numeric tag that is sequentially increasing, as, perhaps,
%    "file001.txt", "file002.txt" through "file137.txt", say.
%
%    The user specifies FILE_NAME as the name of the first file in the
%    sequence.  This function deletes that file, generates the next
%    name in the sequence, and, if a file with that name exists, it
%    deletes it as well.  The process continues until a file name is
%    reached for which there is no existing file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the first file in the sequence.
%
%    Output, integer DELETE_COUNT, the number of files deleted.
%
  delete_count = 0;

  while ( exist ( file_name, 'file' );

    delete ( file_name );

    delete_count = delete_count + 1;

    file_name = filename_inc ( file_name );
     
  end

  return
end

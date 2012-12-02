function dot = file_sequence_read ( filename, file_dim, file_num )

%*****************************************************************************80
%
%% FILE_SEQUENCE_READ reads the data from a file sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the first file in the sequence.
%
%    Input, integer FILE_DIM, the number of entries in a file.
%
%    Input, integer FILE_NUM, the number of files.
%
%    Output, real DOT(FILE_DIM,FILE_NUM), the file data.
%
  dot = zeros ( file_dim, file_num );

  for j = 1 : file_num

    file_unit = fopen ( filename, 'r' );

    for i = 1 : file_dim
      dot(i,j) = fscanf ( file_unit, '%f', 1 );
    end 

    fclose ( file_unit );

    filename = filename_inc ( filename );

  end

  return
end

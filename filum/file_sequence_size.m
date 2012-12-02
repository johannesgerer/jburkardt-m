function [ file_dim, file_num ] = file_sequence_size ( filename )

%*****************************************************************************80
%
%% FILE_SEQUENCE_SIZE sizes a file sequence.
%
%  Discussion:
%
%    We suppose the user has a set of files whose names differ only
%    in some numeric tag that is sequentially increasing, as, perhaps,
%    "file001.txt", "file002.txt" through "file137.txt", say.
%
%    The user specifies the name of the first file in the sequence.
%    This function determines the number of files in the sequence, 
%    and makes a guess for the "dimension" of the files, that is, the number
%    of numeric data items.
%
%    Note that the function only checks the dimension of the data in
%    the first file.  It is up to the user to determine whether this
%    dimension is used for every file in the sequence.
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
%    Input, string FILENAME, the name of the first file in the sequence.
%
%    Output, integer FILE_DIM, the dimension of the data in one file.
%
%    Output, integer FILE_NUM, the number of files.
%
  file_num = 0;
  file_dim = 0;

  while ( 1 )

    file_unit = fopen ( filename, 'r' );

    if ( file_unit < 0 )
      break
    end

    file_num = file_num + 1;

    if ( file_num == 1 )

      while ( 1 )
        [ temp, count ] = fscanf ( file_unit, '%f', 1 );
        if ( count <= 0 )
          break
        end
        file_dim = file_dim + 1;
      end

    end 

    fclose ( file_unit );

    filename = filename_inc ( filename );

  end

  return
end

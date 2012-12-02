function [ face_num, face_data_num ] = xyzf_header_read ( input_filename )

%*****************************************************************************80
%
%% XYZF_HEADER_READ determines the number of face items in an XYZF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face.
%
%    The routine ignores comments and blanks and returns
%    the number of face items.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer FACE_NUM, the number of faces.
%
%    Output, integer FACE_DATA_NUM, the number of face items.
%
  face_data_num = 0;
  face_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZF_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYZF_HEADER_READ - Error!' );
  end
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    n = s_word_count ( text );

    face_data_num = face_data_num + n;

    face_num = face_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end

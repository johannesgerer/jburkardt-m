function [ face_pointer, face_data ] = xyf_data_read ( input_filename, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYF_DATA_READ reads the data in an XYF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face, or -1 to terminate a face.
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
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
%    Output, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Output, integer FACE_DATA(FACE_DATA_NUM), the face items.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYF_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYF_DATA_READ - Error!' );
    return;
  end

  num = 0;
  face_pointer(1) = 1;
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( num < face_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    num = num + 1;

    n = s_word_count ( text );
    face_pointer(num+1) = face_pointer(num) + n;

    ilo = face_pointer(num);
    ihi = face_pointer(num+1) - 1;

    [ temp, count ] = sscanf ( text, '%d' );

    face_data(ilo:ihi) = temp(1:count);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end

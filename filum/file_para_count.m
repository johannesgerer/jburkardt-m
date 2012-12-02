function para_num = file_para_count ( file_name )

%*****************************************************************************80
%
%% FILE_PARA_COUNT counts the number of paragraphs in a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.  A paragraph is
%    a sequence of nonblank lines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file.
%
%    Output, integer PARA_NUM, the number of paragraphs found in the file.
%
  para_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( file_name );

  if ( input_unit == -1 )
    nword = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_PARA_COUNT - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file:\n' );
    fprintf ( 1, '"%s".\n', file_name );
    return
  end
%
%  Count the paragraphs.
%
  lenc = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    lenc_old = lenc;
    lenc = s_len_trim ( line );

    if ( 0 < lenc && lenc_old <= 0 )
      para_num = para_num + 1;
    end

  end

  fclose ( input_unit );

  return
end

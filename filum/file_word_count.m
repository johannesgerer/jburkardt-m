function nword = file_word_count ( file_name )

%*****************************************************************************80
%
%% FILE_WORD_COUNT counts the number of words in a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file.
%
%    Output, integer NWORD, the number of words found in the file.
%
  nword = 0;
%
%  Open the file.
%
  fid = fopen ( file_name );

  if ( fid = -1 )
    nword = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_WORD_COUNT - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file:\n' );
    fprintf ( 1, '"%s".\n', file_name );
    return
  end
%
%  Read the lines.
%
  while ( 1 )

    line = fgets ( fid );

    if ( line == -1 )
      break;
    end

    nplus = s_word_count ( line );

    nword = nword + nplus;

  end

  fclose ( fid )

  return
end

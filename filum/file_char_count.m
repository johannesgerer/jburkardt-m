function value = file_char_count ( file_name )

%*****************************************************************************80
%
%% FILE_CHAR_COUNT counts the number of characters in a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the input file.
%
%    Output, integer VALUE, the number of characters in the file. 
%
  value = -1;

  input = fopen ( file_name );

  if ( input < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_CHAR_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', file_name );
    error ( 'FILE_CHAR_COUNT - Error!' );
    return;
  end

  value = 0;
  
  while ( 1 )

    [ c, count ] = fread ( input, 1 );

    if ( count < 1 )
      break;
    end
    
    value = value + 1;

  end

  fclose ( input );

  return
end

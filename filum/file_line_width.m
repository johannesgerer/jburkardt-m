function value = file_line_width ( file_name )

%*****************************************************************************80
%
%% FILE_LINE_WIDTH reports the length of the longest line in a file.
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
%    Input, string FILE_NAME, the name of the input file.
%
%    Output, integer VALUE, the length of the longest line. 
%
  value = -1;

  input = fopen ( file_name );

  if ( input < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_LINE_WIDTH - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', file_name );
    error ( 'FILE_LINE_WIDTH - Error!' );
    return;
  end

  value = 0;
  line_width = 0;
  
  while ( 1 )

    [ c, count ] = fread ( input, 1 );

    if ( count < 1 )
      break;
    end
    
    if ( c == 10 || c == 13 )
      line_width = 0;
    else
      line_width = line_width + 1;
      value = max ( value, line_width );
    end

  end

  fclose ( input );

  return
end

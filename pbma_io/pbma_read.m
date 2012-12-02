function bitmap = pbma_read ( file_name )

%*****************************************************************************80
%
%% PBMA_READ opens an ASCII PBM file and reads the data.
%
%  The PBMA file is assumed to have the format:
%
%    P1
%    # feep.pbma
%    ncol nrow
%    row 1, a list of ncol numbers which are 0 or 1;
%    row 2, a list of ncol numbers which are 0 or 1;
%    ...
%    row nrow, a list of ncol numbers which are 0 or 1;
%
%    Lines beginning with '#' are comments.
%
%  Example:
%
%    P1
%    # feep.pbm
%    24 7
%    0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
%    0  1  1  1  1  0  0  1  1  1  1  0  0  1  1  1  1  0  0  1  1  1  1  0
%    0  1  0  0  0  0  0  1  0  0  0  0  0  1  0  0  0  0  0  1  0  0  1  0
%    0  1  1  1  0  0  0  1  1  1  0  0  0  1  1  1  0  0  0  1  1  1  1  0
%    0  1  0  0  0  0  0  1  0  0  0  0  0  1  0  0  0  0  0  1  0  0  0  0
%    0  1  0  0  0  0  0  1  1  1  1  0  0  1  1  1  1  0  0  1  0  0  0  0
%    0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME is the name of the PBMA file to read.
%
%    Output, BITMAP[NROW,NCOL] is the bitmap data read from the file.
%
  FALSE = 0;
  TRUE = 1;

  bitmap = [];

  input_unit = fopen ( file_name, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PBMA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'PBMA_READ - Error!' );
    return;
  end
%
%  Read the first line.
%
  line = fgets ( input_unit );
%
%  Verify that the first two characters are the "magic number".
%  Matlab strncmp returns 1 for equality, and 0 for inequality.
%
  if ( strncmp ( line, 'P1', 2 ) == 0 )
    return;
  end
%
%  Move to the next noncomment line.
%
  while ( 1 )
    line = fgets ( input_unit );
    if ( line(1) ~= '#' ) 
      break;
    end
  end
%
%  Extract NCOL and NROW.
%
  [ array, count ] = sscanf ( line, '%d' );
  ncol = array(1);
  nrow = array(2);
%
%  Set aside space for BITMAP.
%
  bitmap = zeros ( nrow, ncol );

  i = 1;
  j = 0;
  done = FALSE;

  while ( done == FALSE )
%
%  Move to the next noncomment line.
%
    while ( 1 )
      line = fgets ( input_unit );
      if ( line(1) ~= '#' ) 
        break;
      end
    end

    [ array, count ] = sscanf ( line, '%d' );
%
%  Each value that you read goes into the "next" open entry.
%
    for k = 1 : count

      j = j + 1;
      if ( ncol < j )
        j = 1;
        i = i + 1;
      end

      if ( i <= nrow )
        bitmap(i,j) = array(k);
      end
  
      if ( i == nrow & j == ncol )
        done = TRUE;
      end
    
    end

  end

  fclose ( input_unit );

  return
end

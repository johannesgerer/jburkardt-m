function gray = pgma_read ( file_name )

%*****************************************************************************80
%
%% PGMA_READ opens an ASCII PGM file and reads the data.
%
%  The PGMA file is assumed to have the format:
%
%    P2
%    # feep.pgma
%    ncol nrow
%    maxgray, the largest legal value for the data.
%    row 1, a list of ncol numbers between 0 and maxgray.
%    row 2, a list of ncol numbers between 0 and maxgray.
%    ...
%    row nrow, a list of ncol numbers between 0 and maxgray.
%
%    Lines beginning with '#' are comments.
%
%  Example:
%
%    P2
%    # feep.pgm
%    24 7
%    15
%    0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
%    0  3  3  3  3  0  0  7  7  7  7  0  0 11 11 11 11  0  0 15 15 15 15  0
%    0  3  0  0  0  0  0  7  0  0  0  0  0 11  0  0  0  0  0 15  0  0 15  0
%    0  3  3  3  0  0  0  7  7  7  0  0  0 11 11 11  0  0  0 15 15 15 15  0
%    0  3  0  0  0  0  0  7  0  0  0  0  0 11  0  0  0  0  0 15  0  0  0  0
%    0  3  0  0  0  0  0  7  7  7  7  0  0 11 11 11 11  0  0 15  0  0  0  0
%    0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the ASCII PGM file to read.
%
%    Output, integer GRAY[NROW,NCOL], is the gray scale data read from the file.
%
  gray = [];

  fid = fopen ( file_name, 'r' );

  if ( fid < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PGMA_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'PGMA_READ - Fatal error!' );
    return;
  end
%
%  Read the first line.
%
  line = fgets ( fid );
%
%  Verify that the first two characters are the "magic number".
%  Matlab strncmp returns 1 for equality, and 0 for inequality.
%
  if ( strncmp ( line, 'P2', 2 ) == 0 )
    return;
  end
%
%  Move to the next noncomment line.
%
  while ( 1 )
    line = fgets ( fid );
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
%  Move to the next noncomment line.
%
  while ( 1 )
    line = fgets ( fid );
    if ( line(1) ~= '#' ) 
      break;
    end
  end
%
%  Extract MAXGRAY, and ignore it.
%
  [ array, count ] = sscanf ( line, '%d' );
  maxgray = array(1);
%
%  Set aside space for GRAY.
%
  gray = zeros ( nrow, ncol );

  i = 1;
  j = 0;
  done = 0;

  while ( done == 0 )
%
%  Move to the next noncomment line.
%
    while ( 1 )
      line = fgets ( fid );
      if ( line(1) ~= '#' ) 
        break;
      end
    end
    [ array, count ] = sscanf ( line, '%d' );
%
%  Each value that you read goes into the "next" open entry in GRAY.
%
    for k = 1 : count

      j = j + 1;
      if ( ncol < j )
        j = 1;
        i = i + 1;
      end

      if ( i <= nrow )
        gray(i,j) = array(k);
      end

      if ( i == nrow & j == ncol )
        done = 1;
      end

    end
  
  end

  fclose ( fid );

  return
end

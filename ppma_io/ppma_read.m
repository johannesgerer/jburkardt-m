function [ r, g, b ] = ppma_read ( file_name )

%*****************************************************************************80
%
%% PPMA_READ opens an ASCII PPM file and reads the data.
%
%  The PPMA file is assumed to have the format:
%
%    P3
%    # feep.ppma
%    ncol nrow
%    maxrgb, the largest legal value for the data.
%    row 1, a list of ncol triples between 0 and maxrgb.
%    row 2, a list of ncol triples between 0 and maxrgb.
%    ...
%    row nrow, a list of ncol triples between 0 and maxrgb.
%
%    Lines beginning with '#' are comments.
%
%  Example:
%
%    P3
%    # feep.ppma
%    4 4
%    15
%     0  0  0  0  0  0    0  0  0   15  0 15
%     0  0  0  0 15  7    0  0  0    0  0  0
%     0  0  0  0  0  0    0 15  7    0  0  0
%    15  0 15  0  0  0    0  0  0    0  0  0
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
%    Input, string FILE_NAME, the name of the PPMA file to read.
%
%    Output, integer R{NROW,NCOL], G{NROW,NCOL], B{NROW,NCOL] is the RGB data read from the file.
%
  FALSE = 0;
  TRUE = 1;

  r = [];
  g = [];
  b = [];

  fid = fopen ( file_name, 'r' );

  if ( fid < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PPMA_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'PPMA_READ - Fatal error!' );
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
  if ( strncmp ( line, 'P3', 2 ) == 0 )
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
%  Extract MAXRGB, and ignore it.
%
  [ array, count ] = sscanf ( line, '%d' );
  maxRGB = array(1);
%
%  Set aside space for R, G< B.
%
  r = zeros ( nrow, ncol );
  g = zeros ( nrow, ncol );
  b = zeros ( nrow, ncol );

  i = 1;
  j = 0;
  p = 0;
  done = FALSE;

  while ( done == FALSE )
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
%  Each value that you read goes into the "next" open entry.
%  When reading R, we update the row and column indices.
%
    for k = 1 : count

      if ( p == 0 )
        j = j + 1;
        if ( ncol < j )
          j = 1;
          i = i + 1;
        end
        r(i,j) = array(k);
      elseif ( p == 1 )
        g(i,j) = array(k);
      elseif ( p == 2 )
        b(i,j) = array(k);
        if ( i == nrow & j == ncol )
          done = TRUE;
        end
      end

      p = mod ( p+1, 3 );

    end 
  
  end

  fclose ( fid );

  return
end

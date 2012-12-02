function pgma_write ( file_name, gray )

%*****************************************************************************80
%
%% PGMA_WRITE writes gray scale data into an ASCII PGM file.
%
%  The PGMA file will have the format:
%
%    P2
%    # file_name created by Matlab PGMA_WRITE.
%    ncol nrow
%    maxgray, the maximum legal value for the data.
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
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    FILENAME is the name of the ASCII PGM file to be created.
%
%    GRAY(NROW,NCOL) is the gray scale data.
%
  fid = fopen ( file_name, 'wt' );

  if ( fid < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PGMA_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'PGMA_WRITE - Fatal error!' );
    return;
  end
%
%  First line identifies the file as an ASCII PGM file.
%
  fprintf ( fid, 'P2\n' );
%
%  Second line is a comment with the filename and creator.
%
  fprintf ( fid, '# %s created by PGMA_IO::PGMA_WRITE.\n', file_name );
%
%  Third line holds NCOL and NROW.
%
  [nrow, ncol] = size ( gray );
  fprintf ( fid, '%d %d\n', ncol, nrow );
%
%  Fourth line contains the maximum gray value.
%
  maxgray = max ( max ( gray ) );
  fprintf ( fid, '%d\n', maxgray );
%
%  Subsequent lines contain the gray values, no more than 10 to a line.
%
  for i = 1 : nrow
    for j = 1 : ncol
      fprintf ( fid, '%d ', gray(i,j) );
      if ( j == ncol || rem ( j, 10 ) == 0 )
        fprintf ( fid, '\n' );
      end
    end
  end

  fclose ( fid );

  return
end

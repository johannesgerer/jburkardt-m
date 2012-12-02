function pbma_write ( file_name, bitmap )

%*****************************************************************************80
%
%% PBMA_WRITE writes bitmap data into an ASCII PBM file.
%
%  The PBMA file will have the format:
%
%    P1
%    # file_name created by Matlab PBMA_WRITE.
%    ncol nrow
%    row 1, a list of ncol numbers which are 0 or 1.
%    row 2, a list of ncol numbers which are 0 or 1.
%    ...
%    row nrow, a list of ncol numbers which are 0 or 1.
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
%    Input, string FILENAME is the name of the PBMA file to be created.
%
%    Input, BITMAP(NROW,NCOL) is the bitmap data.
%
  output_unit = fopen ( file_name, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PBMA_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'PBMA_WRITE - Error!' );
    return;
  end
%
%  First line identifies the file as a PBMA file.
%
  fprintf ( output_unit, 'P1\n' );
%
%  Second line is a comment with the filename and creator.
%
  fprintf ( output_unit, '# %s created by PBMA_IO::PBMA_WRITE.\n', file_name );
%
%  Third line holds NCOL and NROW.
%
  [ nrow, ncol ] = size ( bitmap );
  fprintf ( output_unit, '%d %d\n', ncol, nrow );
%
%  Subsequent lines contain the bitmap values, no more than 35 to a line.
%
  for i = 1 : nrow
    for j = 1 : ncol
      fprintf ( output_unit, '%d ', bitmap(i,j) );
      if ( j == ncol || rem ( j, 35 ) == 0 )
        fprintf ( output_unit, '\n' );
      end
    end
  end

  fclose ( output_unit );

  return
end

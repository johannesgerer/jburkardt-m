function ppma_write ( file_name, r, g, b )

%*****************************************************************************80
%
%% PPMA_WRITE writes RGB data into an ASCII PPM file.
%
%  The PPMA file will have the format:
%
%    P3
%    # file_name created by Matlab PPMA_WRITE.
%    ncol nrow
%    maxrgb, the maximum legal value for the data.
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
%    Input, string FILENAME, the name of the PPMA file to create.
%
%    Input, integer R(NROW,NCOL), G(NROW,NCOL), B(NROW,NCOL), the RGB data.
%
  fid = fopen ( file_name, 'wt' );

  if ( fid < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PPMA_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'PPMA_WRITE - Fatal error!' );
    return;
  end
%
%  First line identifies the file as a PPMA file.
%
  fprintf ( fid, 'P3\n' );
%
%  Second line is a comment with the filename and creator.
%
  fprintf ( fid, '# %s created by PPMA_IO::PPMA_WRITE.\n', file_name );
%
%  Third line holds NCOL and NROW.
%
  [nrow, ncol] = size ( r );
  fprintf ( fid, '%d %d\n', ncol, nrow );
%
%  Fourth line contains the maximum RGB value.
%
  maxr = max ( max ( r ) );
  maxg = max ( max ( g ) );
  maxb = max ( max ( b ) );
  maxrgb = max ( maxr, max ( maxg, maxb ) );
  fprintf ( fid, '%d\n', maxrgb );
%
%  Subsequent lines contain the RGB values, no more than 3 triples to a line.
%
  for i = 1 : nrow
    for j = 1 : ncol
      fprintf ( fid, '%d ', r(i,j), g(i,j), b(i,j) );
      if ( j == ncol || rem ( j, 3 ) == 0 )
        fprintf ( fid, '\n' );
      end
    end
  end

  fclose ( fid );

  return
end

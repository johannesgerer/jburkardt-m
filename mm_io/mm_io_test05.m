function mm_io_test05 ( )

%*****************************************************************************80
%
%% MM_IO_TEST05 tests MM_SIZE_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST05:\n' );
  fprintf ( 1, '  MM_SIZE_WRITE writes the size line \n' );
  fprintf ( 1, '  to a Matrix Market file.\n' );
  
  output_filename = 'mm_io_test05.mm';

  id = '%%MatrixMarket';
  type = 'matrix';
  rep = 'array';
  field = 'real';
  symm = 'general';
  
  nrow = 5;
  ncol = 4;
  nnz = 13;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the size information we intend to write\n' );
  fprintf ( 1, '  to a Matrix Market file:\n' );
  fprintf ( 1, '\n' );
  
  mm_size_print ( output_filename, rep, symm, nrow, ncol, nnz );
  
  output_unit = fopen ( output_filename, 'w' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST05 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MM_IO_TEST05 - Fatal error!' );
  end

  mm_header_write ( output_unit, id, type, rep, field, symm );
  
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'This is the file mm_io_test05.mm' );
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'It is a partial Matrix Market file,' );
  mm_comment_write ( output_unit, 'containing a header line, comments, and sizes.' );
  mm_comment_write ( output_unit, ' ' );

  mm_size_write ( output_unit, rep, nrow, ncol, nnz );
  
  fclose ( output_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST05:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', output_filename );
  fprintf ( 1, '  the header, comments, and sizes has been created.\n' );
  fprintf ( 1, '\n' );

  return
end

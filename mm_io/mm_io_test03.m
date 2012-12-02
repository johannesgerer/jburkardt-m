function mm_io_test03 ( )

%*****************************************************************************80
%
%% MM_IO_TEST03 tests MM_COMMENT_WRITE.
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
  fprintf ( 1, 'MM_IO_TEST03:\n' );
  fprintf ( 1, '  MM_COMMENT_WRITE writes comment lines \n' );
  fprintf ( 1, '  to a Matrix Market file.\n' );
  
  output_filename = 'mm_io_test03.mm';

  id = '%%MatrixMarket';
  type = 'matrix';
  rep = 'array';
  field = 'real';
  symm = 'general';
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here are the comments we are putting into the file:\n' );
  fprintf ( 1, '\n' );

  mm_comment_print ( ' ' );
  mm_comment_print ( 'This is the file mm_io_test03.mm' );
  mm_comment_print ( ' ' );
  mm_comment_print ( 'It is a partial Matrix Market file,' );
  mm_comment_print ( 'containing a header line and comments.' );
  mm_comment_print ( ' ' );

  output_unit = fopen ( output_filename, 'w' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST03 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MM_IO_TEST03 - Fatal error!' );
  end

  mm_header_write ( output_unit, id, type, rep, field, symm );
  
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'This is the file mm_io_test03.mm' );
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'It is a partial Matrix Market file,' );
  mm_comment_write ( output_unit, 'containing a header line and comments.' );
  mm_comment_write ( output_unit, ' ' );

  fclose ( output_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST03:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', output_filename );
  fprintf ( 1, '  the header and several comments has been created.\n' );
  fprintf ( 1, '\n' );

  return
end

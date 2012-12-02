function mm_io_test07 ( )

%*****************************************************************************80
%
%% MM_IO_TEST07 tests MM_VALUES_WRITE.
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
  fprintf ( 1, 'MM_IO_TEST07:\n' );
  fprintf ( 1, '  MM_VALUE_WRITE writes the matrix values \n' );
  fprintf ( 1, '  to a Matrix Market file.\n' );
  
  output_filename = 'mm_io_test07.mm';

  id = '%%MatrixMarket';
  type = 'matrix';
  rep = 'coordinate';
  field = 'real';
  symm = 'general';
  
  nrow = 5;
  ncol = 5;
  nnz = 10;
  
  indx =  [  1,  1,  2,  2,  3,  3,  4,  5,  5,  5 ];
  jndx =  [  1,  4,  2,  4,  1,  3,  4,  1,  4,  5 ];
  value = [ 11, 14, 22, 24, 31, 33, 44, 51, 54, 55 ];
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the value information we intend to write\n' );
  fprintf ( 1, '  to a Matrix Market file:\n' );
  fprintf ( 1, '\n' );
  
  mm_values_print ( rep, field, nnz, indx, jndx, value );
  
  output_unit = fopen ( output_filename, 'w' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST07 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MM_IO_TEST07 - Fatal error!' );
  end

  mm_header_write ( output_unit, id, type, rep, field, symm );
  
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'This is the file mm_io_test07.mm' );
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, 'It is a partial Matrix Market file,' );
  mm_comment_write ( output_unit, 'containing a header line, comments,' );
  mm_comment_write ( output_unit, 'sizes and matrix values.' );
  mm_comment_write ( output_unit, ' ' );

  mm_size_write ( output_unit, rep, nrow, ncol, nnz );
  
  mm_values_write ( output_unit, rep, field, nnz, indx, jndx, value );

  fclose ( output_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST07:\n' );
  fprintf ( 1, '  The MM file "%s" containing \n', output_filename );
  fprintf ( 1, '  the header, comments, sizes and values has been created.\n' );
  fprintf ( 1, '\n' );

  return
end

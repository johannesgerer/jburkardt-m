function mm_io_test09 ( )

%*****************************************************************************80
%
%% MM_IO_TEST09 tests MM_FILE_WRITE.
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
  fprintf ( 1, 'MM_IO_TEST09:\n' );
  fprintf ( 1, '  MM_FILE_WRITE writes an entire Matrix Market file.\n' );
  
  output_filename = 'mm_io_test09.mm';

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
    
  output_unit = fopen ( output_filename, 'w' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST09 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MM_IO_TEST09 - Fatal error!' );
  end

  mm_file_write ( output_unit, id, type, rep, field, symm, nrow, ...
    ncol, nnz, indx, jndx, value );
  
  fclose ( output_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST09:\n' );
  fprintf ( 1, '  The MM file "%s" containing \n', output_filename );
  fprintf ( 1, '  the header, comments, sizes and values has been created.\n' );
  fprintf ( 1, '\n' );

  return
end

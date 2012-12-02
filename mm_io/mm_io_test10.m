function mm_io_test10 ( )

%*****************************************************************************80
%
%% MM_IO_TEST10 tests MM_FILE_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST10:\n' );
  fprintf ( 1, '  MM_VALUE_READ reads the value records \n' );
  fprintf ( 1, '  of a Matrix Market file.\n' );
  
  input_filename = 'mm_io_test09.mm';

  input_unit = fopen ( input_filename );
  
  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST10 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'MM_IO_TEST10 - Fatal error!' );
  end

  [ id, type, rep, field, symm, nrow, ncol, nnz, indx, jndx, value ) ...
    = mm_file_read ( input_unit );
      
  fclose ( input_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the information read from the file:\n' );
  fprintf ( 1, '\n' );
  
  mm_header_print ( input_file, id, type, rep, field, symm );
  
  mm_size_print ( input_filename, rep, symm, nrow, ncol, nnz );
  
  mm_values_print ( rep, field, nnz, indx, jndx, value );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST10:\n' );
  fprintf ( 1, '  The MM file "%s" containing \n', input_filename );
  fprintf ( 1, '  the header, comments, size and values, has been read.\n' );
  fprintf ( 1, '\n' );

  return
end

function mm_io_test08 ( )

%*****************************************************************************80
%
%% MM_IO_TEST08 tests MM_VALUES_READ.
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
  fprintf ( 1, 'MM_IO_TEST08:\n' );
  fprintf ( 1, '  MM_VALUE_READ reads the value records \n' );
  fprintf ( 1, '  of a Matrix Market file.\n' );
  
  input_filename = 'mm_io_test07.mm';

  input_unit = fopen ( input_filename );
  
  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST08 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'MM_IO_TEST08 - Fatal error!' );
  end

  [ id, type, rep, field, symm ] = mm_header_read ( input_unit );
    
  while ( 1 )
      
    comment = mm_comment_read ( input_unit );
    
    if ( comment == -1 )
      break;
    end
  
    if ( comment(1) ~= '%' )
      break;
    end
        
  end
%
%  The COMMENT line is actually the line containing the size information.
%
  [ nrow, ncol, nnz ] = mm_size_read_string ( comment, rep, symm );
  
  [ indx, jndx, value ] = mm_values_read ( input_unit, rep, field, nnz );

  fclose ( input_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the value information read from the file:\n' );
  fprintf ( 1, '\n' );
  
  mm_values_print ( rep, field, nnz, indx, jndx, value );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST08:\n' );
  fprintf ( 1, '  The MM file "%s" containing \n', input_filename );
  fprintf ( 1, '  the header, comments, size and values, has been read.\n' );
  fprintf ( 1, '\n' );

  return
end

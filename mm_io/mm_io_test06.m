function mm_io_test06 ( )

%*****************************************************************************80
%
%% MM_IO_TEST06 tests MM_SIZE_READ_STRING.
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
  fprintf ( 1, 'MM_IO_TEST06:\n' );
  fprintf ( 1, '  MM_SIZE_READ_STRING reads the size record \n' );
  fprintf ( 1, '  of a Matrix Market file from a string.\n' );
  
  input_filename = 'mm_io_test05.mm';

  input_unit = fopen ( input_filename );
  
  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST06 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'MM_IO_TEST06 - Fatal error!' );
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
  
  fclose ( input_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the size information read from the file:\n' );
  fprintf ( 1, '\n' );
  
  mm_size_print ( input_filename, rep, symm, nrow, ncol, nnz );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST06:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', input_filename );
  fprintf ( 1, '  the header, comments and size has been read.\n' );
  fprintf ( 1, '\n' );

  return
end

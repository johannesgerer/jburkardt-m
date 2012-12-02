function mm_io_test04 ( )

%*****************************************************************************80
%
%% MM_IO_TEST04 tests MM_COMMENT_READ.
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
  fprintf ( 1, 'MM_IO_TEST04:\n' );
  fprintf ( 1, '  MM_COMMENT_READ reads the header \n' );
  fprintf ( 1, '  of a Matrix Market file.\n' );
  
  input_filename = 'mm_io_test03.mm';

  input_unit = fopen ( input_filename );
  
  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST04 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'MM_IO_TEST04 - Fatal error!' );
  end

  [ id, type, rep, field, symm ] = mm_header_read ( input_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the comment field of the file:\n' );
  fprintf ( 1, '\n' );
  
  while ( 1 )
      
    comment = mm_comment_read ( input_unit );
    
    if ( comment == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  (End of input)\n' );
      break;
    end
  
    if ( comment(1) ~= '%' )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  (Next line is NOT a comment.)\n' );
      break;
    end
    
    mm_comment_print ( comment );
    
  end
  
  fclose ( input_unit );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST04:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', input_filename );
  fprintf ( 1, '  the header and comments has been read.\n' );
  fprintf ( 1, '\n' );

  return
end

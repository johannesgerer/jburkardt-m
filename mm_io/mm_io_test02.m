function mm_io_test02 ()

%*****************************************************************************80
%
%% MM_IO_TEST02 tests MM_HEADER_READ.
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
  fprintf ( 1, 'MM_IO_TEST02:\n' );
  fprintf ( 1, '  MM_HEADER_READ reads the header \n' );
  fprintf ( 1, '  of a Matrix Market file.\n' );
  
  input_filename = 'mm_io_test01.mm';

  input_unit = fopen ( input_filename );
  
  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST02 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'MM_IO_TEST02 - Fatal error!' );
  end

  [ id, type, rep, field, symm ] = mm_header_read ( input_unit );
  
  fclose ( input_unit );
 
  mm_header_print ( input_filename, id, type, rep, field, symm );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST02:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', input_filename );
  fprintf ( 1, '  the header has been read.\n' );
  fprintf ( 1, '\n' );

  return
end

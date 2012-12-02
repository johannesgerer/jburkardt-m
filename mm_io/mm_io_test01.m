function mm_io_test01 ( )

%*****************************************************************************80
%
%% MM_IO_TEST01 tests MM_IO_HEADER_WRITE.
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
  fprintf ( 1, 'MM_IO_TEST01:\n' );
  fprintf ( 1, '  MM_HEADER_WRITE writes the header \n' );
  fprintf ( 1, '  of a Matrix Market file.\n' );
  
  output_filename = 'mm_io_test01.mm';

  id = '%%MatrixMarket';
  type = 'matrix';
  rep = 'array';
  field = 'real';
  symm = 'general';
  
  mm_header_print ( 'Internal data', id, type, rep, field, symm );

  output_unit = fopen ( output_filename, 'w' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_IO_TEST01 - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MM_IO_TEST01 - Fatal error!' );
  end

  mm_header_write ( output_unit, id, type, rep, field, symm );
  
  fclose ( output_unit );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_IO_TEST01:\n' );
  fprintf ( 1, '  The partial MM file "%s" containing \n', output_filename );
  fprintf ( 1, '  the header has been created.\n' );
  fprintf ( 1, '\n' );

  return
end

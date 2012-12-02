function pgma_io_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests PGMA_EXAMPLE, PGMA_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2010
%
%  Author:
%
%    John Burkardt
%
  ncol = 300;
  nrow = 300;
  file_name = 'pgma_io_test01.ascii.pgm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  PGMA_EXAMPLE sets up ASCII PGM data.\n' );
  fprintf ( 1, '  PGMA_WRITE writes an ASCII PGMA file.\n' );

  g = pgma_example ( nrow, ncol );

  pgma_write ( file_name, g );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the header and data for "%s"\n', file_name );
  fprintf ( 1, '  Number of rows of data =    %d\n', nrow );
  fprintf ( 1, '  Number of columns of data = %d\n', ncol );

  return
end

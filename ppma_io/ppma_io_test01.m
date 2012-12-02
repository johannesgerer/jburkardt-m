function ppma_io_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests PPMA_EXAMPLE, PPMA_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2011
%
%  Author:
%
%    John Burkardt
%
  ncol = 300;
  nrow = 300;
  file_name = 'test01.ascii.ppm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  PPMA_EXAMPLE sets up sample PPMA data.\n' );
  fprintf ( 1, '  PPMA_WRITE writes an ASCII PPMA file.\n' );

  [ r, g, b ] = ppma_example ( nrow, ncol );

  ppma_write ( file_name, r, g, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the header and data for %s\n', file_name );
  fprintf ( 1, '  Number of rows of data =    %d\n', nrow );
  fprintf ( 1, '  Number of columns of data = %d\n', ncol );

 return
end

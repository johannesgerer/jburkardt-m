function pbma_io_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests PBMA_EXAMPLE, PBMA_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2008
%
%  Author:
%
%    John Burkardt
%
  ncol = 300;
  nrow = 300;
  file_name = 'pbma_io_test01.ascii.pbm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  PBMA_EXAMPLE sets up ASCII PBM data.\n' );
  fprintf ( 1, '  PBMA_WRITE writes an ASCII PBM file.\n' );

  b = pbma_example ( nrow, ncol );

  pbma_write ( file_name, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the header and data for %s\n', file_name );
  fprintf ( 1, '  Number of rows of data =    %d\n', nrow );
  fprintf ( 1, '  Number of columns of data = %d\n', ncol );

  return
end

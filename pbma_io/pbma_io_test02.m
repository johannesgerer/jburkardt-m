function pbma_io_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests PBMA_READ.
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
  file_name = 'pbma_io_test02.ascii.pbm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PBMA_READ reads an ASCII PBMA file.\n' );

  pbma_write_test ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PBMA_WRITE_TEST created data and wrote it to a file.\n' );
%
%  Now try to read the data.
%
  b = pbma_read ( file_name );

  [ nrow, ncol ] = size ( b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data file was read by PBMA_READ.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows of data =    %d\n', nrow );
  fprintf ( 1, '  Number of columns of data = %d\n', ncol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample data:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 30
    i = floor ( ( ( 30 - k ) * 1 + ( k - 1 ) * nrow ) / ( 30 - 1 ) );
    j = floor ( ( ( 30 - k ) * 1 + ( k - 1 ) * ncol ) / ( 30 - 1 ) );
    fprintf ( 1, '%4d  %4d  %6d\n', i, j, b(i,j) );
  end

  return
end

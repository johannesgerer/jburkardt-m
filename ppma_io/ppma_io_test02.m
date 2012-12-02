function ppma_io_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests PPMA_READ.
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
  file_name = 'test02.ascii.ppm';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PPMA_READ reads an ASCII PPMA file.\n' );

  ppma_write_test ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PPMA_WRITE_TEST created data,\n' );
  fprintf ( 1, '  and wrote it to the file "%s".\n', file_name );

  [ r, g, b ] = ppma_read ( file_name );
  [ nrow, ncol ] = size ( r );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PPMA_READ has read the file "%s"\n', file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows of data =    %d\n', nrow );
  fprintf ( 1, '  Number of columns of data = %d\n', ncol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample values:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 10
    i = floor ( ( ( 10 - k ) * 1 + ( k - 1 ) * nrow ) / ( 10 - 1 ) );
    j = floor ( ( ( 10 - k ) * 1 + ( k - 1 ) * ncol ) / ( 10 - 1 ) );
    fprintf ( 1, '  %4d  %4d  %6d  %6d  %6d\n', i, j, r(i,j), g(i,j), b(i,j) );
  end

  return
end

function st_io_test02 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST02 tests ST_HEADER_READ, ST_DATA_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    John Burkardt
%
  input_filename = 'kershaw.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBPAK_TEST02\n' );
  fprintf ( 1, '  ST_HEADER_READ reads the header from an ST file.\n' );
  fprintf ( 1, '  ST_DATA_READ reads the data from an ST file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data from "%s".\n', input_filename );

  [ nrow, ncol, nnzero ] = st_header_read ( input_filename );

  st_header_print ( nrow, ncol, nnzero );

  [ row, col, a] = st_data_read ( input_filename, nrow, ncol, nnzero );

  st_data_print ( nrow, ncol, nnzero, row, col, a, ...
    '  TEST02 matrix data read from file' );

  return
end

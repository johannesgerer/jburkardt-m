function st_io_test02 ( )

%*****************************************************************************80
%
%% ST_IO_TEST02 tests ST_HEADER_READ, ST_DATA_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
  input_filename = 'kershaw.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST02\n' );
  fprintf ( 1, '  ST_HEADER_READ reads the header from an ST file.\n' );
  fprintf ( 1, '  ST_DATA_READ reads the data from an ST file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data from "%s".\n', input_filename );

  [ i_min, i_max, j_min, j_max, m, n, nst ] = st_header_read ( input_filename );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );

  [ ist, jst, ast ] = st_data_read ( input_filename, m, n, nst );

  st_print ( m, n, nst, ist, jst, ast, '  Sparse Triplet (ST) data from file' );

  return
end

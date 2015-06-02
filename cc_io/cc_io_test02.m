function cc_io_test02 ( )

%*****************************************************************************80
%
%% CC_IO_TEST02 tests CC_HEADER_READ and CC_DATA_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2014
%
%  Author:
%
%    John Burkardt
%
  prefix = 'simple';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_IO_TEST02\n' );
  fprintf ( 1, '  Read a sparse matrix in CC format from 3 files.\n' );
%
%  Read the header.
%
  [ ncc, n ] = cc_header_read ( prefix );
%
%  Read the matrix data.
%
  [ icc, ccc, acc ] = cc_data_read ( prefix, ncc, n );
%
%  Print the CC matrix.
%
  m = n;
  cc_print ( m, n, ncc, icc, ccc, acc, '  The matrix in 1-based CC format:' );

  return
end
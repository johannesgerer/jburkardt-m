function st_io_test01 ( )

%*****************************************************************************80
%
%% ST_IO_TEST01 tests ST_WRITE.
%
%  Discussion:
%
%    The matrix is:
%
%      11  12   0   0  15
%      21  22   0   0   0
%       0   0  33   0  35
%       0   0   0  44   0
%      51   0  53   0  55
%
%    The index vectors are 1 based, and so have to be converted to
%    0-base before being written.
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
  m = 5;
  n = 5;
  nst = 11;
  ast = [ 51.0, 12.0, 11.0, 33.0, 15.0, 53.0, 55.0, 22.0, 35.0, 44.0, 21.0 ]';
  ist = [ 5, 1, 1, 3, 1, 5, 5, 2, 3, 4, 2 ];
  jst = [ 1, 2, 1, 3, 5, 3, 5, 2, 5, 4, 1 ];
  output_filename = 'a5by5.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST01\n' );
  fprintf ( 1, '  ST_WRITE writes an ST file.\n' );

  ist(1:nst) = ist(1:nst) - 1;
  jst(1:nst) = jst(1:nst) - 1;

  i_min = min ( ist );
  i_max = max ( ist );
  j_min = min ( jst );
  j_max = max ( jst );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );

  st_print ( m, n, nst, ist, jst, ast, '  Sparse Triplet (ST) data:' );

  st_write ( output_filename, m, n, nst, ist, jst, ast );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the matrix data to "%s".\n', output_filename );

  return
end

function st_to_cc_test02 ( )

%*****************************************************************************80
%
%% ST_TO_CC_TEST02 tests ST_TO_CC on a matrix stored in a file.
%
%  Discussion:
%
%    We assume no prior knowledge about the matrix except the filename.
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
  filename_st = 'west_st.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST02\n' );
  fprintf ( 1, '  Convert a sparse matrix from ST to CC format.\n' );
  fprintf ( 1, '  ST: sparse triplet,    I, J,  A.\n' );
  fprintf ( 1, '  CC: compressed column, I, CC, A.\n' );
  fprintf ( 1, '  This matrix is read from the file "%s"\n', filename_st );
%
%  Get the size of the ST matrix.
%
  [ i_min, i_max, j_min, j_max, m, n, nst ] = st_header_read ( filename_st );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );
%
%  Read the ST matrix.
%
  [ ist, jst, ast ] = st_data_read ( filename_st, m, n, nst );
%
%  Print the ST matrix.
%
  st_print ( m, n, nst, ist, jst, ast, '  The matrix in ST format:' )
%
%  Get the CC size.
%
  ncc = st_to_cc_size ( nst, ist, jst );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of CC values = %d\n', ncc );
%
%  Create the CC indices.
%
  [ icc, ccc ] = st_to_cc_index ( nst, ist, jst, ncc, n );
%
%  Create the CC values.
%
  acc = st_to_cc_values ( nst, ist, jst, ast, ncc, n, icc, ccc );
%
%  Print the CC matrix.
%
  cc_print ( m, n, ncc, icc, ccc, acc, '  CC Matrix:' )

  return
end

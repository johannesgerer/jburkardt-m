function st_to_cc_test03 ( )

%*****************************************************************************80
%
%% ST_TO_CC_TEST03 creates a CC sparse matrix file from an ST file.
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
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
  filename_st = 'west_st.txt';
  filename_acc = 'west_acc.txt';
  filename_ccc = 'west_ccc.txt';
  filename_icc = 'west_icc.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST03\n' );
  fprintf ( 1, '  Convert a sparse matrix from ST to CC format.\n' );
  fprintf ( 1, '  ST: sparse triplet,    I, J,  A.\n' );
  fprintf ( 1, '  CC: compressed column, I, CC, A.\n' );
  fprintf ( 1, '  The ST matrix is read from the file "%s"\n', filename_st );
  fprintf ( 1, '  and the CC matrix is written to the files:\n' );
  fprintf ( 1, '    "%s",\n', filename_icc );
  fprintf ( 1, '    "%s", and\n', filename_ccc );
  fprintf ( 1, '    "%s".\n', filename_acc );
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
%  Write the CC matrix.
%
  i4vec_write ( filename_icc, ncc, icc );
  i4vec_write ( filename_ccc, n + 1, ccc );
  r8vec_write ( filename_acc, ncc, acc );

  return
end

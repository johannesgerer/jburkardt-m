function st_to_cc_test04 ( )

%*****************************************************************************80
%
%% ST_TO_CC_TEST04 works with a CC sparse matrix with many repeated index pairs.
%
%  Discussion:
%
%    To complete this test, I want to compare AST * X and ACC * X.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST04\n' );
  fprintf ( 1, '  Convert a sparse matrix from ST to CC format.\n' );
  fprintf ( 1, '  ST: sparse triplet,    I, J,  A.\n' );
  fprintf ( 1, '  CC: compressed column, I, CC, A.\n' );
  fprintf ( 1, '  The ST matrix is the Wathen finite element matrix.\n' );
  fprintf ( 1, '  It has many repeated index pairs.\n' );
  fprintf ( 1, '  To check, compare ACC*X - AST*X for a random X.\n' );
%
%  Get the size of the ST matrix.
%
  nx = 3;
  ny = 3;
  nst = wathen_st_size ( nx, ny );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of ST values = %d\n', nst );
%
%  Set the formal matrix size
%
  m = 3 * nx * ny + 2 * nx + 2 * ny + 1;
  n = m;
  fprintf ( 1, '  Number of rows and columns N = %d\n', n );
%
%  Set a random vector.
%
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Create the ST matrix.
%
  fprintf ( 1, '  NX = %d\n', nx );
  fprintf ( 1, '  NY = %d\n', ny );
  fprintf ( 1, '  NST = %d\n', nst );
  seed = 123456789;
  [ ist, jst, ast, seed ] = wathen_st ( nx, ny, nst, seed );

  i_min = min ( ist );
  i_max = max ( ist );
  j_min = min ( jst );
  j_max = max ( jst );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );
%
%  Compute B1 = AST * X
%
  b1 = st_mv ( m, n, nst, ist, jst, ast, x );
%
%  Get the CC size.
%
  ncc = st_to_cc_size ( nst, ist, jst );

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
%  Compute B2 = ACC * X.
%
  b2 = cc_mv ( m, n, ncc, icc, ccc, acc, x );
%
%  Compare B1 and B2.
%
  r = norm ( b1(1:n) - b2(1:n) );
  fprintf ( 1, '  || ACC*X - AST*X|| = %g\n', r );

  return
end

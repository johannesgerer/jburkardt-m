function st_to_cc_test01 ( )

%*****************************************************************************80
%
%% ST_TO_CC_TEST01 tests ST_TO_CC using a tiny matrix.
%
%  Discussion:
%
%    This test uses a trivial matrix whose full representation is:
%
%          2  3  0  0  0
%          3  0  4  0  6
%      A = 0 -1 -3  2  0
%          0  0  1  0  0
%          0  4  2  0  1
%
%    A (1-based) ST representation, reading in order by rows is:
%
%      I  J   A
%     -- --  --
%      1  1   2
%      1  2   3
%
%      2  1   3
%      2  3   4
%      2  5   6
%
%      3  2  -1
%      3  3  -3
%      3  4   2
%
%      4  3   1
%
%      5  2   4
%      5  3   2
%      5  5   1
%
%    The CC representation (which goes in order by columns) is
%
%      #   I  JC   A
%     --  --  --  --
%      1   1   1   2
%      2   2       3
%
%      3   1   3   3
%      4   3      -1
%      5   5       4
%
%      6   2   6   4
%      7   3      -3
%      8   4       1
%      9   5       2
%
%     10   3  10   2
%
%     11   2  11   6
%     12   5       1
%
%     13   *  13
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
  nst = 12;

  ast = [ ...
    2.0,  3.0, ...
    3.0,  4.0,  6.0, ...
   -1.0, -3.0,  2.0, ...
    1.0, ...
    4.0,  2.0,  1.0 ]';
  ist = [ ...
    1, 1, ...
    2, 2, 2, ...
    3, 3, 3, ...
    4, ...
    5, 5, 5 ]';
  jst = [ ...
    1, 2, ...
    1, 3, 5, ...
    2, 3, 4, ...
    3, ...
    2, 3, 5 ]';
  m = 5;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_CC_TEST01\n' );
  fprintf ( 1, '  Convert a sparse matrix from ST to CC format.\n' );
  fprintf ( 1, '  ST: sparse triplet,    I, J,  A.\n' );
  fprintf ( 1, '  CC: compressed column, I, CC, A.\n' );

  i_min = min ( ist );
  i_max = max ( ist );
  j_min = min ( jst );
  j_max = max ( jst );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );
%
%  Print the ST matrix.
%
  st_print ( m, n, nst, ist, jst, ast, '  The matrix in ST format:' );
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
  cc_print ( m, n, ncc, icc, ccc, acc, '  CC Matrix:' );

  return
end

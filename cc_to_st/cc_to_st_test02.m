function cc_to_st_test02 ( )

%*****************************************************************************80
%
%% CC_TO_ST_TEST02 tests CC_TO_ST using a 0-based matrix.
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
%    The 0-based CC representation is
%
%      #  ICC  CCC  ACC
%     --  ---  ---  ---
%      0    0    0    2
%      1    1         3
%
%      2    0    2    3
%      3    2        -1
%      4    4         4
%
%      5    1    5    4
%      6    2        -3
%      7    3         1
%      8    4         2
%
%      9    2    9    2
%
%     10    1   10    6
%     11    4         1
%
%     12    *   12
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
  ncc = 12;

  acc = [ ...
    2.0,  3.0, ...
    3.0, -1.0,  4.0, ...
    4.0, -3.0,  1.0, 2.0, ...
    2.0, ...
    6.0, 1.0 ];
  ccc = [ ...
    0, 2, 5, 9, 10, 12 ];
  icc = [ ...
    0, 1, ...
    0, 2, 4, ...
    1, 2, 3, 4, ...
    2, ...
    1, 4  ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_TO_ST_TEST02\n' );
  fprintf ( 1, '  Convert a 0-based CC matrix to ST format.\n' );
%
%  Print the CC matrix.
%
  cc_print ( m, n, ncc, icc, ccc, acc, '  The CC matrix:' );
%
%  Convert it.
%
  [ nst, ist, jst, ast ] = cc_to_st ( m, n, ncc, icc, ccc, acc );
%
%  Print the ST matrix.
%
  st_print ( m, n, nst, ist, jst, ast, '  The ST matrix:' );

  return
end

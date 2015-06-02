function cc_io_test01 ( )

%*****************************************************************************80
%
%% CC_IO_TEST01 tests CC_WRITE using a tiny matrix.
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
%    The 1-based CC representation is
%
%      #  ICC  CCC  ACC
%     --  ---  ---  ---
%      1    1    1    2
%      2    2         3
%
%      3    1    3    3
%      4    3        -1
%      5    5         4
%
%      6    2    6    4
%      7    3        -3
%      8    4         1
%      9    5         2
%
%     10    3   10    2
%
%     11    2   11    6
%     12    5         1
%
%     13    *   13
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2014
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
    1, 3, 6, 10, 11, 13 ];
  icc = [ ...
    1, 2, ...
    1, 3, 5, ...
    2, 3, 4, 5, ...
    3, ...
    2, 5 ];
  prefix = 'simple';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_IO_TEST01\n' );
  fprintf ( 1, '  Write a sparse matrix in CC format to 3 files.\n' );
%
%  Full storage statistics
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full rows    M = %d\n', m );
  fprintf ( 1, '  Full columns N = %d\n', n );
  fprintf ( 1, '  Full storage   = %d\n', m * n );
%
%  Print the CC matrix.
%
  cc_print ( m, n, ncc, icc, ccc, acc, '  The matrix in 1-based CC format:' );
%
%  Write the matrix to 3 files.
%
  cc_write ( prefix, ncc, n, icc, ccc, acc );

  return
end
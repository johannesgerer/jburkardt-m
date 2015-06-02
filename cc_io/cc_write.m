function cc_write ( prefix, ncc, n, icc, ccc, acc )

%*****************************************************************************80
%
%% CC_WRITE writes a sparse matrix in CC format to 3 files.
%
%  Discussion:
%
%    Three files will be created:
%    * prefix_icc.txt contains NCC ICC values;
%    * prefix_ccc.txt contains N+1 CCC values;
%    * prefix_acc.txt contains NCC ACC values.
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
%  Parameters:
%
%    Input, string PREFIX, a common prefix for the filenames.
%
%    Input, integer NCC, the number of CC elements.
%
%    Input, integer N, the number of columns in the matrix.
%
%    Input, integer ICC(NCC), the CC rows.
%
%    Input, integer CCC(N+1), the compressed CC columns.
%
%    Input, real ACC(NCC), the CC values.
%
  filename_icc = strcat ( prefix, '_icc.txt' );
  i4vec_write ( filename_icc, ncc, icc );

  filename_ccc = strcat ( prefix, '_ccc.txt' );
  i4vec_write ( filename_ccc, n + 1, ccc );

  filename_acc = strcat ( prefix, '_acc.txt' );
  r8vec_write ( filename_acc, ncc, acc );

  return
end
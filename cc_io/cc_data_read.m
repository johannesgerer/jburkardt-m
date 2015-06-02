function [ icc, ccc, acc ] = cc_data_read ( prefix, ncc, n )

%*****************************************************************************80
%
%% CC_DATA_READ reads data about a sparse matrix in CC format.
%
%  Discussion:
%
%    Three files are presumed to exist:
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
%    19 July 2014
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
%    Output, integer ICC(NCC), the CC rows.
%
%    Output, integer CCC(N+1), the compressed CC columns.
%
%    Output, real ACC(NCC), the CC values.
%
  filename_icc = strcat ( prefix, '_icc.txt' );
  icc = i4vec_data_read ( filename_icc, ncc );

  filename_ccc = strcat ( prefix, '_ccc.txt' );
  ccc = i4vec_data_read ( filename_ccc, n + 1 );

  filename_acc = strcat ( prefix, '_acc.txt' );
  acc = r8vec_data_read ( filename_acc, ncc );

  return
end
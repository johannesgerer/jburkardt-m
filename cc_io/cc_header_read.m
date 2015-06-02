function [ ncc, n ] = cc_header_read ( prefix )

%*****************************************************************************80
%
%% CC_HEADER_READ reads header information about a sparse matrix in CC format.
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
%    Output, integer NCC, the number of CC elements.
%
%    Output, integer N, the number of columns in the matrix.
%
  filename_icc = strcat ( prefix, '_icc.txt' );
  ncc = file_row_count ( filename_icc );

  filename_ccc = strcat ( prefix, '_ccc.txt' );
  n = file_row_count ( filename_ccc );
  n = n - 1;

  return
end
function colind = hb_ua_colind ( ncol, colptr )

%*****************************************************************************80
%
%% HB_UA_COLUMN_INDEX creates a column index for an unsymmetric assembled matrix.
%
%  Discussion:
%
%    It is assumed that the input data corresponds to a Harwell-Boeing
%    matrix which is unsymmetric, and assembled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer NCOL, the number of columns.
%
%    Input, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Output, integer COLIND(NNZERO), the column index of each matrix value.
%
  for i = 1 : ncol
    colind(colptr(i):colptr(i+1)-1) = i;
  end

  return
end

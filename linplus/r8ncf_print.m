function r8ncf_print ( m, n, nz_num, rowcol, a, title )

%*****************************************************************************80
%
%% R8NCF_PRINT prints a R8NCF matrix.
%
%  Discussion:
%
%    The R8NCF storage format stores NZ_NUM, the number of nonzeros, 
%    a real array containing the nonzero values, a 2 by NZ_NUM integer 
%    array storing the row and column of each nonzero entry.
%
%    The R8NCF format is used by NSPCG.  NSPCG requires that the information
%    for the diagonal entries of the matrix must come first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer ROWCOL(2,NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, string TITLE, a title.
%
  r8ncf_print_some ( m, n, nz_num, rowcol, a, 1, 1, m, n, title );

  return
end

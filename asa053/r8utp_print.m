function r8utp_print ( n, a, title )

%*****************************************************************************80
%
%% R8UTP_PRINT prints a R8UTP matrix.
%
%  Discussion:
%
%    The R8UTP storage format is appropriate for an upper triangular
%    matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A((N*(N+1))/2), the matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8utp_print_some ( n, a, 1, 1, n, n, title );

  return
end

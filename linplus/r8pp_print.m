function r8pp_print ( n, a, title )

%*****************************************************************************80
%
%% R8PP_PRINT prints a R8PP matrix.
%
%  Discussion:
%
%    The R8PP storage format is appropriate for a symmetric positive
%    definite matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
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
%    Input, real A((N*(N+1))/2), the R8PP matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8pp_print_some ( n, a, 1, 1, n, n, title );

  return
end

function r8sto_print ( n, a, title )

%*****************************************************************************80
%
%% R8STO_PRINT prints a R8STO matrix.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
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
%
%    Input, real A(N), the R8STO matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8sto_print_some ( n, a, 1, 1, n, n, title );

  return
end

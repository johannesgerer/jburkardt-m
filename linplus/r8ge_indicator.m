function a = r8ge_indicator ( m, n )

%*****************************************************************************80
%
%% R8GE_INDICATOR sets up a R8GE indicator matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Output, real A(M,N), the R8GE matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = fac * i + j;
    end
  end

  return
end

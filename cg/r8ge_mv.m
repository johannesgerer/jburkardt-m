function b = r8ge_mv ( m, n, a, x )

%*****************************************************************************80
%
%% R8GE_MV multiplies an R8GE matrix by an R8VEC.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each entry.  The two dimensional logical
%    array can be thought of as a vector of M*N entries, starting with
%    the M entries in the column 1, then the M entries in column 2
%    and so on.  Considered as a vector, the entry A(I,J) is then stored
%    in vector location I+(J-1)*M.
%
%    R8GE storage is used by LINPACK and LAPACK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 January 1999
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
%    Input, real A(M,N), the R8GE matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  b(1:m,1) = a * x;

  return
end

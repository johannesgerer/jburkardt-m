function r = r8ge_res ( m, n, a, x, b )

%*****************************************************************************80
%
%% R8GE_RES computes the residual vector for a R8GE system.
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
%    20 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%    M and N must be positive.
%
%    Input, real A(M,N), the original, UNFACTORED R8GE matrix.
%
%    Input, real X(N), the estimated solution.
%
%    Input, real B(M), the right hand side vector.
%
%    Output, real R(M), the residual vector, b - A * x.
%
  r(1:m) = b(1:m) - ( a(1:m,1:n) * x(1:n)' )';

  return
end

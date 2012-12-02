function c = r8ge_mxm ( n, a, b )

%*****************************************************************************80
%
%% R8GE_MXM multiplies two R8GE matrices.
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
%    15 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, real A(N,N), B(N,N), the R8GE factor matrices.
%
%    Output, real C(N,N), the R8GE product matrix.
%
  c(1:n,1:n) = a(1:n,1:n) * b(1:n,1:n);

  return
end

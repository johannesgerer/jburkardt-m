function b = r8sto_to_r8ge ( n, a, b )

%*****************************************************************************80
%
%% R8STO_TO_R8GE copies a R8STO matrix to a R8GE matrix.
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
%    16 February 2004
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    b(i,1:i-1) = a(i:-1:2);
    b(i,i:n) = a(1:n-i+1);
  end

  return
end

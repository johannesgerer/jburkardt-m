function b = r8sto_mxv ( n, a, x, b )

%*****************************************************************************80
%
%% R8STO_MXV multiplies a R8STO matrix times a vector.
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
%    19 March 2004
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
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  for i = 1 : n
    b(i) = a(i:-1:2) * x(1:i-1)' + a(1:n+1-i) * x(i:n)';
  end

  return
end

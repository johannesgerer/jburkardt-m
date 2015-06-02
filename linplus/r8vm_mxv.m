function b = r8vm_mxv ( m, n, a, x )

%*****************************************************************************80
%
%% R8VM_MXV multiplies a R8VM matrix times a vector.
%
%  Discussion:
%
%    The R8VM storage format is used for an M by N Vandermonde matrix.
%    An M by N Vandermonde matrix is defined by the values in its second
%    row, which will be written here as X(1:N).  The matrix has a first 
%    row of 1's, a second row equal to X(1:N), a third row whose entries
%    are the squares of the X values, up to the M-th row whose entries
%    are the (M-1)th powers of the X values.  The matrix can be stored
%    compactly by listing just the values X(1:N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(N,1), the R8VM matrix.
%
%    Input, real X(N,1), the vector to be multiplied by A.
%
%    Output, real B(M,1), the product A * x.
%
  a = a(:);
  x = x(:);
  b = zeros(m,1);

  for i = 1 : m
    b(i,1) = 0.0;
    for j = 1 : n
      if ( i == 1 )
        b(i,1) = b(i,1) + x(j,1);
      else
        b(i,1) = b(i,1) + a(j,1)^(i-1) * x(j,1);
      end
    end
  end

  return
end

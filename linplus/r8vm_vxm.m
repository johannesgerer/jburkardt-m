function b = r8vm_vxm ( m, n, a, x )

%*****************************************************************************80
%
%% R8VM_VXM multiplies a vector by a R8VM matrix.
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
%    05 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(N), the R8VM matrix.
%
%    Input, real X(M), the vector to be multiplied by A.
%
%    Output, real B(N), the product A' * x.
%
  for j = 1 : n
    b(j) = 0.0E+00;
    for i = 1 : m
      if ( i == 1 )
        b(j) = b(j) + x(i);
      else
        b(j) = b(j) + a(j)^(i-1) * x(i);
      end
    end
  end

  return
end

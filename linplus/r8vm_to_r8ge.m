function b = r8vm_to_r8ge ( m, n, a, b )

%*****************************************************************************80
%
%% R8VM_TO_R8GE copies a R8VM matrix to a R8GE matrix.
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
%    Input, real A(N,1), the R8VM matrix.
%
%    Output, real B(M,N), the R8GE matrix.
%
  a = a(:);

  for i = 1 : m
    for j = 1 : n
      if ( i == 1 )
        b(i,j) = 1.0;
      else
        b(i,j) = b(i-1,j) * a(j,1);
      end
    end
  end

  return
end

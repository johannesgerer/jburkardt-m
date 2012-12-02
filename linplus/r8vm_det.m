function det = r8vm_det ( n, a )

%*****************************************************************************80
%
%% R8VM_DET computes the determinant of a R8VM matrix.
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
%    Input, integer N, the number of rows and columns of the matrix.
%
%    Input, real A(N), the R8VM matrix.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;
  for j = 1 : n
    for i = j+1 : n
      det = det * ( a(i) - a(j) );
    end
  end

  return
end

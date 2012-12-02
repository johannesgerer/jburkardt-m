function det = r8ge_np_det ( n, a_lu )

%*****************************************************************************80
%
%% R8GE_NP_DET computes the determinant of a matrix factored by R8GE_NP_FA.
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
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_NP_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0E+00;

  for i = 1 : n
    det = det * a_lu(i,i);
  end

  return
end

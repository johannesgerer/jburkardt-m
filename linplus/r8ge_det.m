function det = r8ge_det ( n, a_lu, pivot )

%*****************************************************************************80
%
%% R8GE_DET computes the determinant of a matrix factored by R8GE_FA or R8GE_TRF.
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
%    25 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_FA or R8GE_TRF.
%
%    Input, integer PIVOT(N), as computed by R8GE_FA or R8GE_TRF.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for i = 1 : n
    det = det * a_lu(i,i);
    if ( pivot(i) ~= i )
      det = -det;
    end
  end

  return
end

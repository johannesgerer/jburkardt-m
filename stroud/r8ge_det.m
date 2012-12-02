function det = r8ge_det ( a_lu, n, pivot )

%*****************************************************************************80
%
%% R8GE_DET computes the determinant of a matrix factored by R8GE_FA or R8GE_TRF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A_LU(N,N), the LU factors computed by R8GE_FA
%    or R8GE_TRF.
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), as computed by R8GE_FA or R8GE_TRF.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0E+00;

  for i = 1 : n
    det = det * a_lu(i,i);
  end

  for i = 1 : n
    if ( pivot(i) ~= i )
      det = -det;
    end
  end

  return
end

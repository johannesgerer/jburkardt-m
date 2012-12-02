function det = r8plu_det ( n, pivot, lu )

%*****************************************************************************80
%
%% R8PLU_DET computes the determinant of an R8PLU matrix.
%
%  Discussion:
%
%    The matrix should have been factored by R8MAT_TO_R8PLU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8MAT_TO_R8PLU.
%
%    Input, real LU(N,N), the LU factors computed by R8MAT_TO_R8PLU.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for i = 1 : n
    det = det * lu(i,i);
    if ( pivot(i) ~= i )
      det = -det;
    end
  end

  return
end

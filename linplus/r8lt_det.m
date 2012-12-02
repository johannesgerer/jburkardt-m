function det = r8lt_det ( n, a )

%*****************************************************************************80
%
%% R8LT_DET computes the determinant of a R8LT matrix.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
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
%    Input, real A(N,N), the R8LT matrix.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for i = 1 : n
    det = det * a(i,i);
  end

  return
end

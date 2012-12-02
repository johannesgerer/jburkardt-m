function det = r8ut_det ( n, a )

%*****************************************************************************80
%
%% R8UT_DET computes the determinant of a R8UT matrix.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2004
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
%    Input, real A(N,N), the R8UT matrix.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;
  for i = 1 : n
    det = det * a(i,i);
  end

  return
end

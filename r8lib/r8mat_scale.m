function a = r8mat_scale ( m, n, s, a )

%*****************************************************************************80
%
%% R8MAT_SCALE multiplies an R8MAT by a scalar.
%
%  Discussion:
%
%    An R8MAT is an array of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real S, the scale factor.
%
%    Input/output, real A(M,N), the matrix to be scaled.
%
  a(1:m,1:n) = a(1:m,1:n) * s;

  return
end
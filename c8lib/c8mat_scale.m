function a = c8mat_scale ( m, n, alpha, a )

%*****************************************************************************80
%
%% C8MAT_SCALE scales a C8MAT by a scalar factor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, complex ALPHA, the scale factor.
%
%    Output, complex A(M,N), the result.
%
  a(1:m,1:n) = alpha * a(1:m,1:n);

  return
end

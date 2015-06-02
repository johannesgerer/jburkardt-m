function error_frobenius = inverse_error ( n, a, b )

%*****************************************************************************80
%
%% INVERSE_ERROR determines the error in an inverse matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real B(N,N), the inverse.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of (A*B-I) + (B*A-I).
%
  error_frobenius = norm ( a * b - eye ( n ), 'fro' ) ...
                  + norm ( b * a - eye ( n ), 'fro' );

  return
end
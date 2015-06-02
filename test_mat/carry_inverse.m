function a = carry_inverse ( n, alpha )

%*****************************************************************************80
%
%% CARRY_INVERSE returns the inverse of the CARRY matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ALPHA, the numeric base being used in the addition.
%
%    Output, real A(N,N), the matrix.
%
  v = carry_eigen_left ( n, alpha );

  d = carry_eigenvalues ( n, alpha );
  d(1:n) = 1.0 ./ d(1:n);
  d_inv = diagonal ( n, n, d );

  u = carry_eigen_right ( n, alpha );

  a = u * d_inv * v / r8_factorial ( n );

  return
end

function a = carry_inverse ( alpha, n )

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
%    26 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ALPHA, the numeric base being used in the addition.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  v = carry_left ( n );

  d = carry_eigenvalues ( alpha, n );
  d(1:n) = 1.0 ./ d(1:n);
  d_inv = diagonal ( n, n, d );

  u = carry_right ( n );

  a = u * d_inv * v / r8_factorial ( n );

  return
end

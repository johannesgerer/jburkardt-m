function lambda = tris_eigenvalues ( n, x, y, z )

%*****************************************************************************80
%
%% TRIS_EIGENVALUES returns the eigenvalues of the TRIS matrix.
%
%  Discussion:
%
%    The eigenvalues will be complex if X * Z < 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X, Y, Z, the scalars that define A.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    angle = i * pi / ( n + 1 );
    lambda(i,1) = y + 2.0 * sqrt ( x * z ) * cos ( angle );
  end

  return
end

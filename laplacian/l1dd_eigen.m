function [ v, lambda ] = l1dd_eigen ( n, h )

%*****************************************************************************80
%
%% L1DD_EIGEN returns eigeninformation for the 1D DD Laplacian.
%
%  Discussion:
%
%    The grid points are assumed to be evenly spaced by H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real H, the spacing between points.
%
%    Output, real V(N,N), the eigenvectors.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda = zeros ( n, 1 );
  v = zeros ( n, n );

  for j = 1 : n
    theta = 0.5 * pi * j / ( n + 1.0 );
    lambda(j) = 4.0 * ( sin ( theta ) / h ) ^ 2;
    for i = 1 : n
      theta = pi * i * j / ( n + 1.0 );
      v(i,j) = sqrt ( 2.0 / ( n + 1.0 ) ) * sin ( theta );
    end
  end

  return
end